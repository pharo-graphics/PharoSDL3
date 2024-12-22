Class {
	#name : 'S3SDL_GPUTransferBufferCreateInfo',
	#superclass : 'S3Structure',
	#classVars : [
		'OFFSET_PROPS',
		'OFFSET_SIZE',
		'OFFSET_USAGE'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'field definition' }
S3SDL_GPUTransferBufferCreateInfo class >> fieldsDesc [

	^ #(
	SDL_GPUTransferBufferUsage usage;
	int size;
	int props
	)
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUTransferBufferCreateInfo >> props [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_PROPS
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUTransferBufferCreateInfo >> props: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_PROPS put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUTransferBufferCreateInfo >> size [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_SIZE
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUTransferBufferCreateInfo >> size: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_SIZE put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUTransferBufferCreateInfo >> usage [
	"This method was automatically generated"
	^S3SDL_GPUTransferBufferUsage fromInteger: (handle unsignedLongAt: OFFSET_USAGE)
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUTransferBufferCreateInfo >> usage: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_USAGE put: anObject value
]
