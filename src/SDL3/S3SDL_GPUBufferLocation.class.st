Class {
	#name : 'S3SDL_GPUBufferLocation',
	#superclass : 'S3Structure',
	#classVars : [
		'OFFSET_BUFFER',
		'OFFSET_OFFSET'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'field definition' }
S3SDL_GPUBufferLocation class >> fieldsDesc [

	^ #(
	SDL_GPUBuffer* buffer;
	int offset
	)
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUBufferLocation >> buffer [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_BUFFER) type: ExternalType void asPointerType
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUBufferLocation >> buffer: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_BUFFER put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUBufferLocation >> offset [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_OFFSET
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUBufferLocation >> offset: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_OFFSET put: anObject
]
