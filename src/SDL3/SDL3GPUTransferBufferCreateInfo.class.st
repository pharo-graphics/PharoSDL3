Class {
	#name : 'SDL3GPUTransferBufferCreateInfo',
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
SDL3GPUTransferBufferCreateInfo class >> fieldsDesc [

	^ #(
	SDL_GPUTransferBufferUsage usage;
	Uint32 size;
	SDL_PropertiesID props
	)
]

{ #category : 'accessing - structure variables' }
SDL3GPUTransferBufferCreateInfo >> props [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_PROPS
]

{ #category : 'accessing - structure variables' }
SDL3GPUTransferBufferCreateInfo >> props: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_PROPS put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUTransferBufferCreateInfo >> size [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_SIZE
]

{ #category : 'accessing - structure variables' }
SDL3GPUTransferBufferCreateInfo >> size: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_SIZE put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUTransferBufferCreateInfo >> usage [
	"This method was automatically generated"
	^SDL3GPUTransferBufferUsage fromInteger: (handle unsignedLongAt: OFFSET_USAGE)
]

{ #category : 'accessing - structure variables' }
SDL3GPUTransferBufferCreateInfo >> usage: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_USAGE put: anObject value
]
