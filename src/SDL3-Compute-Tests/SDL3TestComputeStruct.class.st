"
Minimal structure for testing structured buffers.
"
Class {
	#name : 'SDL3TestComputeStruct',
	#superclass : 'SDL3Structure',
	#classVars : [
		'OFFSET_W',
		'OFFSET_X',
		'OFFSET_Y',
		'OFFSET_Z'
	],
	#category : 'SDL3-Compute-Tests',
	#package : 'SDL3-Compute-Tests'
}

{ #category : 'field definition' }
SDL3TestComputeStruct class >> fieldsDesc [
	<script: 'self rebuildFieldAccessors'>
	^ #(
	float x;
	float y;
	float z;
	float w;
	)
]

{ #category : 'accessing - structure variables' }
SDL3TestComputeStruct >> w [
	"This method was automatically generated"
	^handle floatAt: OFFSET_W
]

{ #category : 'accessing - structure variables' }
SDL3TestComputeStruct >> w: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_W put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3TestComputeStruct >> x [
	"This method was automatically generated"
	^handle floatAt: OFFSET_X
]

{ #category : 'accessing - structure variables' }
SDL3TestComputeStruct >> x: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_X put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3TestComputeStruct >> y [
	"This method was automatically generated"
	^handle floatAt: OFFSET_Y
]

{ #category : 'accessing - structure variables' }
SDL3TestComputeStruct >> y: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_Y put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3TestComputeStruct >> z [
	"This method was automatically generated"
	^handle floatAt: OFFSET_Z
]

{ #category : 'accessing - structure variables' }
SDL3TestComputeStruct >> z: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_Z put: anObject
]
