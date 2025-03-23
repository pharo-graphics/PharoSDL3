Class {
	#name : 'S3SDL_GPUIndexedIndirectDrawCommand',
	#superclass : 'S3Structure',
	#classVars : [
		'OFFSET_FIRST_INDEX',
		'OFFSET_FIRST_INSTANCE',
		'OFFSET_NUM_INDICES',
		'OFFSET_NUM_INSTANCES',
		'OFFSET_VERTEX_OFFSET'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'field definition' }
S3SDL_GPUIndexedIndirectDrawCommand class >> fieldsDesc [

	^ #(
	Uint32 num_indices;
	Uint32 num_instances;
	Uint32 first_index;
	Sint32 vertex_offset;
	Uint32 first_instance
	)
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUIndexedIndirectDrawCommand >> first_index [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_FIRST_INDEX
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUIndexedIndirectDrawCommand >> first_index: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_FIRST_INDEX put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUIndexedIndirectDrawCommand >> first_instance [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_FIRST_INSTANCE
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUIndexedIndirectDrawCommand >> first_instance: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_FIRST_INSTANCE put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUIndexedIndirectDrawCommand >> num_indices [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_NUM_INDICES
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUIndexedIndirectDrawCommand >> num_indices: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_NUM_INDICES put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUIndexedIndirectDrawCommand >> num_instances [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_NUM_INSTANCES
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUIndexedIndirectDrawCommand >> num_instances: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_NUM_INSTANCES put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUIndexedIndirectDrawCommand >> vertex_offset [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_VERTEX_OFFSET
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUIndexedIndirectDrawCommand >> vertex_offset: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_VERTEX_OFFSET put: anObject
]
