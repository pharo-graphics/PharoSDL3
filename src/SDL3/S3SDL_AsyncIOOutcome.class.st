Class {
	#name : 'S3SDL_AsyncIOOutcome',
	#superclass : 'S3Structure',
	#classVars : [
		'OFFSET_ASYNCIO',
		'OFFSET_BUFFER',
		'OFFSET_BYTES_REQUESTED',
		'OFFSET_BYTES_TRANSFERRED',
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
S3SDL_AsyncIOOutcome class >> fieldsDesc [

	^ #(
	SDL_AsyncIO* asyncio;
	SDL_AsyncIOTaskType type;
	SDL_AsyncIOResult result;
	void* buffer;
	Uint64 offset;
	Uint64 bytes_requested;
	Uint64 bytes_transferred;
	void* userdata
	)
]

{ #category : 'accessing - structure variables' }
S3SDL_AsyncIOOutcome >> asyncio [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_ASYNCIO) type: ExternalType void asPointerType
]

{ #category : 'accessing - structure variables' }
S3SDL_AsyncIOOutcome >> asyncio: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_ASYNCIO put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
S3SDL_AsyncIOOutcome >> buffer [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_BUFFER) type: ExternalType void asPointerType
]

{ #category : 'accessing - structure variables' }
S3SDL_AsyncIOOutcome >> buffer: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_BUFFER put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
S3SDL_AsyncIOOutcome >> bytes_requested [
	"This method was automatically generated"
	^handle unsignedLongLongAt: OFFSET_BYTES_REQUESTED
]

{ #category : 'accessing - structure variables' }
S3SDL_AsyncIOOutcome >> bytes_requested: anObject [
	"This method was automatically generated"
	handle unsignedLongLongAt: OFFSET_BYTES_REQUESTED put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_AsyncIOOutcome >> bytes_transferred [
	"This method was automatically generated"
	^handle unsignedLongLongAt: OFFSET_BYTES_TRANSFERRED
]

{ #category : 'accessing - structure variables' }
S3SDL_AsyncIOOutcome >> bytes_transferred: anObject [
	"This method was automatically generated"
	handle unsignedLongLongAt: OFFSET_BYTES_TRANSFERRED put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_AsyncIOOutcome >> offset [
	"This method was automatically generated"
	^handle unsignedLongLongAt: OFFSET_OFFSET
]

{ #category : 'accessing - structure variables' }
S3SDL_AsyncIOOutcome >> offset: anObject [
	"This method was automatically generated"
	handle unsignedLongLongAt: OFFSET_OFFSET put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_AsyncIOOutcome >> result [
	"This method was automatically generated"
	^S3SDL_AsyncIOResult fromInteger: (handle unsignedLongAt: OFFSET_RESULT)
]

{ #category : 'accessing - structure variables' }
S3SDL_AsyncIOOutcome >> result: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_RESULT put: anObject value
]

{ #category : 'accessing - structure variables' }
S3SDL_AsyncIOOutcome >> type [
	"This method was automatically generated"
	^S3SDL_AsyncIOTaskType fromInteger: (handle unsignedLongAt: OFFSET_TYPE)
]

{ #category : 'accessing - structure variables' }
S3SDL_AsyncIOOutcome >> type: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_TYPE put: anObject value
]

{ #category : 'accessing - structure variables' }
S3SDL_AsyncIOOutcome >> userdata [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_USERDATA) type: ExternalType void asPointerType
]

{ #category : 'accessing - structure variables' }
S3SDL_AsyncIOOutcome >> userdata: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_USERDATA put: anObject getHandle.
]
