Class {
	#name : 'S3SDL_GPUBufferBinding',
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
S3SDL_GPUBufferBinding class >> fieldsDesc [

	^ #(
	SDL_GPUBuffer* buffer;
	Uint32 offset
	)
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUBufferBinding >> buffer [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_BUFFER) type: ExternalType void asPointerType
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUBufferBinding >> buffer: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_BUFFER put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUBufferBinding >> offset [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_OFFSET
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUBufferBinding >> offset: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_OFFSET put: anObject
]
