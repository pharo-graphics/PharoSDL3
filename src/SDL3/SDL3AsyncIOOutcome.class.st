"
I am a SDL3 FFI binding for `SDL_AsyncIOOutcome`.

Information about a completed asynchronous I/O request.

See: https://wiki.libsdl.org/SDL3/SDL_AsyncIOOutcome
"
Class {
	#name : 'SDL3AsyncIOOutcome',
	#superclass : 'SDL3Structure',
	#classVars : [
		'OFFSET_ASYNCIO',
		'OFFSET_BUFFER',
		'OFFSET_BYTESREQUESTED',
		'OFFSET_BYTESTRANSFERRED',
		'OFFSET_OFFSET',
		'OFFSET_RESULT',
		'OFFSET_TYPE',
		'OFFSET_USERDATA'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'field definition' }
SDL3AsyncIOOutcome class >> fieldsDesc [

	^ #(
	SDL_AsyncIO* asyncio;
	SDL_AsyncIOTaskType type;
	SDL_AsyncIOResult result;
	void* buffer;
	Uint64 offset;
	Uint64 bytesRequested;
	Uint64 bytesTransferred;
	void* userdata
	)
]

{ #category : 'accessing' }
SDL3AsyncIOOutcome >> asyncIO [
	"Answer the SDL3AsyncIO handle associated with this task, or a null handle if created by #loadFileAsync:."

	^ SDL3AsyncIO fromHandle: (handle pointerAt: OFFSET_ASYNCIO)
]

{ #category : 'accessing - structure variables' }
SDL3AsyncIOOutcome >> asyncio [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_ASYNCIO) type: ExternalType void asPointerType
]

{ #category : 'accessing - structure variables' }
SDL3AsyncIOOutcome >> asyncio: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_ASYNCIO put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
SDL3AsyncIOOutcome >> buffer [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_BUFFER) type: ExternalType void asPointerType
]

{ #category : 'accessing - structure variables' }
SDL3AsyncIOOutcome >> buffer: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_BUFFER put: anObject getHandle.
]

{ #category : 'accessing' }
SDL3AsyncIOOutcome >> bufferAddress [
	"Answer the raw ExternalAddress of the task buffer."

	^ handle pointerAt: OFFSET_BUFFER
]

{ #category : 'accessing - structure variables' }
SDL3AsyncIOOutcome >> bytesRequested [
	"This method was automatically generated"
	^handle unsignedLongLongAt: OFFSET_BYTESREQUESTED
]

{ #category : 'accessing - structure variables' }
SDL3AsyncIOOutcome >> bytesRequested: anObject [
	"This method was automatically generated"
	handle unsignedLongLongAt: OFFSET_BYTESREQUESTED put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3AsyncIOOutcome >> bytesTransferred [
	"This method was automatically generated"
	^handle unsignedLongLongAt: OFFSET_BYTESTRANSFERRED
]

{ #category : 'accessing - structure variables' }
SDL3AsyncIOOutcome >> bytesTransferred: anObject [
	"This method was automatically generated"
	handle unsignedLongLongAt: OFFSET_BYTESTRANSFERRED put: anObject
]

{ #category : 'finalization' }
SDL3AsyncIOOutcome >> freeBuffer [
	"Free the outcome buffer allocated by #loadFileAsync:."

	self ffiLibrary free: self bufferAddress
]

{ #category : 'testing' }
SDL3AsyncIOOutcome >> isCanceled [

	^ self result = SDL3AsyncIOResult canceled
]

{ #category : 'testing' }
SDL3AsyncIOOutcome >> isClose [

	^ self type = SDL3AsyncIOTaskType close
]

{ #category : 'testing' }
SDL3AsyncIOOutcome >> isComplete [

	^ self result = SDL3AsyncIOResult complete
]

{ #category : 'testing' }
SDL3AsyncIOOutcome >> isFailure [

	^ self result = SDL3AsyncIOResult failure
]

{ #category : 'testing' }
SDL3AsyncIOOutcome >> isRead [

	^ self type = SDL3AsyncIOTaskType read
]

{ #category : 'testing' }
SDL3AsyncIOOutcome >> isWrite [

	^ self type = SDL3AsyncIOTaskType write
]

{ #category : 'accessing - structure variables' }
SDL3AsyncIOOutcome >> offset [
	"This method was automatically generated"
	^handle unsignedLongLongAt: OFFSET_OFFSET
]

{ #category : 'accessing - structure variables' }
SDL3AsyncIOOutcome >> offset: anObject [
	"This method was automatically generated"
	handle unsignedLongLongAt: OFFSET_OFFSET put: anObject
]

{ #category : 'printing' }
SDL3AsyncIOOutcome >> printOn: aStream [

	super printOn: aStream.
	aStream
		nextPut: $(;
		print: self type;
		nextPutAll: ', ';
		print: self result;
		nextPutAll: ', transferred: ';
		print: self bytesTransferred;
		nextPut: $/;
		print: self bytesRequested;
		nextPut: $)
]

{ #category : 'reading' }
SDL3AsyncIOOutcome >> readByteArray [
	"Copy and answer a ByteArray of size #bytesTransferred from the outcome buffer without freeing the buffer."

	| size bytes |
	size := self bytesTransferred.
	bytes := ByteArray new: size.
	self ffiLibrary memcpyDst: bytes src: self bufferAddress len: size.
	^ bytes
]

{ #category : 'reading' }
SDL3AsyncIOOutcome >> readByteArrayAndFreeBuffer [
	"Copy and answer a ByteArray of size #bytesTransferred from an SDL_malloc-allocated outcome buffer (such as from #loadFileAsync:), ensuring the buffer is freed via SDL_free."

	^ [ self readByteArray ] ensure: [ self freeBuffer ]
]

{ #category : 'reading' }
SDL3AsyncIOOutcome >> readString [
	"Decode and answer a UTF-8 String of #bytesTransferred bytes from the outcome buffer without freeing the buffer."

	^ self readByteArray utf8Decoded
]

{ #category : 'reading' }
SDL3AsyncIOOutcome >> readStringAndFreeBuffer [
	"Decode and answer a UTF-8 String from an SDL_malloc-allocated outcome buffer (such as from #loadFileAsync:), ensuring the buffer is freed via SDL_free."

	| address |
	address := self bufferAddress.
	^ [ address utf8StringFromCString ] ensure: [ self freeBuffer ]
]

{ #category : 'accessing - structure variables' }
SDL3AsyncIOOutcome >> result [
	"This method was automatically generated"
	^SDL3AsyncIOResult fromInteger: (handle unsignedLongAt: OFFSET_RESULT)
]

{ #category : 'accessing - structure variables' }
SDL3AsyncIOOutcome >> result: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_RESULT put: anObject value
]

{ #category : 'accessing - structure variables' }
SDL3AsyncIOOutcome >> type [
	"This method was automatically generated"
	^SDL3AsyncIOTaskType fromInteger: (handle unsignedLongAt: OFFSET_TYPE)
]

{ #category : 'accessing - structure variables' }
SDL3AsyncIOOutcome >> type: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_TYPE put: anObject value
]

{ #category : 'accessing - structure variables' }
SDL3AsyncIOOutcome >> userdata [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_USERDATA) type: ExternalType void asPointerType
]

{ #category : 'accessing - structure variables' }
SDL3AsyncIOOutcome >> userdata: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_USERDATA put: anObject getHandle.
]

{ #category : 'accessing' }
SDL3AsyncIOOutcome >> userdataAddress [
	"Answer the raw ExternalAddress of the application-defined userdata pointer."

	^ handle pointerAt: OFFSET_USERDATA
]
