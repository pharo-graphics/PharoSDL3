Class {
	#name : 'SDL3GPUIndexedIndirectDrawCommand',
	#superclass : 'SDL3Structure',
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
SDL3GPUIndexedIndirectDrawCommand class >> fieldsDesc [

	^ #(
	Uint32 num_indices;
	Uint32 num_instances;
	Uint32 first_index;
	Sint32 vertex_offset;
	Uint32 first_instance
	)
]

{ #category : 'accessing - structure variables' }
SDL3GPUIndexedIndirectDrawCommand >> firstIndex [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_FIRST_INDEX
]

{ #category : 'accessing - structure variables' }
SDL3GPUIndexedIndirectDrawCommand >> firstIndex: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_FIRST_INDEX put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUIndexedIndirectDrawCommand >> firstInstance [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_FIRST_INSTANCE
]

{ #category : 'accessing - structure variables' }
SDL3GPUIndexedIndirectDrawCommand >> firstInstance: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_FIRST_INSTANCE put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUIndexedIndirectDrawCommand >> numIndices [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_NUM_INDICES
]

{ #category : 'accessing - structure variables' }
SDL3GPUIndexedIndirectDrawCommand >> numIndices: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_NUM_INDICES put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUIndexedIndirectDrawCommand >> numInstances [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_NUM_INSTANCES
]

{ #category : 'accessing - structure variables' }
SDL3GPUIndexedIndirectDrawCommand >> numInstances: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_NUM_INSTANCES put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUIndexedIndirectDrawCommand >> vertexOffset [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_VERTEX_OFFSET
]

{ #category : 'accessing - structure variables' }
SDL3GPUIndexedIndirectDrawCommand >> vertexOffset: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_VERTEX_OFFSET put: anObject
]
