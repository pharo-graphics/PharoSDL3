Class {
	#name : 'SDL3GPUBufferRegion',
	#superclass : 'SDL3Structure',
	#classVars : [
		'OFFSET_BUFFER',
		'OFFSET_OFFSET',
		'OFFSET_SIZE'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'field definition' }
SDL3GPUBufferRegion class >> fieldsDesc [

	^ #(
	SDL_GPUBuffer* buffer;
	Uint32 offset;
	Uint32 size
	)
]

{ #category : 'accessing - structure variables' }
SDL3GPUBufferRegion >> buffer [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_BUFFER) type: ExternalType void asPointerType
]

{ #category : 'accessing - structure variables' }
SDL3GPUBufferRegion >> buffer: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_BUFFER put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
SDL3GPUBufferRegion >> offset [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_OFFSET
]

{ #category : 'accessing - structure variables' }
SDL3GPUBufferRegion >> offset: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_OFFSET put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUBufferRegion >> size [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_SIZE
]

{ #category : 'accessing - structure variables' }
SDL3GPUBufferRegion >> size: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_SIZE put: anObject
]
