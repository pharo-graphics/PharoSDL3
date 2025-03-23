Class {
	#name : 'S3SDL_GPUIndirectDrawCommand',
	#superclass : 'S3Structure',
	#classVars : [
		'OFFSET_FIRST_INSTANCE',
		'OFFSET_FIRST_VERTEX',
		'OFFSET_NUM_INSTANCES',
		'OFFSET_NUM_VERTICES'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'field definition' }
S3SDL_GPUIndirectDrawCommand class >> fieldsDesc [

	^ #(
	Uint32 num_vertices;
	Uint32 num_instances;
	Uint32 first_vertex;
	Uint32 first_instance
	)
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUIndirectDrawCommand >> first_instance [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_FIRST_INSTANCE
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUIndirectDrawCommand >> first_instance: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_FIRST_INSTANCE put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUIndirectDrawCommand >> first_vertex [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_FIRST_VERTEX
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUIndirectDrawCommand >> first_vertex: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_FIRST_VERTEX put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUIndirectDrawCommand >> num_instances [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_NUM_INSTANCES
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUIndirectDrawCommand >> num_instances: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_NUM_INSTANCES put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUIndirectDrawCommand >> num_vertices [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_NUM_VERTICES
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUIndirectDrawCommand >> num_vertices: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_NUM_VERTICES put: anObject
]
