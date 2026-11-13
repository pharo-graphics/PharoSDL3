"
I contain unit tests for SDL3AsyncIO, SDL3AsyncIOQueue, and SDL3AsyncIOOutcome.
"
Class {
	#name : 'SDL3AsyncIOTest',
	#superclass : 'SDL3Test',
	#category : 'SDL3-Tests-Library',
	#package : 'SDL3-Tests',
	#tag : 'Library'
}

{ #category : 'tests' }
SDL3AsyncIOTest >> test01LoadFileAsyncStringAndByteArray [

	| filePath queue outcome readString readBytes |
	filePath := 'sdl3_asyncio_load_test.txt'.
	filePath asFileReference ensureDelete.
	[
		filePath asFileReference writeStreamDo: [ :stream |
			stream nextPutAll: 'Hello SDL3 AsyncIO!' ].
		DiScope own: (queue := SDL3AsyncIOQueue unownedNew).

		queue loadFileAsync: filePath.
		outcome := queue waitResult.
		self assert: outcome isRead.
		self deny: outcome isWrite.
		self deny: outcome isClose.
		self assert: outcome isComplete.
		self deny: outcome isFailure.
		self deny: outcome isCanceled.
		self assert: outcome asyncIO isNull.
		self assert: outcome offset equals: 0.
		self assert: outcome bytesRequested equals: 19.
		self assert: outcome bytesTransferred equals: 19.
		self deny: outcome bufferAddress isNull.
		self assert: (outcome printString includesSubstring: '19/19').

		readString := outcome readStringAndFreeBuffer.
		self assert: readString equals: 'Hello SDL3 AsyncIO!'.

		queue loadFileAsync: filePath.
		outcome := queue waitResult.
		readBytes := outcome readByteArrayAndFreeBuffer.
		self assert: readBytes equals: 'Hello SDL3 AsyncIO!' utf8Encoded ] ensure: [
			queue ifNotNil: [ queue dispose ].
			filePath asFileReference ensureDelete ]
]

{ #category : 'tests' }
SDL3AsyncIOTest >> test02WriteAndReadAtOffsets [

	| filePath queue asyncIO firstWriteBytes firstWriteOutcome secondWriteBytes secondWriteOutcome readBuffer readOutcome closeOutcome |
	filePath := 'sdl3_asyncio_offsets_test.txt'.
	filePath asFileReference ensureDelete.
	[
		DiScope own: (queue := SDL3AsyncIOQueue unownedNew).
		DiScope own: (asyncIO := SDL3AsyncIO unownedFromFile: filePath mode: 'w+').
		self assert: asyncIO size equals: 0.

		"In-image ByteArrays passed to asynchronous I/O must be pinned so the GC does not move them while the background worker thread runs."
		firstWriteBytes := 'World!' utf8Encoded
			pinInMemory;
			yourself.
		asyncIO writeByteArray: firstWriteBytes offset: 6 queue: queue.
		firstWriteOutcome := queue waitResult.
		self assert: firstWriteOutcome isWrite.
		self assert: firstWriteOutcome isComplete.
		self assert: firstWriteOutcome asyncIO equals: asyncIO.
		self assert: firstWriteOutcome offset equals: 6.
		self assert: firstWriteOutcome bytesTransferred equals: 6.

		secondWriteBytes := 'Hello ' utf8Encoded
			pinInMemory;
			yourself.
		asyncIO writeByteArray: secondWriteBytes offset: 0 queue: queue.
		secondWriteOutcome := queue waitResult.
		self assert: secondWriteOutcome isWrite.
		self assert: secondWriteOutcome isComplete.
		self assert: secondWriteOutcome offset equals: 0.
		self assert: secondWriteOutcome bytesTransferred equals: 6.
		self assert: asyncIO size equals: 12.

		readBuffer := (ByteArray new: 5)
			pinInMemory;
			yourself.
		asyncIO readInto: readBuffer offset: 6 size: 5 queue: queue.
		readOutcome := queue waitResult.
		self assert: readOutcome isRead.
		self assert: readOutcome isComplete.
		self assert: readOutcome offset equals: 6.
		self assert: readOutcome bytesTransferred equals: 5.
		self assert: readBuffer utf8Decoded equals: 'World'.
		self assert: readOutcome readString equals: 'World'.

		asyncIO closeOnQueue: queue flush: true.
		self assert: asyncIO isNull.
		closeOutcome := queue waitResult.
		self assert: closeOutcome isClose.
		self assert: closeOutcome isComplete.
		self deny: closeOutcome asyncIO isNull.
		self assert: filePath asFileReference contents equals: 'Hello World!' ] ensure: [
			asyncIO ifNotNil: [ asyncIO dispose ].
			queue ifNotNil: [ queue dispose ].
			filePath asFileReference ensureDelete ]
]

{ #category : 'tests' }
SDL3AsyncIOTest >> test03PipelinedWriteAndClose [

	| filePath queue asyncIO writeBytes firstOutcome secondOutcome |
	filePath := 'sdl3_asyncio_pipeline_test.bin'.
	filePath asFileReference ensureDelete.
	[
		DiScope own: (queue := SDL3AsyncIOQueue unownedNew).
		DiScope own: (asyncIO := SDL3AsyncIO unownedFromFile: filePath mode: 'w').

		writeBytes := #[ 10 20 30 40 ] copy
			pinInMemory;
			yourself.
		asyncIO writeByteArray: writeBytes offset: 0 queue: queue.
		asyncIO closeOnQueue: queue flush: true.

		firstOutcome := queue waitResult.
		self assert: firstOutcome isWrite.
		self assert: firstOutcome isComplete.
		self assert: firstOutcome bytesTransferred equals: 4.

		secondOutcome := queue waitResult.
		self assert: secondOutcome isClose.
		self assert: secondOutcome isComplete.
		self assert: filePath asFileReference binaryReadStream upToEnd equals: #[ 10 20 30 40 ] ] ensure: [
			asyncIO ifNotNil: [ asyncIO dispose ].
			queue ifNotNil: [ queue dispose ].
			filePath asFileReference ensureDelete ]
]

{ #category : 'tests' }
SDL3AsyncIOTest >> test04PollResultAndWaitTimeout [

	| filePath queue outcome |
	filePath := 'sdl3_asyncio_poll_test.txt'.
	filePath asFileReference ensureDelete.
	[
		filePath asFileReference writeStreamDo: [ :stream |
			stream nextPutAll: 'PollPayload' ].
		DiScope own: (queue := SDL3AsyncIOQueue unownedNew).
		outcome := SDL3AsyncIOOutcome new.
		self deny: (queue pollResultInto: outcome).
		self deny: (queue pollResultIfPresent: [ :each | true ] ifAbsent: [ false ]).
		self deny: (queue waitResultInto: outcome timeoutMS: 5).
		self deny: (queue waitResultTimeoutMS: 5 ifPresent: [ :each | true ] ifTimedOut: [ false ]).

		queue loadFileAsync: filePath.
		[ queue pollResultInto: outcome ] whileFalse: [
			(Delay forMilliseconds: 5) wait ].
		self assert: outcome isRead.
		self assert: outcome isComplete.
		self assert: outcome readStringAndFreeBuffer equals: 'PollPayload' ] ensure: [
			queue ifNotNil: [ queue dispose ].
			filePath asFileReference ensureDelete ]
]

{ #category : 'tests' }
SDL3AsyncIOTest >> test05UserdataPointer [

	| filePath queue marker asyncIO writeBytes writeOutcome readBuffer readOutcome closeOutcome loadOutcome |
	filePath := 'sdl3_asyncio_userdata_test.txt'.
	filePath asFileReference ensureDelete.
	[
		DiScope own: (queue := SDL3AsyncIOQueue unownedNew).
		DiScope own: (marker := SDL3Array unownedNewType: FFIUInt32 size: 1).
		DiScope own: (asyncIO := SDL3AsyncIO unownedFromFile: filePath mode: 'w+').

		writeBytes := 'Tag' utf8Encoded
			pinInMemory;
			yourself.
		asyncIO
			writeByteArray: writeBytes
			offset: 0
			queue: queue
			userdata: marker getHandle.
		writeOutcome := queue waitResult.
		self assert: writeOutcome userdataAddress equals: marker getHandle.

		readBuffer := (ByteArray new: 3)
			pinInMemory;
			yourself.
		asyncIO
			readInto: readBuffer
			offset: 0
			size: 3
			queue: queue
			userdata: marker getHandle.
		readOutcome := queue waitResult.
		self assert: readOutcome userdataAddress equals: marker getHandle.
		self assert: readBuffer utf8Decoded equals: 'Tag'.

		asyncIO
			closeOnQueue: queue
			flush: false
			userdata: marker getHandle.
		closeOutcome := queue waitResult.
		self assert: closeOutcome userdataAddress equals: marker getHandle.

		queue loadFileAsync: filePath userdata: marker getHandle.
		loadOutcome := queue waitResult.
		self assert: loadOutcome userdataAddress equals: marker getHandle.
		self assert: loadOutcome readStringAndFreeBuffer equals: 'Tag' ] ensure: [
			asyncIO ifNotNil: [ asyncIO dispose ].
			queue ifNotNil: [ queue dispose ].
			filePath asFileReference ensureDelete ]
]

{ #category : 'tests' }
SDL3AsyncIOTest >> test06ExternalBufferReadAndWrite [

	| filePath queue writeArray readArray asyncIO writeOutcome readOutcome |
	filePath := 'sdl3_asyncio_extarray_test.bin'.
	filePath asFileReference ensureDelete.
	[
		DiScope own: (queue := SDL3AsyncIOQueue unownedNew).
		DiScope own: (writeArray := SDL3Array unownedNewType: FFIUInt8 size: 4 collect: [ :index | index * 11 ]).
		DiScope own: (readArray := SDL3Array unownedNewType: FFIUInt8 size: 4).
		DiScope own: (asyncIO := SDL3AsyncIO unownedFromFile: filePath mode: 'w+').

		asyncIO write: writeArray offset: 0 size: 4 queue: queue.
		writeOutcome := queue waitResult.
		self assert: writeOutcome isComplete.
		self assert: writeOutcome bytesTransferred equals: 4.

		asyncIO readInto: readArray offset: 0 size: 4 queue: queue.
		readOutcome := queue waitResult.
		self assert: readOutcome isComplete.
		self assert: readOutcome readByteArray equals: #[ 11 22 33 44 ].
		self assert: readArray first equals: 11.
		self assert: readArray fourth equals: 44.

		asyncIO closeOnQueue: queue.
		self assert: queue waitResult isClose ] ensure: [
			asyncIO ifNotNil: [ asyncIO dispose ].
			queue ifNotNil: [ queue dispose ].
			filePath asFileReference ensureDelete ]
]

{ #category : 'tests' }
SDL3AsyncIOTest >> test07SignalQueue [

	| queue outcome |
	DiScope own: (queue := SDL3AsyncIOQueue unownedNew).
	outcome := SDL3AsyncIOOutcome new.
	queue signal.
	self deny: (queue waitResultInto: outcome timeoutMS: 0)
]

{ #category : 'tests' }
SDL3AsyncIOTest >> test08ErrorHandlingAndReadOnlyFailure [

	| filePath queue asyncIO forbiddenBytes writeOutcome |
	filePath := 'sdl3_asyncio_readonly_test.txt'.
	filePath asFileReference ensureDelete.
	[
		DiScope own: (queue := SDL3AsyncIOQueue unownedNew).
		self
			should: [ SDL3AsyncIO unownedFromFile: 'nonexistent_sdl3_asyncio_file.txt' mode: 'r' ]
			raise: SDL3Error.
		self
			should: [ SDL3AsyncIO unownedFromFile: filePath mode: 'invalid_mode' ]
			raise: SDL3Error.
		self
			should: [ queue loadFileAsync: 'nonexistent_sdl3_asyncio_file.txt' ]
			raise: SDL3Error.

		filePath asFileReference writeStreamDo: [ :stream |
			stream nextPutAll: 'Initial' ].
		DiScope own: (asyncIO := SDL3AsyncIO unownedFromFile: filePath mode: 'r').

		forbiddenBytes := 'Forbidden' utf8Encoded
			pinInMemory;
			yourself.
		asyncIO writeByteArray: forbiddenBytes offset: 0 queue: queue.
		writeOutcome := queue waitResult.
		self assert: writeOutcome isWrite.
		self assert: writeOutcome isFailure.
		self deny: writeOutcome isComplete.

		asyncIO closeOnQueue: queue.
		self assert: queue waitResult isClose ] ensure: [
			asyncIO ifNotNil: [ asyncIO dispose ].
			queue ifNotNil: [ queue dispose ].
			filePath asFileReference ensureDelete ]
]

{ #category : 'tests' }
SDL3AsyncIOTest >> test09AutomaticDisposalWithoutExplicitClose [

	| filePath asyncIO queue writeBytes writeOutcome |
	filePath := 'sdl3_asyncio_autodispose_test.txt'.
	filePath asFileReference ensureDelete.
	[
		DiScope during: [
			DiScope own: (asyncIO := SDL3AsyncIO unownedFromFile: filePath mode: 'w').
			self deny: asyncIO isNull ].
		self assert: asyncIO isNull.
		self assert: filePath asFileReference exists.

		DiScope during: [
			DiScope own: (queue := SDL3AsyncIOQueue unownedNew).
			DiScope own: (asyncIO := SDL3AsyncIO unownedFromFile: filePath mode: 'w').
			writeBytes := 'AutoClosed' utf8Encoded
				pinInMemory;
				yourself.
			asyncIO writeByteArray: writeBytes offset: 0 queue: queue.
			writeOutcome := queue waitResult.
			self assert: writeOutcome isComplete ].
		self assert: asyncIO isNull.
		self assert: queue isNull.
		self assert: filePath asFileReference contents equals: 'AutoClosed' ] ensure: [
			asyncIO ifNotNil: [ asyncIO dispose ].
			queue ifNotNil: [ queue dispose ].
			filePath asFileReference ensureDelete ]
]
