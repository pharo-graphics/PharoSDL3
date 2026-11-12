"
I manage an SDL3AsyncIOQueue and provide high-level, non-blocking scheduling, task dispatching, and off-heap memory operations for asynchronous file I/O.

### The Single-Threaded VM Challenge
In Pharo, all Smalltalk processes (green threads)—workspace evaluations, Morphic/Bloc UI loops, timers, and background tasks—are scheduled cooperatively on a single native OS thread. When code performs standard synchronous file operations via FileReference or BinaryFileStream, the underlying POSIX system calls (read, write, or fsync) block the entire native OS thread, temporarily freezing UI animations, event handling, and background calculations.

### How I Solve It
SDL 3.2+ provides an asynchronous I/O subsystem (SDL_AsyncIO) backed by an operating system worker thread pool. I wrap these low-level C queues into an idiomatic Smalltalk object-oriented layer:
- The sender Smalltalk process submits I/O tasks and immediately yields or continues computing.
- Native OS worker threads perform the reads, writes, and physical storage flushes in the background.
- When an operation finishes, #step harvests completed outcomes and dispatches them to their corresponding SDL3AsyncTask, resuming waiting green threads or evaluating completion callbacks.

### When to Use What
- **Standard Pharo (FileReference):**
  - Small text or configuration files (.json, .ston, .ini).
  - One-off scripts and offline batch utilities where blocking the VM is harmless.
  - When data should be loaded directly into Smalltalk heap objects (String, Dictionary).
- **SDL3AsyncIOScheduler:**
  - Games, interactive multimedia, and 60 FPS applications where dropped frames are unacceptable.
  - Large binary assets (textures, sounds, 3D meshes) streamed into off-heap memory (SDL3Array, GPU transfer buffers).
  - Random byte-offset access in large packed asset archives (.pak, .bundle) without file cursor seeks.
  - Physical storage flushes (fsync) that would otherwise freeze the VM.

### Usage Patterns

1. Whole-File Load with Callbacks:
```smalltalk
scheduler := SDL3AsyncIOScheduler unownedNew.
scheduler
	loadByteArray: 'assets/hero.png'
	onComplete: [ :bytes | self processTexture: bytes. scheduler dispose ]
	onFailure: [ :err | self logError: err. scheduler dispose ].
""The scheduler owner (e.g. an SDL3App or background loop) drives #step:""
scheduler step.
```

2. Off-Heap Streaming with SDL3Array:
```smalltalk
[
	| scheduler file buffer writeTask readTask |
	scheduler := SDL3AsyncIOScheduler unownedNew.
	buffer := SDL3Array unownedNewType: FFIUInt8 size: 1024 collect: [ :i | i \\ 256 ].
	[
		file := scheduler openFile: 'savegame.dat' mode: 'w+'.
		writeTask := file write: buffer getHandle size: buffer byteSize at: 0.
		writeTask wait.

		readTask := file readInto: buffer getHandle size: buffer byteSize at: 0.
		readTask wait.

		(file closeFlush: true) wait.
	] ensure: [
		buffer dispose.
		scheduler dispose.
	].
] fork.
```

3. Desktop Applications (SDL3App):
`SDL3App` natively integrates an `asyncIOScheduler` and automatically pumps `#step` on every frame:
```smalltalk
MyGameApp >> setUp [
	super setUp.
	self asyncIOScheduler
		loadByteArray: 'shaders/geometry.spv'
		onComplete: [ :bytes | self initPipelineWith: bytes ]
		onFailure: [ :err | err signal ].
]
```
"
Class {
	#name : 'SDL3AsyncIOScheduler',
	#superclass : 'Object',
	#instVars : [
		'queue',
		'nextTaskId',
		'inFlightTasks',
		'openFiles',
		'reusableOutcome'
	],
	#category : 'SDL3-AsyncIOScheduler',
	#package : 'SDL3-AsyncIOScheduler'
}

{ #category : 'instance creation' }
SDL3AsyncIOScheduler class >> new [

	self error: 'Use #unownedNew and then #disposal'
]

{ #category : 'instance creation' }
SDL3AsyncIOScheduler class >> unownedNew [
	"Answer a new instance.
	Even though I am a subclass of Object, I encapsulate an unmanaged C queue (SDL3AsyncIOQueue) and file handles, so the sender is responsible for explicitly disposing me (via #dispose or DiScope)."

	^ self basicNew
		initialize;
		yourself
]

{ #category : 'dispatching' }
SDL3AsyncIOScheduler >> dispatchOutcome: anOutcome [

	| taskId task |
	taskId := anOutcome userdataAddress asInteger.
	task := inFlightTasks removeKey: taskId ifAbsent: [ ^ self ].
	anOutcome isComplete
		ifTrue: [ task completeWithOutcome: anOutcome ]
		ifFalse: [ task failWith: (SDL3Error new messageText: 'Async I/O task failed or canceled') ]
]

{ #category : 'finalization' }
SDL3AsyncIOScheduler >> dispose [
	"Close all open files and dispose of the queue."

	self isDisposed ifTrue: [ ^ self ].
	openFiles asArray do: [ :file | file dispose ].
	openFiles removeAll.
	queue dispose.
	queue := nil
]

{ #category : 'private' }
SDL3AsyncIOScheduler >> fileClosed: anAsyncFile [

	openFiles remove: anAsyncFile ifAbsent: [ ]
]

{ #category : 'testing' }
SDL3AsyncIOScheduler >> hasInFlightTasks [

	^ inFlightTasks notEmpty
]

{ #category : 'accessing' }
SDL3AsyncIOScheduler >> inFlightTasksCount [

	^ inFlightTasks size
]

{ #category : 'initialization' }
SDL3AsyncIOScheduler >> initialize [

	super initialize.
	queue := SDL3AsyncIOQueue unownedNew.
	nextTaskId := 0.
	inFlightTasks := Dictionary new: 32.
	openFiles := OrderedCollection new.
	reusableOutcome := SDL3AsyncIOOutcome new
]

{ #category : 'testing' }
SDL3AsyncIOScheduler >> isDisposed [

	^ queue isNil
]

{ #category : 'operations' }
SDL3AsyncIOScheduler >> loadByteArray: aPath [
	"Asynchronously read all bytes of the file at aPath. Answer an SDL3AsyncTask."

	^ self
		loadByteArray: aPath
		onComplete: nil
		onFailure: nil
]

{ #category : 'operations' }
SDL3AsyncIOScheduler >> loadByteArray: aPath onComplete: aSuccessBlock onFailure: aFailureBlock [
	"Asynchronously read all bytes of the file at aPath, evaluating aSuccessBlock with the resulting ByteArray."

	| task |
	task := self newTaskWithResultBlock: [ :outcome | outcome readByteArrayAndFreeBuffer ].
	task
		onComplete: aSuccessBlock;
		onFailure: aFailureBlock.
	self queueTask: task during: [
		queue
			loadFileAsync: aPath
			userdata: task userdataAddress ].
	^ task
]

{ #category : 'private' }
SDL3AsyncIOScheduler >> newTask [

	| task |
	nextTaskId := nextTaskId + 1.
	task := SDL3AsyncTask new
		id: nextTaskId;
		yourself.
	inFlightTasks at: task id put: task.
	^ task
]

{ #category : 'private' }
SDL3AsyncIOScheduler >> newTaskWithResultBlock: aBlock [

	| task |
	task := self newTask.
	task resultBlock: aBlock.
	^ task
]

{ #category : 'operations' }
SDL3AsyncIOScheduler >> openFile: aPath mode: aModeString [
	"Open an asynchronous file with mode aModeString ('r', 'w', 'r+', or 'w+')."

	| file |
	file := SDL3AsyncFile onPath: aPath mode: aModeString scheduler: self.
	openFiles add: file.
	^ file
]

{ #category : 'accessing' }
SDL3AsyncIOScheduler >> openFiles [

	^ openFiles asArray
]

{ #category : 'printing' }
SDL3AsyncIOScheduler >> printOn: aStream [

	super printOn: aStream.
	aStream
		nextPut: $(;
		print: inFlightTasks size;
		nextPutAll: ' in-flight tasks';
		nextPut: $)
]

{ #category : 'accessing' }
SDL3AsyncIOScheduler >> queue [

	^ queue
]

{ #category : 'private' }
SDL3AsyncIOScheduler >> queueTask: aTask during: aBlock [

	[ aBlock value ]
		on: Error
		do: [ :anException |
			inFlightTasks removeKey: aTask id ifAbsent: [ ].
			aTask failWith: anException.
			anException pass ]
]

{ #category : 'stepping' }
SDL3AsyncIOScheduler >> step [
	"Poll the queue for all completed tasks and dispatch them immediately. Answer the number of dispatched tasks."

	| dispatchedCount |
	self isDisposed ifTrue: [ ^ 0 ].
	dispatchedCount := 0.
	[ queue pollResultInto: reusableOutcome ] whileTrue: [
		self dispatchOutcome: reusableOutcome.
		dispatchedCount := dispatchedCount + 1 ].
	^ dispatchedCount
]
