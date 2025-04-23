Class {
	#name : 'SDL3GPUVertexAttribute',
	#superclass : 'SDL3Structure',
	#classVars : [
		'OFFSET_BUFFER_SLOT',
		'OFFSET_FORMAT',
		'OFFSET_LOCATION',
		'OFFSET_OFFSET'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'field definition' }
SDL3GPUVertexAttribute class >> fieldsDesc [

	^ #(
	Uint32 location;
	Uint32 buffer_slot;
	SDL_GPUVertexElementFormat format;
	Uint32 offset
	)
]

{ #category : 'accessing - structure variables' }
SDL3GPUVertexAttribute >> bufferSlot [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_BUFFER_SLOT
]

{ #category : 'accessing - structure variables' }
SDL3GPUVertexAttribute >> bufferSlot: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_BUFFER_SLOT put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUVertexAttribute >> format [
	"This method was automatically generated"
	^SDL3GPUVertexElementFormat fromInteger: (handle unsignedLongAt: OFFSET_FORMAT)
]

{ #category : 'accessing - structure variables' }
SDL3GPUVertexAttribute >> format: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_FORMAT put: anObject value
]

{ #category : 'accessing - structure variables' }
SDL3GPUVertexAttribute >> location [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_LOCATION
]

{ #category : 'accessing - structure variables' }
SDL3GPUVertexAttribute >> location: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_LOCATION put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUVertexAttribute >> offset [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_OFFSET
]

{ #category : 'accessing - structure variables' }
SDL3GPUVertexAttribute >> offset: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_OFFSET put: anObject
]
