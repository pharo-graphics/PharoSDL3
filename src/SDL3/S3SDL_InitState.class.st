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
	int status;
	int thread;
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
	^handle signedLongAt: OFFSET_STATUS
]

{ #category : 'accessing - structure variables' }
S3SDL_InitState >> status: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_STATUS put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_InitState >> thread [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_THREAD
]

{ #category : 'accessing - structure variables' }
S3SDL_InitState >> thread: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_THREAD put: anObject
]
