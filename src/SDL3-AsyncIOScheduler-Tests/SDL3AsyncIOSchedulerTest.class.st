"
I contain unit tests for SDL3AsyncIOScheduler, SDL3AsyncFile, and SDL3AsyncTask.
"
Class {
	#name : 'SDL3AsyncIOSchedulerTest',
	#superclass : 'SDL3Test',
	#category : 'SDL3-AsyncIOScheduler-Tests',
	#package : 'SDL3-AsyncIOScheduler-Tests'
}

{ #category : 'helpers' }
SDL3AsyncIOSchedulerTest >> forkWorkerProcessFor: aScheduler [

	^ [
		[ aScheduler isNotNil and: [ aScheduler isDisposed not ] ] whileTrue: [
			aScheduler hasInFlightTasks ifTrue: [ aScheduler step ].
			Processor yield ]
	] forkAt: Processor userBackgroundPriority named: 'AsyncIO Test Worker'
]

{ #category : 'tests' }
SDL3AsyncIOSchedulerTest >> test01WholeFileAsyncLoadBytes [

	| filePath scheduler loadedBytes loadTask |
	filePath := 'sdl3_sched_load_test.bin'.
	filePath asFileReference ensureDelete.
	[
		filePath asFileReference binaryWriteStreamDo: [ :stream |
			stream nextPutAll: #[ 10 20 30 40 50 ] ].
		DiScope own: (scheduler := SDL3AsyncIOScheduler unownedNew).

		loadedBytes := nil.
		scheduler loadByteArray: filePath onComplete: [ :bytes | loadedBytes := bytes ] onFailure: [ :anError | self fail: anError asString ].
		self assert: loadedBytes isNil.
		[ loadedBytes isNil ] whileTrue: [ scheduler step ].
		self assert: loadedBytes equals: #[ 10 20 30 40 50 ].

		loadTask := scheduler loadByteArray: filePath.
		self deny: loadTask isCompleted.
		[ loadTask isCompleted ] whileFalse: [ scheduler step ].
		self assert: loadTask isCompleted.
		self assert: loadTask wait equals: #[ 10 20 30 40 50 ] ] ensure: [
			scheduler ifNotNil: [ scheduler dispose ].
			filePath asFileReference ensureDelete ]
]

{ #category : 'tests' }
SDL3AsyncIOSchedulerTest >> test02FileWriteAndReadWithStep [

	| filePath scheduler file buffer readBuffer writeTask readTask closeTask |
	filePath := 'sdl3_sched_offset_test.bin'.
	filePath asFileReference ensureDelete.
	buffer := ExternalAddress allocate: 8.
	readBuffer := ExternalAddress allocate: 8.
	[
		1 to: 8 do: [ :index | buffer byteAt: index put: index ].
		DiScope own: (scheduler := SDL3AsyncIOScheduler unownedNew).
		file := scheduler openFile: filePath mode: 'w+'.
		self assert: file size equals: 0.

		writeTask := file write: buffer size: 8 at: 0.
		self assert: scheduler inFlightTasksCount equals: 1.
		[ writeTask isCompleted ] whileFalse: [ scheduler step ].
		self assert: writeTask isCompleted.
		self assert: writeTask wait equals: 8.
		self assert: file size equals: 8.

		readTask := file readInto: readBuffer size: 8 at: 0.
		[ readTask isCompleted ] whileFalse: [ scheduler step ].
		self assert: readTask isCompleted.
		self assert: readTask wait equals: 8.
		1 to: 8 do: [ :index |
			self assert: (readBuffer byteAt: index) equals: index ].

		closeTask := file closeFlush: true.
		[ closeTask isCompleted ] whileFalse: [ scheduler step ].
		self assert: closeTask isCompleted.
		self assert: file isClosed.
		self assert: (filePath asFileReference binaryReadStreamDo: [ :stream | stream contents ]) equals: #[ 1 2 3 4 5 6 7 8 ] ] ensure: [
			buffer free.
			readBuffer free.
			scheduler ifNotNil: [ scheduler dispose ].
			filePath asFileReference ensureDelete ]
]

{ #category : 'tests' }
SDL3AsyncIOSchedulerTest >> test03FileWriteAndReadWithForkedWorkerProcess [
	"Demonstrates driving the scheduler with a background worker Process."

	| filePath scheduler file buffer readBuffer writeTask readTask workerProcess |
	filePath := 'sdl3_sched_greenthread_test.bin'.
	filePath asFileReference ensureDelete.
	buffer := ExternalAddress allocate: 8.
	readBuffer := ExternalAddress allocate: 8.
	[
		1 to: 8 do: [ :index | buffer byteAt: index put: index * 10 ].
		scheduler := SDL3AsyncIOScheduler unownedNew.
		workerProcess := self forkWorkerProcessFor: scheduler.

		file := scheduler openFile: filePath mode: 'w+'.

		writeTask := file write: buffer size: 8 at: 0.
		self assert: writeTask wait equals: 8.
		self assert: file size equals: 8.

		readTask := file readInto: readBuffer size: 8 at: 0.
		self assert: readTask wait equals: 8.
		1 to: 8 do: [ :index |
			self assert: (readBuffer byteAt: index) equals: index * 10 ].

		(file closeFlush: true) wait.
		self assert: file isClosed.
		self assert: (filePath asFileReference binaryReadStreamDo: [ :stream | stream contents ]) equals: #[ 10 20 30 40 50 60 70 80 ] ] ensure: [
			buffer free.
			readBuffer free.
			workerProcess ifNotNil: [ workerProcess terminate ].
			scheduler ifNotNil: [ scheduler dispose ].
			filePath asFileReference ensureDelete ]
]

{ #category : 'tests' }
SDL3AsyncIOSchedulerTest >> test04ConcurrentPipelinedTasks [

	| filePath scheduler file buffers readBuffers writeTasks readTasks workerProcess |
	filePath := 'sdl3_sched_pipeline_test.bin'.
	filePath asFileReference ensureDelete.
	buffers := (1 to: 10) collect: [ :index |
		| address |
		address := ExternalAddress allocate: 4.
		1 to: 4 do: [ :byteIndex | address byteAt: byteIndex put: index ].
		address ].
	readBuffers := (1 to: 10) collect: [ :index | ExternalAddress allocate: 4 ].
	[
		DiScope own: (scheduler := SDL3AsyncIOScheduler unownedNew).
		workerProcess := self forkWorkerProcessFor: scheduler.
		file := scheduler openFile: filePath mode: 'w+'.
		writeTasks := (1 to: 10) collect: [ :index |
			| address offset |
			address := buffers at: index.
			offset := (index - 1) * 4.
			file write: address size: 4 at: offset ].
		writeTasks do: #wait.
		writeTasks do: [ :each | self assert: each isCompleted ].
		self assert: file size equals: 40.

		readTasks := (1 to: 10) collect: [ :index |
			| address offset |
			address := readBuffers at: index.
			offset := (index - 1) * 4.
			file readInto: address size: 4 at: offset ].
		readTasks do: #wait.
		readTasks do: [ :each | self assert: each isCompleted ].
		1 to: 10 do: [ :index |
			| address |
			address := readBuffers at: index.
			1 to: 4 do: [ :byteIndex |
				self assert: (address byteAt: byteIndex) equals: index ] ].

		(file closeFlush: true) wait.
		self assert: file isClosed ] ensure: [
			buffers do: [ :each | each free ].
			readBuffers do: [ :each | each free ].
			workerProcess ifNotNil: [ workerProcess terminate ].
			scheduler ifNotNil: [ scheduler dispose ].
			filePath asFileReference ensureDelete ]
]

{ #category : 'tests' }
SDL3AsyncIOSchedulerTest >> test05ErrorHandling [

	| filePath scheduler readOnlyFile buffer failedWriteTask closeTask |
	filePath := 'sdl3_sched_error_test.bin'.
	filePath asFileReference ensureDelete.
	buffer := ExternalAddress allocate: 4.
	[
		DiScope own: (scheduler := SDL3AsyncIOScheduler unownedNew).
		self
			should: [ scheduler openFile: 'nonexistent_scheduler_file.txt' mode: 'r' ]
			raise: SDL3Error.

		filePath asFileReference binaryWriteStreamDo: [ :stream |
			stream nextPutAll: #[ 1 2 3 4 ] ].
		readOnlyFile := scheduler openFile: filePath mode: 'r'.
		failedWriteTask := readOnlyFile write: buffer size: 4 at: 0.
		[ failedWriteTask isFailed ] whileFalse: [ scheduler step ].
		self assert: failedWriteTask isFailed.
		self
			should: [ failedWriteTask wait ]
			raise: SDL3Error.

		closeTask := readOnlyFile closeFlush: false.
		[ closeTask isCompleted ] whileFalse: [ scheduler step ].
		self assert: closeTask isCompleted ] ensure: [
			buffer free.
			scheduler ifNotNil: [ scheduler dispose ].
			filePath asFileReference ensureDelete ]
]

{ #category : 'tests' }
SDL3AsyncIOSchedulerTest >> test06Dispose [

	| filePath scheduler file buffer writeTask |
	filePath := 'sdl3_sched_dispose_test.bin'.
	filePath asFileReference ensureDelete.
	buffer := ExternalAddress allocate: 4.
	[
		1 to: 4 do: [ :index | buffer byteAt: index put: index ].
		scheduler := SDL3AsyncIOScheduler unownedNew.
		file := scheduler openFile: filePath mode: 'w'.
		writeTask := file write: buffer size: 4 at: 0.
		[ writeTask isCompleted ] whileFalse: [ scheduler step ].
		self deny: scheduler isDisposed.
		self deny: file isClosed.
		self assert: (scheduler openFiles includes: file).

		scheduler dispose.

		self assert: scheduler isDisposed.
		self assert: scheduler queue isNil.
		self assert: file isClosed.
		self assert: scheduler openFiles isEmpty.
		self assert: (filePath asFileReference binaryReadStreamDo: [ :stream | stream contents ]) equals: #[ 1 2 3 4 ] ] ensure: [
			buffer free.
			scheduler ifNotNil: [ scheduler dispose ].
			filePath asFileReference ensureDelete ]
]

{ #category : 'tests' }
SDL3AsyncIOSchedulerTest >> test07SemaphoreWaitWithWorkerProcess [
	"Verify that SDL3AsyncTask >> #wait suspends on a Semaphore until unblocked by a scheduler stepping loop."

	| filePath scheduler file buffer readBuffer workerProcess |
	filePath := 'sdl3_sched_semaphore_wait_test.bin'.
	filePath asFileReference ensureDelete.
	buffer := ExternalAddress allocate: 4.
	readBuffer := ExternalAddress allocate: 4.
	[
		1 to: 4 do: [ :index | buffer byteAt: index put: index * 5 ].
		scheduler := SDL3AsyncIOScheduler unownedNew.
		workerProcess := self forkWorkerProcessFor: scheduler.

		file := scheduler openFile: filePath mode: 'w+'.
		(file write: buffer size: 4 at: 0) wait.
		(file readInto: readBuffer size: 4 at: 0) wait.
		1 to: 4 do: [ :index |
			self assert: (readBuffer byteAt: index) equals: index * 5 ].
		(file closeFlush: true) wait.
		self assert: file isClosed.
		self assert: (filePath asFileReference binaryReadStreamDo: [ :stream | stream contents ]) equals: #[ 5 10 15 20 ] ] ensure: [
			buffer free.
			readBuffer free.
			workerProcess ifNotNil: [ workerProcess terminate ].
			scheduler ifNotNil: [ scheduler dispose ].
			filePath asFileReference ensureDelete ]
]

{ #category : 'tests' }
SDL3AsyncIOSchedulerTest >> test08FileCloseRemovesFromOpenFiles [

	| filePath scheduler file workerProcess |
	filePath := 'sdl3_sched_file_close_test.bin'.
	filePath asFileReference ensureDelete.
	[
		scheduler := SDL3AsyncIOScheduler unownedNew.
		workerProcess := self forkWorkerProcessFor: scheduler.

		file := scheduler openFile: filePath mode: 'w+'.
		self assert: (scheduler openFiles includes: file).

		(file closeFlush: false) wait.
		self assert: file isClosed.
		self deny: (scheduler openFiles includes: file).
		self assert: scheduler openFiles isEmpty ] ensure: [
			workerProcess ifNotNil: [ workerProcess terminate ].
			scheduler ifNotNil: [ scheduler dispose ].
			filePath asFileReference ensureDelete ]
]

{ #category : 'tests' }
SDL3AsyncIOSchedulerTest >> test09WaitTimeout [

	| task |
	task := SDL3AsyncTask new.
	self
		should: [ task waitTimeoutMilliseconds: 5 ]
		raise: SDL3Error
]
