Class {
	#name : 'SDL3GPUVertex',
	#superclass : 'SDL3Structure',
	#classVars : [
		'OFFSET_U',
		'OFFSET_V',
		'OFFSET_X',
		'OFFSET_Y',
		'OFFSET_Z'
	],
	#category : 'SDL3-Tests-Quad',
	#package : 'SDL3-Tests',
	#tag : 'Quad'
}

{ #category : 'field definition' }
SDL3GPUVertex class >> fieldsDesc [

	^ #(
	float x;
	float y;
	float z;
	float u;
	float v
	)
]

{ #category : 'accessing - structure variables' }
SDL3GPUVertex >> u [
	"This method was automatically generated"
	^handle floatAt: OFFSET_U
]

{ #category : 'accessing - structure variables' }
SDL3GPUVertex >> u: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_U put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUVertex >> v [
	"This method was automatically generated"
	^handle floatAt: OFFSET_V
]

{ #category : 'accessing - structure variables' }
SDL3GPUVertex >> v: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_V put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUVertex >> x [
	"This method was automatically generated"
	^handle floatAt: OFFSET_X
]

{ #category : 'accessing - structure variables' }
SDL3GPUVertex >> x: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_X put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUVertex >> y [
	"This method was automatically generated"
	^handle floatAt: OFFSET_Y
]

{ #category : 'accessing - structure variables' }
SDL3GPUVertex >> y: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_Y put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUVertex >> z [
	"This method was automatically generated"
	^handle floatAt: OFFSET_Z
]

{ #category : 'accessing - structure variables' }
SDL3GPUVertex >> z: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_Z put: anObject
]
