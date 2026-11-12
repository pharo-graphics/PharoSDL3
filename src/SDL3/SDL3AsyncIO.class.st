"
I am a SDL3 FFI binding for `SDL_AsyncIO`.

The asynchronous I/O operation structure.

See: https://wiki.libsdl.org/SDL3/SDL_AsyncIO
"
Class {
	#name : 'SDL3AsyncIO',
	#superclass : 'SDL3BaseObject',
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'instance creation' }
SDL3AsyncIO class >> unownedFromFile: aPath mode: aModeString [
	"Answer an unowned asynchronous I/O object for reading from or writing to the file at aPath, with mode aModeString (""r"", ""w"", ""r+"", or ""w+"").
	The sender is responsible for closing the returned object using #closeOnQueue:flush: or #dispose.

	See: https://wiki.libsdl.org/SDL3/SDL_AsyncIOFromFile"

	^ (self ffiLibrary asyncIOFromFile: aPath mode: aModeString)
		assertNotNullReturn;
		yourself
]

{ #category : 'finalization' }
SDL3AsyncIO >> closeOnQueue: aQueue [

	self closeOnQueue: aQueue flush: false
]

{ #category : 'finalization' }
SDL3AsyncIO >> closeOnQueue: aQueue flush: aBoolean [

	self
		closeOnQueue: aQueue
		flush: aBoolean
		userdata: ExternalAddress null
]

{ #category : 'finalization' }
SDL3AsyncIO >> closeOnQueue: aQueue flush: aBoolean userdata: aPointerOrNil [
	"Enqueue an asynchronous close task on aQueue, optionally flushing written data to physical storage before completing.
	Once this operation succeeds, my handle is consumed and no longer valid."

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			closeAsyncIO: self
			flush: aBoolean
			queue: aQueue
			userdata: aPointerOrNil).
	handle beNull
]

{ #category : 'finalization' }
SDL3AsyncIO >> destroy [
	"Close and free me synchronously via a temporary queue if I have not already been closed on a queue."

	| temporaryQueue |
	temporaryQueue := SDL3AsyncIOQueue unownedNew.
	[ self closeOnQueue: temporaryQueue flush: false ]
		ensure: [ temporaryQueue dispose ]
]

{ #category : 'reading' }
SDL3AsyncIO >> readInto: aBuffer offset: anOffset size: aByteSize queue: aQueue [

	self
		readInto: aBuffer
		offset: anOffset
		size: aByteSize
		queue: aQueue
		userdata: ExternalAddress null
]

{ #category : 'reading' }
SDL3AsyncIO >> readInto: aBuffer offset: anOffset size: aByteSize queue: aQueue userdata: aPointerOrNil [
	"Start an asynchronous read of up to aByteSize bytes from anOffset into aBuffer, posting the completion outcome to aQueue.
	The buffer must remain valid and at a fixed memory address until the task completes (e.g. an external buffer such as SDL3Array, or a ByteArray pinned via #pinInMemory)."

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			readAsyncIO: self
			ptr: aBuffer
			offset: anOffset
			size: aByteSize
			queue: aQueue
			userdata: aPointerOrNil)
]

{ #category : 'accessing' }
SDL3AsyncIO >> size [

	| streamSize |
	streamSize := self ffiLibrary getAsyncIOSize: self.
	streamSize < 0 ifTrue: [ SDL3Error signalFromLibraryErrorMessage ].
	^ streamSize
]

{ #category : 'writing' }
SDL3AsyncIO >> write: aBuffer offset: anOffset size: aByteSize queue: aQueue [

	self
		write: aBuffer
		offset: anOffset
		size: aByteSize
		queue: aQueue
		userdata: ExternalAddress null
]

{ #category : 'writing' }
SDL3AsyncIO >> write: aBuffer offset: anOffset size: aByteSize queue: aQueue userdata: aPointerOrNil [
	"Start an asynchronous write of aByteSize bytes from aBuffer to anOffset, posting the completion outcome to aQueue.
	The buffer is not copied; it must remain valid and at a fixed memory address until the task completes (e.g. an external buffer such as SDL3Array, or a ByteArray pinned via #pinInMemory)."

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			writeAsyncIO: self
			ptr: aBuffer
			offset: anOffset
			size: aByteSize
			queue: aQueue
			userdata: aPointerOrNil)
]

{ #category : 'writing' }
SDL3AsyncIO >> writeByteArray: aByteArray offset: anOffset queue: aQueue [

	self
		writeByteArray: aByteArray
		offset: anOffset
		queue: aQueue
		userdata: ExternalAddress null
]

{ #category : 'writing' }
SDL3AsyncIO >> writeByteArray: aByteArray offset: anOffset queue: aQueue userdata: aPointerOrNil [

	self
		write: aByteArray
		offset: anOffset
		size: aByteArray size
		queue: aQueue
		userdata: aPointerOrNil
]
