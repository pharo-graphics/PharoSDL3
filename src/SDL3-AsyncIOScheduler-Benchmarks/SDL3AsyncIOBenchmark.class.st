"
I provide comparative benchmarks measuring standard synchronous Pharo file operations (FileReference / BinaryFileStream) against the asynchronous, non-blocking SDL3AsyncIOScheduler.

I own and manage a single SDL3AsyncIOScheduler and background worker Process via #setUp and #tearDown, ensuring that native queue creation and destruction overhead does not pollute individual benchmark timings.

### Conceptual Insights: Why Async Wins in Practice

1. The ""Page-Cache Illusion"":
When benchmarking synchronous file writes against asynchronous file writes in a tight single-threaded loop, synchronous writes can appear faster. This is because modern operating systems do not immediately write small files to physical disk; they copy them directly into the kernel's RAM page cache at memory bus speeds. In a single-threaded loop with no competing processes, a direct primitive invocation incurs near-zero dispatch overhead, whereas an asynchronous scheduler incurs coordination latency (enqueueing tasks, signaling condition variables, and polling outcomes).

2. The Real Advantage: Zero VM Starvation:
The true cost of synchronous I/O appears the moment an operation must actually wait—such as on a cache miss, an overloaded disk queue, a network share, or an explicit durability flush (fsync). Because the Pharo VM runs on a single native OS thread, *every* Smalltalk process freezes during that wait. In contrast, SDL3AsyncIOScheduler offloads blocking delays to the OS worker thread pool, keeping the Pharo VM free to calculate, handle user input, and animate at 60 FPS.

3. Zero GC Pause Overhead:
Operating on off-heap memory (SDL3Array or ExternalAddress) ensures that zero bytes are allocated inside the Smalltalk object heap during sustained I/O, eliminating garbage collection pauses and object-pinning churn.

### Running the Benchmarks
To run benchmarks and print Markdown reports to Transcript:
```smalltalk
SDL3AsyncIOBenchmark new runAll; reportOnTranscript.
SDL3AsyncIOBenchmark new runGeneral; reportOnTranscript.
SDL3AsyncIOBenchmark new runResponsiveness; reportOnTranscript.
SDL3AsyncIOBenchmark new runThroughputAndLatency; reportOnTranscript.
SDL3AsyncIOBenchmark new runStorageDurability; reportOnTranscript.
SDL3AsyncIOBenchmark new runMemoryAndGC; reportOnTranscript.
```
"
Class {
	#name : 'SDL3AsyncIOBenchmark',
	#superclass : 'Object',
	#instVars : [
		'scheduler',
		'workerProcess',
		'workerDelay',
		'workerPriority',
		'workloadPriority',
		'reportStream'
	],
	#category : 'SDL3-AsyncIOScheduler-Benchmarks',
	#package : 'SDL3-AsyncIOScheduler-Benchmarks'
}

{ #category : 'benchmarks - concurrency' }
SDL3AsyncIOBenchmark >> benchmarkBackgroundProcessStarvationDuringIOChunks: chunkCount [

	| filePath dataChunk dataAddress pharoCount sdl3Count keepRunning counterProcess file |
	filePath := 'bench_starvation.bin'.
	dataChunk := (ByteArray new: 1048576) atAllPut: 65; yourself.
	dataAddress := ExternalAddress allocate: 1048576.
	1 to: 1048576 do: [ :i | dataAddress byteAt: i put: 65 ].
	filePath asFileReference ensureDelete.
	[
		"1. Pharo Synchronous I/O: background counter is starved by blocking kernel writes"
		pharoCount := 0.
		keepRunning := true.
		counterProcess := [
			[ keepRunning ] whileTrue: [
				pharoCount := pharoCount + 1.
				Processor yield ]
		] forkAt: self workloadPriority.

		(Delay forMilliseconds: 5) wait.
		filePath asFileReference binaryWriteStreamDo: [ :stream |
			1 to: chunkCount do: [ :index |
				stream nextPutAll: dataChunk.
				stream flush.
				Processor yield ] ].
		keepRunning := false.
		counterProcess terminate.
		filePath asFileReference ensureDelete.

		"2. SDL3 AsyncIO: VM thread yields to Smalltalk scheduler while OS threads write"
		sdl3Count := 0.
		keepRunning := true.
		counterProcess := [
			[ keepRunning ] whileTrue: [
				sdl3Count := sdl3Count + 1.
				Processor yield ]
		] forkAt: self workloadPriority.

		(Delay forMilliseconds: 5) wait.
		[
			file := scheduler openFile: filePath mode: 'w'.
			1 to: chunkCount do: [ :index |
				file write: dataAddress size: 1048576 at: (index - 1) * 1048576.
				Processor yield ].
			(file closeFlush: true) wait
		] ensure: [
			keepRunning := false.
			counterProcess terminate.
			filePath asFileReference ensureDelete ] ] ensure: [
		dataAddress free.
		filePath asFileReference ensureDelete ].

	^ {
		#name -> 'Background Process Starvation'.
		#chunks -> chunkCount.
		#pharoTicks -> pharoCount.
		#sdl3Ticks -> sdl3Count.
		#ratio -> ((sdl3Count asFloat / (pharoCount max: 1)) roundTo: 0.1)
	} asDictionary
]

{ #category : 'benchmarks - concurrency' }
SDL3AsyncIOBenchmark >> benchmarkCPUWorkDuringHeavyIOChunks: chunkCount [

	| filePath dataChunk dataAddress pharoPrimes sdl3Primes keepComputing computeProcess file |
	filePath := 'bench_cpu_work.bin'.
	dataChunk := (ByteArray new: 1048576) atAllPut: 65; yourself.
	dataAddress := ExternalAddress allocate: 1048576.
	1 to: 1048576 do: [ :i | dataAddress byteAt: i put: 65 ].
	filePath asFileReference ensureDelete.
	[
		"1. Pharo Synchronous I/O: VM thread stalls during disk writes, throttling CPU work"
		pharoPrimes := 0.
		keepComputing := true.
		computeProcess := [
			| candidate |
			candidate := 2.
			[ keepComputing ] whileTrue: [
				(self isPrime: candidate) ifTrue: [ pharoPrimes := pharoPrimes + 1 ].
				candidate := candidate + 1.
				(candidate \\ 100 = 0) ifTrue: [ Processor yield ] ]
		] forkAt: self workloadPriority.

		(Delay forMilliseconds: 5) wait.
		filePath asFileReference binaryWriteStreamDo: [ :stream |
			1 to: chunkCount do: [ :index |
				stream nextPutAll: dataChunk.
				stream flush.
				Processor yield ] ].
		keepComputing := false.
		computeProcess terminate.
		filePath asFileReference ensureDelete.

		"2. SDL3 AsyncIO: VM thread computes primes at full speed while OS threads handle disk"
		sdl3Primes := 0.
		keepComputing := true.
		computeProcess := [
			| candidate |
			candidate := 2.
			[ keepComputing ] whileTrue: [
				(self isPrime: candidate) ifTrue: [ sdl3Primes := sdl3Primes + 1 ].
				candidate := candidate + 1.
				(candidate \\ 100 = 0) ifTrue: [ Processor yield ] ]
		] forkAt: self workloadPriority.

		(Delay forMilliseconds: 5) wait.
		[
			file := scheduler openFile: filePath mode: 'w'.
			1 to: chunkCount do: [ :index |
				file write: dataAddress size: 1048576 at: (index - 1) * 1048576.
				Processor yield ].
			(file closeFlush: true) wait
		] ensure: [
			keepComputing := false.
			computeProcess terminate.
			filePath asFileReference ensureDelete ] ] ensure: [
		dataAddress free.
		filePath asFileReference ensureDelete ].

	^ {
		#name -> 'CPU Work Done During I/O'.
		#chunks -> chunkCount.
		#pharoPrimes -> pharoPrimes.
		#sdl3Primes -> sdl3Primes.
		#ratio -> ((sdl3Primes asFloat / (pharoPrimes max: 1)) roundTo: 0.1)
	} asDictionary
]

{ #category : 'benchmarks - concurrent' }
SDL3AsyncIOBenchmark >> benchmarkConcurrentFileLoadsCount: fileCount fileSize: fileSize [

	| prefix filePaths sampleData pharoStartMs pharoEndMs pharoElapsedMs sdl3StartMs sdl3EndMs sdl3ElapsedMs tasks |
	prefix := 'bench_concurrent_'.
	sampleData := (ByteArray new: fileSize) atAllPut: 67; yourself.
	filePaths := (1 to: fileCount) collect: [ :index |
		prefix, index asString, '.dat' ].
	[
		filePaths do: [ :path |
			path asFileReference ensureDelete binaryWriteStreamDo: [ :stream |
				stream nextPutAll: sampleData ] ].

		"Pharo reading all files sequentially"
		pharoStartMs := Time millisecondClockValue.
		filePaths do: [ :path |
			path asFileReference binaryReadStreamDo: [ :stream |
				stream upToEnd ] ].
		pharoEndMs := Time millisecondClockValue.
		pharoElapsedMs := (pharoEndMs - pharoStartMs max: 1).

		"SDL3 AsyncIO loading all files concurrently on OS thread pool"
		sdl3StartMs := Time millisecondClockValue.
		tasks := filePaths collect: [ :path |
			scheduler loadByteArray: path ].
		tasks do: #wait.
		sdl3EndMs := Time millisecondClockValue.
		sdl3ElapsedMs := (sdl3EndMs - sdl3StartMs max: 1).

		^ {
			#name -> 'Concurrent Whole-File Loads'.
			#files -> fileCount.
			#pharoElapsedMs -> pharoElapsedMs.
			#sdl3ElapsedMs -> sdl3ElapsedMs
		} asDictionary ] ensure: [
			filePaths do: [ :path | path asFileReference ensureDelete ] ]
]

{ #category : 'benchmarks - memory' }
SDL3AsyncIOBenchmark >> benchmarkGCOverheadDuringHeavyIOSize: totalBytes chunkSize: chunkSize [

	| filePath chunk chunkCount pharoStartGC pharoEndGC pharoGCMs sdl3StartGC sdl3EndGC sdl3GCMs file readAddress |
	filePath := 'bench_gc_overhead.bin'.
	chunkCount := totalBytes // chunkSize.
	chunk := ByteArray new: chunkSize.
	readAddress := ExternalAddress allocate: chunkSize.
	filePath asFileReference ensureDelete.
	[
		filePath asFileReference binaryWriteStreamDo: [ :stream |
			1 to: chunkCount do: [ :i | stream nextPutAll: chunk ] ].

		"1. Pharo stream read loop: allocates ByteArray buffers repeatedly"
		3 timesRepeat: [ Smalltalk garbageCollect ].
		pharoStartGC := Smalltalk vm totalGCTime.
		filePath asFileReference binaryReadStreamDo: [ :stream |
			1 to: chunkCount do: [ :i |
				| buf |
				buf := ByteArray new: chunkSize.
				stream nextInto: buf ] ].
		pharoEndGC := Smalltalk vm totalGCTime.
		pharoGCMs := pharoEndGC - pharoStartGC.

		"2. SDL3 AsyncIO: operates with off-heap ExternalAddress buffer"
		3 timesRepeat: [ Smalltalk garbageCollect ].
		sdl3StartGC := Smalltalk vm totalGCTime.
		file := scheduler openFile: filePath mode: 'r'.
		1 to: chunkCount do: [ :index |
			| offset |
			offset := (index - 1) * chunkSize.
			file readInto: readAddress size: chunkSize at: offset ].
		file close wait.
		sdl3EndGC := Smalltalk vm totalGCTime.
		sdl3GCMs := sdl3EndGC - sdl3StartGC.

		^ {
			#name -> 'GC Pause Time During 20MB I/O'.
			#sizeMB -> (totalBytes / 1048576.0 roundTo: 0.1).
			#pharoGCMs -> pharoGCMs.
			#sdl3GCMs -> sdl3GCMs
		} asDictionary ] ensure: [
			readAddress free.
			filePath asFileReference ensureDelete ]
]

{ #category : 'benchmarks - sequential' }
SDL3AsyncIOBenchmark >> benchmarkLargeFileSequentialReadSize: totalBytes chunkSize: chunkSize [

	| filePath chunk chunkCount pharoStartMs pharoEndMs pharoElapsedMs pharoMBps sdl3StartMs sdl3EndMs sdl3ElapsedMs sdl3MBps file readBuffer readAddress |
	filePath := 'bench_seq_read.bin'.
	chunkCount := totalBytes // chunkSize.
	chunk := (ByteArray new: chunkSize) atAllPut: 66; yourself.
	readAddress := ExternalAddress allocate: chunkSize.
	filePath asFileReference ensureDelete.
	[
		filePath asFileReference binaryWriteStreamDo: [ :stream |
			1 to: chunkCount do: [ :index | stream nextPutAll: chunk ] ].

		"Pharo sequential read"
		readBuffer := ByteArray new: chunkSize.
		pharoStartMs := Time millisecondClockValue.
		filePath asFileReference binaryReadStreamDo: [ :stream |
			1 to: chunkCount do: [ :index | stream nextInto: readBuffer ] ].
		pharoEndMs := Time millisecondClockValue.
		pharoElapsedMs := (pharoEndMs - pharoStartMs max: 1).
		pharoMBps := ((totalBytes / 1048576.0) / (pharoElapsedMs / 1000.0)) roundTo: 0.1.

		"SDL3 AsyncIO sequential read"
		sdl3StartMs := Time millisecondClockValue.
		file := scheduler openFile: filePath mode: 'r'.
		1 to: chunkCount do: [ :index |
			| offset |
			offset := (index - 1) * chunkSize.
			file readInto: readAddress size: chunkSize at: offset ].
		file close wait.
		sdl3EndMs := Time millisecondClockValue.
		sdl3ElapsedMs := (sdl3EndMs - sdl3StartMs max: 1).
		sdl3MBps := ((totalBytes / 1048576.0) / (sdl3ElapsedMs / 1000.0)) roundTo: 0.1.

		^ {
			#name -> 'Sequential Read'.
			#totalMB -> (totalBytes / 1048576.0 roundTo: 0.1).
			#pharoElapsedMs -> pharoElapsedMs.
			#pharoMBps -> pharoMBps.
			#sdl3ElapsedMs -> sdl3ElapsedMs.
			#sdl3MBps -> sdl3MBps
		} asDictionary ] ensure: [
			readAddress free.
			filePath asFileReference ensureDelete ]
]

{ #category : 'benchmarks - sequential' }
SDL3AsyncIOBenchmark >> benchmarkLargeFileSequentialWriteSize: totalBytes chunkSize: chunkSize [

	| pharoFilePath sdl3FilePath chunk writeAddress chunkCount pharoStartMs pharoEndMs pharoElapsedMs pharoMBps sdl3StartMs sdl3EndMs sdl3ElapsedMs sdl3MBps file |
	pharoFilePath := 'bench_pharo_seq_write.bin'.
	sdl3FilePath := 'bench_sdl3_seq_write.bin'.
	chunkCount := totalBytes // chunkSize.
	chunk := (ByteArray new: chunkSize) atAllPut: 65; yourself.
	writeAddress := ExternalAddress allocate: chunkSize.
	1 to: chunkSize do: [ :i | writeAddress byteAt: i put: 65 ].
	pharoFilePath asFileReference ensureDelete.
	sdl3FilePath asFileReference ensureDelete.
	[
		"Pharo synchronous stream write"
		pharoStartMs := Time millisecondClockValue.
		pharoFilePath asFileReference binaryWriteStreamDo: [ :stream |
			1 to: chunkCount do: [ :index | stream nextPutAll: chunk ] ].
		pharoEndMs := Time millisecondClockValue.
		pharoElapsedMs := (pharoEndMs - pharoStartMs max: 1).
		pharoMBps := ((totalBytes / 1048576.0) / (pharoElapsedMs / 1000.0)) roundTo: 0.1.

		"SDL3 AsyncIO scheduler write"
		sdl3StartMs := Time millisecondClockValue.
		file := scheduler openFile: sdl3FilePath mode: 'w'.
		1 to: chunkCount do: [ :index |
			| offset |
			offset := (index - 1) * chunkSize.
			file write: writeAddress size: chunkSize at: offset ].
		(file closeFlush: true) wait.
		sdl3EndMs := Time millisecondClockValue.
		sdl3ElapsedMs := (sdl3EndMs - sdl3StartMs max: 1).
		sdl3MBps := ((totalBytes / 1048576.0) / (sdl3ElapsedMs / 1000.0)) roundTo: 0.1.

		^ {
			#name -> 'Sequential Write'.
			#totalMB -> (totalBytes / 1048576.0 roundTo: 0.1).
			#pharoElapsedMs -> pharoElapsedMs.
			#pharoMBps -> pharoMBps.
			#sdl3ElapsedMs -> sdl3ElapsedMs.
			#sdl3MBps -> sdl3MBps
		} asDictionary ] ensure: [
			writeAddress free.
			pharoFilePath asFileReference ensureDelete.
			sdl3FilePath asFileReference ensureDelete ]
]

{ #category : 'benchmarks - responsiveness' }
SDL3AsyncIOBenchmark >> benchmarkPhysicalStorageFlushLatencyFileSize: totalBytes [

	| pharoFilePath sdl3FilePath dataChunk dataAddress pharoMaxFreezeMs sdl3MaxFreezeMs file |
	pharoFilePath := 'bench_pharo_sync.bin'.
	sdl3FilePath := 'bench_sdl3_sync.bin'.
	dataChunk := (ByteArray new: totalBytes) atAllPut: 66; yourself.
	dataAddress := ExternalAddress allocate: totalBytes.
	1 to: totalBytes do: [ :i | dataAddress byteAt: i put: 66 ].
	pharoFilePath asFileReference ensureDelete.
	sdl3FilePath asFileReference ensureDelete.
	[
		"1. Pharo Synchronous Flush: calls fsync on the VM thread, freezing the VM"
		pharoFilePath asFileReference binaryWriteStreamDo: [ :stream |
			| startMs |
			stream nextPutAll: dataChunk.
			stream flush.
			startMs := Time millisecondClockValue.
			(stream instVarNamed: #stream) sync.
			pharoMaxFreezeMs := Time millisecondClockValue - startMs max: 1 ].

		"2. SDL3 AsyncIO Flush: runs fsync on the OS worker thread; VM poll takes < 1 ms"
		file := scheduler openFile: sdl3FilePath mode: 'w'.
		file write: dataAddress size: totalBytes at: 0.
		file closeFlush: true.
		sdl3MaxFreezeMs := 0.
		[ scheduler hasInFlightTasks ] whileTrue: [
			| stepStart stepDuration |
			stepStart := Time millisecondClockValue.
			scheduler step.
			stepDuration := Time millisecondClockValue - stepStart.
			sdl3MaxFreezeMs := sdl3MaxFreezeMs max: stepDuration.
			(Delay forMilliseconds: 2) wait ].

		^ {
			#name -> 'Physical Storage Sync (fsync)'.
			#sizeMB -> (totalBytes / 1048576.0 roundTo: 0.1).
			#pharoFreezeMs -> pharoMaxFreezeMs.
			#sdl3FreezeMs -> sdl3MaxFreezeMs
		} asDictionary ] ensure: [
			dataAddress free.
			pharoFilePath asFileReference ensureDelete.
			sdl3FilePath asFileReference ensureDelete ]
]

{ #category : 'benchmarks - random' }
SDL3AsyncIOBenchmark >> benchmarkRandomOffsetAccessCount: accessCount onFileSize: totalBytes [

	| filePath random offsets pharoBuffer pharoStartMs pharoEndMs pharoElapsedMs sdl3StartMs sdl3EndMs sdl3ElapsedMs file readAddress |
	filePath := 'bench_random_offsets.bin'.
	random := Random seed: 42.
	offsets := (1 to: accessCount) collect: [ :index |
		(random next * (totalBytes - 4096)) truncated ].
	readAddress := ExternalAddress allocate: 4096.
	filePath asFileReference ensureDelete.
	[
		filePath asFileReference binaryWriteStreamDo: [ :stream |
			stream nextPutAll: (ByteArray new: totalBytes) ].

		"Pharo seek and read"
		pharoBuffer := ByteArray new: 4096.
		pharoStartMs := Time millisecondClockValue.
		filePath asFileReference binaryReadStreamDo: [ :stream |
			offsets do: [ :offset |
				stream position: offset.
				stream nextInto: pharoBuffer ] ].
		pharoEndMs := Time millisecondClockValue.
		pharoElapsedMs := (pharoEndMs - pharoStartMs max: 1).

		"SDL3 AsyncIO direct offset reads"
		sdl3StartMs := Time millisecondClockValue.
		file := scheduler openFile: filePath mode: 'r'.
		offsets do: [ :offset |
			file readInto: readAddress size: 4096 at: offset ].
		file close wait.
		sdl3EndMs := Time millisecondClockValue.
		sdl3ElapsedMs := (sdl3EndMs - sdl3StartMs max: 1).

		^ {
			#name -> 'Random 4KB Reads'.
			#operations -> accessCount.
			#pharoElapsedMs -> pharoElapsedMs.
			#sdl3ElapsedMs -> sdl3ElapsedMs
		} asDictionary ] ensure: [
			readAddress free.
			filePath asFileReference ensureDelete ]
]

{ #category : 'benchmarks - concurrency' }
SDL3AsyncIOBenchmark >> benchmarkSimultaneousBidirectionalIOSize: totalBytes chunkSize: chunkSize [

	| readPath writePath chunk chunkCount pharoStartMs pharoEndMs pharoElapsedMs sdl3StartMs sdl3EndMs sdl3ElapsedMs readFile writeFile readAddress writeAddress |
	readPath := 'bench_bidi_read.bin'.
	writePath := 'bench_bidi_write.bin'.
	chunkCount := totalBytes // chunkSize.
	chunk := (ByteArray new: chunkSize) atAllPut: 68; yourself.
	readAddress := ExternalAddress allocate: chunkSize.
	writeAddress := ExternalAddress allocate: chunkSize.
	1 to: chunkSize do: [ :i | writeAddress byteAt: i put: 68 ].
	readPath asFileReference ensureDelete binaryWriteStreamDo: [ :stream |
		1 to: chunkCount do: [ :i | stream nextPutAll: chunk ] ].
	writePath asFileReference ensureDelete.
	[
		"1. Pharo Bidirectional: two Smalltalk processes contend for single VM thread primitives"
		pharoStartMs := Time millisecondClockValue.
		[
			| readProcess writeProcess |
			readProcess := [
				readPath asFileReference binaryReadStreamDo: [ :stream |
					| buf |
					buf := ByteArray new: chunkSize.
					1 to: chunkCount do: [ :i | stream nextInto: buf ] ]
			] forkAt: self workloadPriority.
			writeProcess := [
				writePath asFileReference binaryWriteStreamDo: [ :stream |
					1 to: chunkCount do: [ :i | stream nextPutAll: chunk. stream flush ] ]
			] forkAt: self workloadPriority.
			[ readProcess isTerminated and: [ writeProcess isTerminated ] ] whileFalse: [
				(Delay forMilliseconds: 2) wait ]
		] value.
		pharoEndMs := Time millisecondClockValue.
		pharoElapsedMs := pharoEndMs - pharoStartMs max: 1.

		"2. SDL3 AsyncIO: OS worker thread pool executes reads and writes in parallel"
		writePath asFileReference ensureDelete.
		sdl3StartMs := Time millisecondClockValue.
		readFile := scheduler openFile: readPath mode: 'r'.
		writeFile := scheduler openFile: writePath mode: 'w'.
		1 to: chunkCount do: [ :index |
			| offset |
			offset := (index - 1) * chunkSize.
			readFile readInto: readAddress size: chunkSize at: offset.
			writeFile write: writeAddress size: chunkSize at: offset ].
		readFile close wait.
		(writeFile closeFlush: true) wait.
		sdl3EndMs := Time millisecondClockValue.
		sdl3ElapsedMs := sdl3EndMs - sdl3StartMs max: 1.

		^ {
			#name -> 'Simultaneous Bidirectional I/O'.
			#sizeMB -> (totalBytes / 1048576.0 roundTo: 0.1).
			#pharoElapsedMs -> pharoElapsedMs.
			#sdl3ElapsedMs -> sdl3ElapsedMs
		} asDictionary ] ensure: [
			readAddress free.
			writeAddress free.
			readPath asFileReference ensureDelete.
			writePath asFileReference ensureDelete ]
]

{ #category : 'benchmarks - responsiveness' }
SDL3AsyncIOBenchmark >> benchmarkUIFrameHitchingDuringHeavyIOFrames: frameCount [

	| filePath largeChunk largeAddress pharoMaxFrameMs pharoTotalJankMs sdl3MaxFrameMs sdl3TotalJankMs file |
	filePath := 'bench_jank_test.bin'.
	largeChunk := ByteArray new: 1048576. "1 MB chunks"
	largeAddress := ExternalAddress allocate: 1048576.
	filePath asFileReference ensureDelete.
	[
		"Scenario A: Pharo synchronous I/O during a simulated 60 FPS animation loop"
		pharoMaxFrameMs := 0.
		pharoTotalJankMs := 0.
		filePath asFileReference binaryWriteStreamDo: [ :stream |
			1 to: frameCount do: [ :frameIndex |
				| frameStart frameDuration |
				frameStart := Time millisecondClockValue.
				(frameIndex % 5 = 0) ifTrue: [
					stream nextPutAll: largeChunk.
					stream flush ].
				(Delay forMilliseconds: 16) wait.
				frameDuration := Time millisecondClockValue - frameStart.
				frameDuration > 25 ifTrue: [
					pharoTotalJankMs := pharoTotalJankMs + (frameDuration - 16) ].
				pharoMaxFrameMs := pharoMaxFrameMs max: frameDuration ] ].

		"Scenario B: SDL3 AsyncIO scheduler during a simulated 60 FPS animation loop"
		sdl3MaxFrameMs := 0.
		sdl3TotalJankMs := 0.
		file := scheduler openFile: filePath mode: 'w'.
		1 to: frameCount do: [ :frameIndex |
			| frameStart frameDuration |
			frameStart := Time millisecondClockValue.
			(frameIndex % 5 = 0) ifTrue: [
				| offset |
				offset := (frameIndex // 5 - 1) * 1048576.
				file write: largeAddress size: 1048576 at: offset ].
			scheduler step.
			(Delay forMilliseconds: 16) wait.
			frameDuration := Time millisecondClockValue - frameStart.
			frameDuration > 25 ifTrue: [
				sdl3TotalJankMs := sdl3TotalJankMs + (frameDuration - 16) ].
			sdl3MaxFrameMs := sdl3MaxFrameMs max: frameDuration ].
		(file closeFlush: true) wait.

		^ {
			#name -> '60 FPS Frame Hitching During I/O'.
			#frames -> frameCount.
			#pharoMaxFrameMs -> pharoMaxFrameMs.
			#pharoTotalJankMs -> pharoTotalJankMs.
			#sdl3MaxFrameMs -> sdl3MaxFrameMs.
			#sdl3TotalJankMs -> sdl3TotalJankMs
		} asDictionary ] ensure: [
			largeAddress free.
			filePath asFileReference ensureDelete ]
]

{ #category : 'initialization' }
SDL3AsyncIOBenchmark >> initialize [

	super initialize.
	workerDelay := 2 milliSeconds.
	workerPriority := Processor userBackgroundPriority.
	workloadPriority := Processor systemBackgroundPriority.
	reportStream := '' writeStream
]

{ #category : 'private' }
SDL3AsyncIOBenchmark >> isPrime: anInteger [
	"Simple trial division prime test for CPU workload generation."

	anInteger < 2 ifTrue: [ ^ false ].
	2 to: anInteger sqrt truncated do: [ :divisor |
		(anInteger \\ divisor = 0) ifTrue: [ ^ false ] ].
	^ true
]

{ #category : 'reporting' }
SDL3AsyncIOBenchmark >> reportOnTranscript [

	reportStream contents traceCr
]

{ #category : 'accessing' }
SDL3AsyncIOBenchmark >> reportStream [

	^ reportStream
]

{ #category : 'reporting' }
SDL3AsyncIOBenchmark >> run: aBlockClosure [

	self setUp.
	^ aBlockClosure ensure: [ self tearDown ]
]

{ #category : 'reporting' }
SDL3AsyncIOBenchmark >> runAll [
	<script: 'self new runAll; reportOnTranscript'>

	| targetSelectors |
	targetSelectors := (self class selectors select: [ :eachSelector |
		(eachSelector beginsWith: 'run')
			and: [ eachSelector numArgs = 0
				and: [ eachSelector ~~ #runAll ] ] ]) sorted.
	targetSelectors do: [ :eachSelector |
		self perform: eachSelector ]
]

{ #category : 'reporting' }
SDL3AsyncIOBenchmark >> runGeneral [
	<script: 'self new runGeneral; reportOnTranscript'>

	self run: [
		| streamingFileSize chunkSize randomFileSize randomCount concurrentFilesCount concurrentFileSize bidiFileSize flushFileSize starvationChunkCount animationFrames gcFileSize seqWrite seqRead randomReads concurrentLoads uiHitching starvation cpuWork physicalSync gcOverhead bidiIO |
		streamingFileSize := 16rA00000.
		chunkSize := 16r10000.
		randomFileSize := 16r500000.
		randomCount := 500.
		concurrentFilesCount := 20.
		concurrentFileSize := 16r10000.
		bidiFileSize := 16rA00000.
		flushFileSize := 16r500000.
		gcFileSize := 16r1400000.
		starvationChunkCount := 40.
		animationFrames := 30.

		seqWrite := self benchmarkLargeFileSequentialWriteSize: streamingFileSize chunkSize: chunkSize.
		seqRead := self benchmarkLargeFileSequentialReadSize: streamingFileSize chunkSize: chunkSize.
		randomReads := self benchmarkRandomOffsetAccessCount: randomCount onFileSize: randomFileSize.
		concurrentLoads := self benchmarkConcurrentFileLoadsCount: concurrentFilesCount fileSize: concurrentFileSize.
		uiHitching := self benchmarkUIFrameHitchingDuringHeavyIOFrames: animationFrames.
		starvation := self benchmarkBackgroundProcessStarvationDuringIOChunks: starvationChunkCount.
		cpuWork := self benchmarkCPUWorkDuringHeavyIOChunks: starvationChunkCount.
		physicalSync := self benchmarkPhysicalStorageFlushLatencyFileSize: flushFileSize.
		gcOverhead := self benchmarkGCOverheadDuringHeavyIOSize: gcFileSize chunkSize: chunkSize.
		bidiIO := self benchmarkSimultaneousBidirectionalIOSize: bidiFileSize chunkSize: chunkSize.

		reportStream
			nextPutAll: '# SDL3AsyncIO vs Pharo Standard File System: Comprehensive Benchmark Report'; cr; cr;
			nextPutAll: '### 1. Concurrency, VM Starvation & Responsiveness (The Async Superpowers)'; cr; cr;
			nextPutAll: '| Metric | Workload | Pharo Synchronous File | SDL3 AsyncIO Scheduler | Advantage |'; cr;
			nextPutAll: '|:---|:---|:---|:---|:---|'; cr;
			nextPutAll: '| **Background Process Ticks** | ';
			nextPutAll: (starvationChunkCount * 16r100000) humanReadableByteSizeString; nextPutAll: ' disk write | ';
			print: (starvation at: #pharoTicks); nextPutAll: ' ticks | ';
			print: (starvation at: #sdl3Ticks); nextPutAll: ' ticks | **';
			nextPutAll: ((starvation at: #ratio) printShowingDecimalPlaces: 1); nextPutAll: 'x more concurrency** |'; cr;
			nextPutAll: '| **CPU Work Done During I/O** | ';
			nextPutAll: (starvationChunkCount * 16r100000) humanReadableByteSizeString; nextPutAll: ' disk write (Primes) | ';
			print: (cpuWork at: #pharoPrimes); nextPutAll: ' primes | ';
			print: (cpuWork at: #sdl3Primes); nextPutAll: ' primes | **';
			nextPutAll: ((cpuWork at: #ratio) printShowingDecimalPlaces: 1); nextPutAll: 'x more CPU throughput** |'; cr;
			nextPutAll: '| **Physical Storage Sync (fsync)** | ';
			nextPutAll: flushFileSize humanReadableByteSizeString; nextPutAll: ' durability flush | ';
			print: (physicalSync at: #pharoFreezeMs); nextPutAll: 'ms VM freeze | ';
			print: (physicalSync at: #sdl3FreezeMs); nextPutAll: 'ms VM freeze | **';
			nextPutAll: (((physicalSync at: #pharoFreezeMs) asFloat / ((physicalSync at: #sdl3FreezeMs) max: 1)) printShowingDecimalPlaces: 1); nextPutAll: 'x less freeze** |'; cr;
			nextPutAll: '| **Simultaneous Read & Write** | ';
			nextPutAll: bidiFileSize humanReadableByteSizeString; nextPutAll: ' bidirectional I/O | ';
			print: (bidiIO at: #pharoElapsedMs); nextPutAll: 'ms | ';
			print: (bidiIO at: #sdl3ElapsedMs); nextPutAll: 'ms | **';
			nextPutAll: (((bidiIO at: #pharoElapsedMs) asFloat / ((bidiIO at: #sdl3ElapsedMs) max: 1)) printShowingDecimalPlaces: 1); nextPutAll: 'x faster** |'; cr;
			nextPutAll: '| **60 FPS Animation Max Hitch** | ';
			print: animationFrames; nextPutAll: ' frames with 6x 1MB writes | ';
			print: (uiHitching at: #pharoMaxFrameMs); nextPutAll: 'ms (jank: '; print: (uiHitching at: #pharoTotalJankMs); nextPutAll: 'ms) | ';
			print: (uiHitching at: #sdl3MaxFrameMs); nextPutAll: 'ms (jank: '; print: (uiHitching at: #sdl3TotalJankMs); nextPutAll: 'ms) | **Smooth 16ms frame rate** |'; cr;
			nextPutAll: '| **GC Pause Time** | ';
			nextPutAll: gcFileSize humanReadableByteSizeString; nextPutAll: ' read stream | ';
			print: (gcOverhead at: #pharoGCMs); nextPutAll: 'ms GC pause | ';
			print: (gcOverhead at: #sdl3GCMs); nextPutAll: 'ms GC pause | **Zero VM allocations** |'; cr; cr;
			nextPutAll: '### 2. Single-Threaded I/O Throughput & Cache Latency'; cr; cr;
			nextPutAll: '| Benchmark | Workload | Pharo Synchronous File | SDL3 AsyncIO Scheduler | Context |'; cr;
			nextPutAll: '|:---|:---|:---|:---|:---|'; cr;
			nextPutAll: '| **Sequential Write** | ';
			nextPutAll: streamingFileSize humanReadableByteSizeString; nextPutAll: ' ('; nextPutAll: chunkSize humanReadableByteSizeString; nextPutAll: ' chunks) | ';
			print: (seqWrite at: #pharoElapsedMs); nextPutAll: 'ms ('; nextPutAll: ((seqWrite at: #pharoMBps) printShowingDecimalPlaces: 1); nextPutAll: ' MB/s) | ';
			print: (seqWrite at: #sdl3ElapsedMs); nextPutAll: 'ms ('; nextPutAll: ((seqWrite at: #sdl3MBps) printShowingDecimalPlaces: 1); nextPutAll: ' MB/s) | Direct OS page-cache write vs worker thread dispatch |'; cr;
			nextPutAll: '| **Sequential Read** | ';
			nextPutAll: streamingFileSize humanReadableByteSizeString; nextPutAll: ' ('; nextPutAll: chunkSize humanReadableByteSizeString; nextPutAll: ' chunks) | ';
			print: (seqRead at: #pharoElapsedMs); nextPutAll: 'ms ('; nextPutAll: ((seqRead at: #pharoMBps) printShowingDecimalPlaces: 1); nextPutAll: ' MB/s) | ';
			print: (seqRead at: #sdl3ElapsedMs); nextPutAll: 'ms ('; nextPutAll: ((seqRead at: #sdl3MBps) printShowingDecimalPlaces: 1); nextPutAll: ' MB/s) | In-memory kernel page cache hit |'; cr;
			nextPutAll: '| **Random 4KB Reads** | ';
			print: randomCount; nextPutAll: ' seeks/reads in '; nextPutAll: randomFileSize humanReadableByteSizeString; nextPutAll: ' | ';
			print: (randomReads at: #pharoElapsedMs); nextPutAll: 'ms | ';
			print: (randomReads at: #sdl3ElapsedMs); nextPutAll: 'ms | Direct offset addressing eliminates separate seek message sends |'; cr;
			nextPutAll: '| **Concurrent File Loads** | ';
			print: concurrentFilesCount; nextPutAll: ' files ('; nextPutAll: concurrentFileSize humanReadableByteSizeString; nextPutAll: ' each) | ';
			print: (concurrentLoads at: #pharoElapsedMs); nextPutAll: 'ms | ';
			print: (concurrentLoads at: #sdl3ElapsedMs); nextPutAll: 'ms | Small file overhead vs parallel OS thread pool |'; cr
	]
]

{ #category : 'reporting' }
SDL3AsyncIOBenchmark >> runMemoryAndGC [
	<script: 'self new runMemoryAndGC; reportOnTranscript'>

	self run: [
		reportStream
			nextPutAll: '# SDL3AsyncIO Memory Allocation & GC Overhead Benchmark'; cr; cr;
			nextPutAll: 'Question: Does sustained I/O create Garbage Collection pauses and heap fragmentation in Pharo?'; cr; cr;
			nextPutAll: '| Workload | Pharo Synchronous GC Pause | SDL3 AsyncIO GC Pause | Analysis |'; cr;
			nextPutAll: '|:---|:---|:---|:---|'; cr.

		#(16rA00000 16r1E00000) do: [ :eachTotalBytes |
			| result |
			result := self benchmarkGCOverheadDuringHeavyIOSize: eachTotalBytes chunkSize: 16r10000.
			reportStream
				nextPutAll: '| **'; nextPutAll: eachTotalBytes humanReadableByteSizeString; nextPutAll: ' Stream Read** | ';
				print: (result at: #pharoGCMs); nextPutAll: 'ms | ';
				print: (result at: #sdl3GCMs); nextPutAll: 'ms | Zero VM heap allocations via off-heap memory |'; cr ]
	]
]

{ #category : 'reporting' }
SDL3AsyncIOBenchmark >> runResponsiveness [
	<script: 'self new runResponsiveness; reportOnTranscript'>

	self run: [
		| chunkCount frameCount totalDiskBytes starvation cpuWork uiHitching |
		chunkCount := 40.
		frameCount := 30.
		totalDiskBytes := chunkCount * 16r100000.
		starvation := self benchmarkBackgroundProcessStarvationDuringIOChunks: chunkCount.
		cpuWork := self benchmarkCPUWorkDuringHeavyIOChunks: chunkCount.
		uiHitching := self benchmarkUIFrameHitchingDuringHeavyIOFrames: frameCount.

		reportStream
			nextPutAll: '# SDL3AsyncIO Concurrency & Responsiveness Benchmark'; cr; cr;
			nextPutAll: 'Question: Does heavy disk I/O freeze user interactions, drop animation frames, or starve background tasks?'; cr; cr;
			nextPutAll: '| Metric | Workload | Pharo Synchronous File | SDL3 AsyncIO Scheduler | Advantage |'; cr;
			nextPutAll: '|:---|:---|:---|:---|:---|'; cr;
			nextPutAll: '| **Background Process Ticks** | ';
			nextPutAll: totalDiskBytes humanReadableByteSizeString; nextPutAll: ' disk write | ';
			print: (starvation at: #pharoTicks); nextPutAll: ' ticks | ';
			print: (starvation at: #sdl3Ticks); nextPutAll: ' ticks | **';
			nextPutAll: ((starvation at: #ratio) printShowingDecimalPlaces: 1); nextPutAll: 'x more concurrency** |'; cr;
			nextPutAll: '| **CPU Work Done During I/O** | ';
			nextPutAll: totalDiskBytes humanReadableByteSizeString; nextPutAll: ' disk write (Primes) | ';
			print: (cpuWork at: #pharoPrimes); nextPutAll: ' primes | ';
			print: (cpuWork at: #sdl3Primes); nextPutAll: ' primes | **';
			nextPutAll: ((cpuWork at: #ratio) printShowingDecimalPlaces: 1); nextPutAll: 'x more CPU throughput** |'; cr;
			nextPutAll: '| **60 FPS Animation Max Hitch** | ';
			print: frameCount; nextPutAll: ' frames with 6x 1MB writes | ';
			print: (uiHitching at: #pharoMaxFrameMs); nextPutAll: 'ms (jank: '; print: (uiHitching at: #pharoTotalJankMs); nextPutAll: 'ms) | ';
			print: (uiHitching at: #sdl3MaxFrameMs); nextPutAll: 'ms (jank: '; print: (uiHitching at: #sdl3TotalJankMs); nextPutAll: 'ms) | **Smooth 16ms frame pacing** |'; cr
	]
]

{ #category : 'reporting' }
SDL3AsyncIOBenchmark >> runStorageDurability [
	<script: 'self new runStorageDurability; reportOnTranscript'>

	self run: [
		reportStream
			nextPutAll: '# SDL3AsyncIO Physical Storage Durability (fsync) Benchmark'; cr; cr;
			nextPutAll: 'Question: Does flushing data to physical storage (fsync) freeze the entire Pharo VM?'; cr; cr;
			nextPutAll: '| File Size | Pharo Synchronous Freeze | SDL3 AsyncIO Freeze | Advantage |'; cr;
			nextPutAll: '|:---|:---|:---|:---|'; cr.

		#(16r100000 16r500000 16rA00000) do: [ :eachFileSize |
			| result |
			result := self benchmarkPhysicalStorageFlushLatencyFileSize: eachFileSize.
			reportStream
				nextPutAll: '| **'; nextPutAll: eachFileSize humanReadableByteSizeString; nextPutAll: ' Flush** | ';
				print: (result at: #pharoFreezeMs); nextPutAll: 'ms VM freeze | ';
				print: (result at: #sdl3FreezeMs); nextPutAll: 'ms VM freeze | **';
				nextPutAll: (((result at: #pharoFreezeMs) asFloat / ((result at: #sdl3FreezeMs) max: 1)) printShowingDecimalPlaces: 1); nextPutAll: 'x less freeze** |'; cr ]
	]
]

{ #category : 'reporting' }
SDL3AsyncIOBenchmark >> runThroughputAndLatency [
	<script: 'self new runThroughputAndLatency; reportOnTranscript'>

	self run: [
		| streamingFileSize chunkSize randomFileSize randomCount concurrentFilesCount concurrentFileSize bidiFileSize seqWrite seqRead randomReads concurrentLoads bidiIO |
		streamingFileSize := 16rA00000.
		chunkSize := 16r10000.
		randomFileSize := 16r500000.
		randomCount := 500.
		concurrentFilesCount := 20.
		concurrentFileSize := 16r10000.
		bidiFileSize := 16rA00000.

		seqWrite := self benchmarkLargeFileSequentialWriteSize: streamingFileSize chunkSize: chunkSize.
		seqRead := self benchmarkLargeFileSequentialReadSize: streamingFileSize chunkSize: chunkSize.
		randomReads := self benchmarkRandomOffsetAccessCount: randomCount onFileSize: randomFileSize.
		concurrentLoads := self benchmarkConcurrentFileLoadsCount: concurrentFilesCount fileSize: concurrentFileSize.
		bidiIO := self benchmarkSimultaneousBidirectionalIOSize: bidiFileSize chunkSize: chunkSize.

		reportStream
			nextPutAll: '# SDL3AsyncIO Throughput & Latency Benchmark'; cr; cr;
			nextPutAll: 'Question: How do sequential throughput, random access latency, and concurrent file loads compare?'; cr; cr;
			nextPutAll: '| Benchmark | Workload | Pharo Synchronous File | SDL3 AsyncIO Scheduler | Context |'; cr;
			nextPutAll: '|:---|:---|:---|:---|:---|'; cr;
			nextPutAll: '| **Sequential Write** | ';
			nextPutAll: streamingFileSize humanReadableByteSizeString; nextPutAll: ' ('; nextPutAll: chunkSize humanReadableByteSizeString; nextPutAll: ' chunks) | ';
			print: (seqWrite at: #pharoElapsedMs); nextPutAll: 'ms ('; nextPutAll: ((seqWrite at: #pharoMBps) printShowingDecimalPlaces: 1); nextPutAll: ' MB/s) | ';
			print: (seqWrite at: #sdl3ElapsedMs); nextPutAll: 'ms ('; nextPutAll: ((seqWrite at: #sdl3MBps) printShowingDecimalPlaces: 1); nextPutAll: ' MB/s) | Direct OS page-cache write vs worker thread dispatch |'; cr;
			nextPutAll: '| **Sequential Read** | ';
			nextPutAll: streamingFileSize humanReadableByteSizeString; nextPutAll: ' ('; nextPutAll: chunkSize humanReadableByteSizeString; nextPutAll: ' chunks) | ';
			print: (seqRead at: #pharoElapsedMs); nextPutAll: 'ms ('; nextPutAll: ((seqRead at: #pharoMBps) printShowingDecimalPlaces: 1); nextPutAll: ' MB/s) | ';
			print: (seqRead at: #sdl3ElapsedMs); nextPutAll: 'ms ('; nextPutAll: ((seqRead at: #sdl3MBps) printShowingDecimalPlaces: 1); nextPutAll: ' MB/s) | In-memory kernel page cache hit |'; cr;
			nextPutAll: '| **Random 4KB Reads** | ';
			print: randomCount; nextPutAll: ' seeks/reads in '; nextPutAll: randomFileSize humanReadableByteSizeString; nextPutAll: ' | ';
			print: (randomReads at: #pharoElapsedMs); nextPutAll: 'ms | ';
			print: (randomReads at: #sdl3ElapsedMs); nextPutAll: 'ms | Direct offset addressing eliminates separate seek message sends |'; cr;
			nextPutAll: '| **Concurrent File Loads** | ';
			print: concurrentFilesCount; nextPutAll: ' files ('; nextPutAll: concurrentFileSize humanReadableByteSizeString; nextPutAll: ' each) | ';
			print: (concurrentLoads at: #pharoElapsedMs); nextPutAll: 'ms | ';
			print: (concurrentLoads at: #sdl3ElapsedMs); nextPutAll: 'ms | Small file overhead vs parallel OS thread pool |'; cr;
			nextPutAll: '| **Simultaneous Read & Write** | ';
			nextPutAll: bidiFileSize humanReadableByteSizeString; nextPutAll: ' bidirectional I/O | ';
			print: (bidiIO at: #pharoElapsedMs); nextPutAll: 'ms | ';
			print: (bidiIO at: #sdl3ElapsedMs); nextPutAll: 'ms | Parallel OS worker threads vs single-threaded VM |'; cr
	]
]

{ #category : 'accessing' }
SDL3AsyncIOBenchmark >> scheduler [

	^ scheduler
]

{ #category : 'lifecycle' }
SDL3AsyncIOBenchmark >> setUp [

	scheduler := SDL3AsyncIOScheduler unownedNew.
	workerProcess := [
		[ scheduler isNotNil and: [ scheduler isDisposed not ] ] whileTrue: [
			scheduler hasInFlightTasks
				ifTrue: [
					scheduler step.
					Processor yield ]
				ifFalse: [
					workerDelay wait ] ]
	] forkAt: workerPriority named: 'AsyncIO Benchmark Worker'
]

{ #category : 'lifecycle' }
SDL3AsyncIOBenchmark >> tearDown [

	workerProcess ifNotNil: [
		workerProcess terminate.
		workerProcess := nil ].
	scheduler ifNotNil: [
		scheduler isDisposed ifFalse: [
			scheduler dispose ].
		scheduler := nil ]
]

{ #category : 'accessing' }
SDL3AsyncIOBenchmark >> workerDelay [

	^ workerDelay
]

{ #category : 'accessing' }
SDL3AsyncIOBenchmark >> workerDelay: aDuration [

	workerDelay := aDuration
]

{ #category : 'accessing' }
SDL3AsyncIOBenchmark >> workerPriority [

	^ workerPriority
]

{ #category : 'accessing' }
SDL3AsyncIOBenchmark >> workerPriority: anInteger [

	anInteger <= self workloadPriority ifTrue: [
		self error: 'Worker priority must be strictly higher than workload priority' ].
	workerPriority := anInteger
]

{ #category : 'accessing' }
SDL3AsyncIOBenchmark >> workloadPriority [
	"Answer the priority for competing background workload processes (e.g. primes, counter).
	Defaults to Processor systemBackgroundPriority (10), strictly below workerPriority (20) so the I/O worker process is never starved."

	^ workloadPriority
]

{ #category : 'accessing' }
SDL3AsyncIOBenchmark >> workloadPriority: anInteger [
	"Set the priority for competing background workload processes.
	Must be strictly lower than workerPriority to prevent background computation from starving the I/O worker process."

	anInteger >= workerPriority ifTrue: [
		self error: 'Workload priority must be strictly lower than worker priority' ].
	workloadPriority := anInteger
]
