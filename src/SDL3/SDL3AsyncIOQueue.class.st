"
I am a SDL3 FFI binding for `SDL_AsyncIOQueue`.

A queue of completed asynchronous I/O tasks.

See: https://wiki.libsdl.org/SDL3/SDL_AsyncIOQueue
"
Class {
	#name : 'SDL3AsyncIOQueue',
	#superclass : 'SDL3BaseObject',
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'instance creation' }
SDL3AsyncIOQueue class >> unownedNew [
	"Answer a new task queue for tracking asynchronous I/O operations.
	The sender is responsible for freeing the returned queue using #destroy or #dispose.

	See: https://wiki.libsdl.org/SDL3/SDL_CreateAsyncIOQueue"

	^ self ffiLibrary createAsyncIOQueue
		assertNotNullReturn;
		yourself
]

{ #category : 'finalization' }
SDL3AsyncIOQueue >> destroy [
	"Destroy this task queue.

	Note: If there are tasks pending for this queue, this operation blocks the Pharo VM thread until those tasks are finished."

	self ffiLibrary destroyAsyncIOQueue: self
]

{ #category : 'operations' }
SDL3AsyncIOQueue >> loadFileAsync: aPath [

	self
		loadFileAsync: aPath
		userdata: ExternalAddress null
]

{ #category : 'operations' }
SDL3AsyncIOQueue >> loadFileAsync: aPath userdata: aPointerOrNil [
	"Asynchronously load all data from the file at aPath and enqueue the completion outcome onto me.
	The buffer in the resulting SDL3AsyncIOOutcome is allocated via SDL_malloc with a trailing null byte and must be freed by the sender (for example via #readByteArrayAndFreeBuffer, #readStringAndFreeBuffer, or #freeBuffer)."

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			loadFileAsyncFile: aPath
			queue: self
			userdata: aPointerOrNil)
]

{ #category : 'operations' }
SDL3AsyncIOQueue >> pollResultIfPresent: aPresentBlock ifAbsent: anAbsentBlock [

	| outcome |
	outcome := SDL3AsyncIOOutcome new.
	^ (self pollResultInto: outcome)
		ifTrue: [ aPresentBlock value: outcome ]
		ifFalse: [ anAbsentBlock value ]
]

{ #category : 'operations' }
SDL3AsyncIOQueue >> pollResultInto: anOutcome [
	"Non-blockingly query me for a completed task. If a task has finished, populate anOutcome and answer true; otherwise answer false."

	^ self ffiLibrary
		getAsyncIOResultQueue: self
		outcome: anOutcome
]

{ #category : 'operations' }
SDL3AsyncIOQueue >> signal [
	"Wake up any threads currently sleeping in #waitResultInto:timeoutMS: on this queue."

	self ffiLibrary signalAsyncIOQueue: self
]

{ #category : 'operations' }
SDL3AsyncIOQueue >> waitResult [
	"Block the Pharo VM thread until a task in this queue completes, and answer its SDL3AsyncIOOutcome."

	| outcome |
	outcome := SDL3AsyncIOOutcome new.
	[ self waitResultInto: outcome timeoutMS: -1 ] whileFalse.
	^ outcome
]

{ #category : 'operations' }
SDL3AsyncIOQueue >> waitResultInto: anOutcome [
	"Block the Pharo VM thread until a task in this queue completes (or the queue is signaled). Populate anOutcome and answer true if a task completed, or false otherwise."

	^ self waitResultInto: anOutcome timeoutMS: -1
]

{ #category : 'operations' }
SDL3AsyncIOQueue >> waitResultInto: anOutcome timeoutMS: anInteger [
	"Block the Pharo VM thread up to anInteger milliseconds (or indefinitely if -1) for a task in this queue to complete. If a task has finished, populate anOutcome and answer true; otherwise answer false."

	^ self ffiLibrary
		waitAsyncIOResultQueue: self
		outcome: anOutcome
		timeoutMS: anInteger
]

{ #category : 'operations' }
SDL3AsyncIOQueue >> waitResultTimeoutMS: anInteger ifPresent: aPresentBlock ifTimedOut: aTimeoutBlock [
	"Block the Pharo VM thread up to anInteger milliseconds (or indefinitely if -1) for a task in this queue to complete. Evaluate aPresentBlock with the SDL3AsyncIOOutcome if a task completed, or aTimeoutBlock otherwise."

	| outcome |
	outcome := SDL3AsyncIOOutcome new.
	^ (self waitResultInto: outcome timeoutMS: anInteger)
		ifTrue: [ aPresentBlock value: outcome ]
		ifFalse: [ aTimeoutBlock value ]
]
