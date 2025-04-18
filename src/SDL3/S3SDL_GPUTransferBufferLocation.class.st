Class {
	#name : 'S3SDL_GPUTransferBufferLocation',
	#superclass : 'S3Structure',
	#classVars : [
		'OFFSET_OFFSET',
		'OFFSET_TRANSFER_BUFFER'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'field definition' }
S3SDL_GPUTransferBufferLocation class >> fieldsDesc [

	^ #(
	SDL_GPUTransferBuffer* transfer_buffer;
	Uint32 offset
	)
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUTransferBufferLocation >> offset [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_OFFSET
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUTransferBufferLocation >> offset: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_OFFSET put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUTransferBufferLocation >> transfer_buffer [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_TRANSFER_BUFFER) type: ExternalType void asPointerType
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUTransferBufferLocation >> transfer_buffer: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_TRANSFER_BUFFER put: anObject getHandle.
]
