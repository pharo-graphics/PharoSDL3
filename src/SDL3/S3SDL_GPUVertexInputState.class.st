Class {
	#name : 'S3SDL_GPUVertexInputState',
	#superclass : 'S3Structure',
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
S3SDL_GPUVertexInputState class >> fieldsDesc [

	^ #(
	SDL_GPUVertexBufferDescription* vertex_buffer_descriptions;
	Uint32 num_vertex_buffers;
	SDL_GPUVertexAttribute* vertex_attributes;
	Uint32 num_vertex_attributes
	)
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUVertexInputState >> num_vertex_attributes [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_NUM_VERTEX_ATTRIBUTES
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUVertexInputState >> num_vertex_attributes: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_NUM_VERTEX_ATTRIBUTES put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUVertexInputState >> num_vertex_buffers [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_NUM_VERTEX_BUFFERS
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUVertexInputState >> num_vertex_buffers: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_NUM_VERTEX_BUFFERS put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUVertexInputState >> vertex_attributes [
	"This method was automatically generated"
	^S3SDL_GPUVertexAttribute fromHandle: (handle pointerAt: OFFSET_VERTEX_ATTRIBUTES)
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUVertexInputState >> vertex_attributes: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_VERTEX_ATTRIBUTES put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUVertexInputState >> vertex_buffer_descriptions [
	"This method was automatically generated"
	^S3SDL_GPUVertexBufferDescription fromHandle: (handle pointerAt: OFFSET_VERTEX_BUFFER_DESCRIPTIONS)
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUVertexInputState >> vertex_buffer_descriptions: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_VERTEX_BUFFER_DESCRIPTIONS put: anObject getHandle.
]
