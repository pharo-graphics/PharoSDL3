Class {
	#name : 'S3SDL_InitState',
	#superclass : 'S3Structure',
	#classVars : [
		'OFFSET_RESERVED',
		'OFFSET_STATUS',
		'OFFSET_THREAD'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'field definition' }
S3SDL_InitState class >> fieldsDesc [

	^ #(
	SDL_AtomicInt status;
	SDL_ThreadID thread;
	void* reserved
	)
]

{ #category : 'accessing - structure variables' }
S3SDL_InitState >> reserved [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_RESERVED) type: ExternalType void asPointerType
]

{ #category : 'accessing - structure variables' }
S3SDL_InitState >> reserved: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_RESERVED put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
S3SDL_InitState >> status [
	"This method was automatically generated"
	^ S3SDL_AtomicInt fromHandle: (handle referenceStructAt: OFFSET_STATUS length: S3SDL_AtomicInt byteSize)
]

{ #category : 'accessing - structure variables' }
S3SDL_InitState >> status: anObject [
	"This method was automatically generated"
	handle structAt: OFFSET_STATUS put: anObject getHandle length: S3SDL_AtomicInt byteSize
]

{ #category : 'accessing - structure variables' }
S3SDL_InitState >> thread [
	"This method was automatically generated"
	^handle unsignedLongLongAt: OFFSET_THREAD
]

{ #category : 'accessing - structure variables' }
S3SDL_InitState >> thread: anObject [
	"This method was automatically generated"
	handle unsignedLongLongAt: OFFSET_THREAD put: anObject
]
