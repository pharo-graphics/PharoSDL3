Class {
	#name : 'SDL3GPUVertexInputState',
	#superclass : 'SDL3Structure',
	#classVars : [
		'OFFSET_NUM_VERTEX_ATTRIBUTES',
		'OFFSET_NUM_VERTEX_BUFFERS',
		'OFFSET_VERTEX_ATTRIBUTES',
		'OFFSET_VERTEX_BUFFER_DESCRIPTIONS'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'field definition' }
SDL3GPUVertexInputState class >> fieldsDesc [

	^ #(
	SDL_GPUVertexBufferDescription* vertex_buffer_descriptions;
	Uint32 num_vertex_buffers;
	SDL_GPUVertexAttribute* vertex_attributes;
	Uint32 num_vertex_attributes
	)
]

{ #category : 'accessing - structure variables' }
SDL3GPUVertexInputState >> numVertexAttributes [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_NUM_VERTEX_ATTRIBUTES
]

{ #category : 'accessing - structure variables' }
SDL3GPUVertexInputState >> numVertexAttributes: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_NUM_VERTEX_ATTRIBUTES put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUVertexInputState >> numVertexBuffers [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_NUM_VERTEX_BUFFERS
]

{ #category : 'accessing - structure variables' }
SDL3GPUVertexInputState >> numVertexBuffers: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_NUM_VERTEX_BUFFERS put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUVertexInputState >> vertexAttributes [
	"This method was automatically generated"
	^SDL3GPUVertexAttribute fromHandle: (handle pointerAt: OFFSET_VERTEX_ATTRIBUTES)
]

{ #category : 'accessing - structure variables' }
SDL3GPUVertexInputState >> vertexAttributes: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_VERTEX_ATTRIBUTES put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
SDL3GPUVertexInputState >> vertexBufferDescriptions [
	"This method was automatically generated"
	^SDL3GPUVertexBufferDescription fromHandle: (handle pointerAt: OFFSET_VERTEX_BUFFER_DESCRIPTIONS)
]

{ #category : 'accessing - structure variables' }
SDL3GPUVertexInputState >> vertexBufferDescriptions: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_VERTEX_BUFFER_DESCRIPTIONS put: anObject getHandle.
]
