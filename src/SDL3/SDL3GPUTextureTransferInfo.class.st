Class {
	#name : 'SDL3GPUTextureTransferInfo',
	#superclass : 'SDL3Structure',
	#classVars : [
		'OFFSET_OFFSET',
		'OFFSET_PIXELS_PER_ROW',
		'OFFSET_ROWS_PER_LAYER',
		'OFFSET_TRANSFER_BUFFER'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'field definition' }
SDL3GPUTextureTransferInfo class >> fieldsDesc [

	^ #(
	SDL_GPUTransferBuffer* transfer_buffer;
	Uint32 offset;
	Uint32 pixels_per_row;
	Uint32 rows_per_layer
	)
]

{ #category : 'accessing - structure variables' }
SDL3GPUTextureTransferInfo >> offset [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_OFFSET
]

{ #category : 'accessing - structure variables' }
SDL3GPUTextureTransferInfo >> offset: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_OFFSET put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUTextureTransferInfo >> pixels_per_row [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_PIXELS_PER_ROW
]

{ #category : 'accessing - structure variables' }
SDL3GPUTextureTransferInfo >> pixels_per_row: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_PIXELS_PER_ROW put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUTextureTransferInfo >> rows_per_layer [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_ROWS_PER_LAYER
]

{ #category : 'accessing - structure variables' }
SDL3GPUTextureTransferInfo >> rows_per_layer: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_ROWS_PER_LAYER put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUTextureTransferInfo >> transfer_buffer [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_TRANSFER_BUFFER) type: ExternalType void asPointerType
]

{ #category : 'accessing - structure variables' }
SDL3GPUTextureTransferInfo >> transfer_buffer: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_TRANSFER_BUFFER put: anObject getHandle.
]
