"
Minimal structure for testing compute uniforms.
"
Class {
	#name : 'SDL3TestComputeUniforms',
	#superclass : 'SDL3Structure',
	#classVars : [
		'OFFSET_MULTIPLIER',
		'OFFSET_OFFSET',
		'OFFSET_PAD1',
		'OFFSET_PAD2'
	],
	#category : 'SDL3-GPU-Tests-ComputePipeline',
	#package : 'SDL3-GPU-Tests',
	#tag : 'ComputePipeline'
}

{ #category : 'field definition' }
SDL3TestComputeUniforms class >> fieldsDesc [
	<script: 'self rebuildFieldAccessors'>
	^ #(
	float multiplier;
	float offset;
	float pad1;
	float pad2;
	)
]

{ #category : 'accessing - structure variables' }
SDL3TestComputeUniforms >> multiplier [
	"This method was automatically generated"
	^handle floatAt: OFFSET_MULTIPLIER
]

{ #category : 'accessing - structure variables' }
SDL3TestComputeUniforms >> multiplier: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_MULTIPLIER put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3TestComputeUniforms >> offset [
	"This method was automatically generated"
	^handle floatAt: OFFSET_OFFSET
]

{ #category : 'accessing - structure variables' }
SDL3TestComputeUniforms >> offset: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_OFFSET put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3TestComputeUniforms >> pad1 [
	"This method was automatically generated"
	^handle floatAt: OFFSET_PAD1
]

{ #category : 'accessing - structure variables' }
SDL3TestComputeUniforms >> pad1: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_PAD1 put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3TestComputeUniforms >> pad2 [
	"This method was automatically generated"
	^handle floatAt: OFFSET_PAD2
]

{ #category : 'accessing - structure variables' }
SDL3TestComputeUniforms >> pad2: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_PAD2 put: anObject
]
