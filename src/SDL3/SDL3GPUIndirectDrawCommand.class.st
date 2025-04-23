Class {
	#name : 'SDL3GPUIndirectDrawCommand',
	#superclass : 'SDL3Structure',
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
SDL3GPUIndirectDrawCommand class >> fieldsDesc [

	^ #(
	Uint32 num_vertices;
	Uint32 num_instances;
	Uint32 first_vertex;
	Uint32 first_instance
	)
]

{ #category : 'accessing - structure variables' }
SDL3GPUIndirectDrawCommand >> firstInstance [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_FIRST_INSTANCE
]

{ #category : 'accessing - structure variables' }
SDL3GPUIndirectDrawCommand >> firstInstance: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_FIRST_INSTANCE put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUIndirectDrawCommand >> firstVertex [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_FIRST_VERTEX
]

{ #category : 'accessing - structure variables' }
SDL3GPUIndirectDrawCommand >> firstVertex: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_FIRST_VERTEX put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUIndirectDrawCommand >> numInstances [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_NUM_INSTANCES
]

{ #category : 'accessing - structure variables' }
SDL3GPUIndirectDrawCommand >> numInstances: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_NUM_INSTANCES put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUIndirectDrawCommand >> numVertices [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_NUM_VERTICES
]

{ #category : 'accessing - structure variables' }
SDL3GPUIndirectDrawCommand >> numVertices: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_NUM_VERTICES put: anObject
]
