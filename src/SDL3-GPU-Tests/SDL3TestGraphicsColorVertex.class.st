"
I represent a vertex with position and color.
"
Class {
	#name : 'SDL3TestGraphicsColorVertex',
	#superclass : 'SDL3Structure',
	#classVars : [
		'OFFSET_A',
		'OFFSET_B',
		'OFFSET_G',
		'OFFSET_R',
		'OFFSET_X',
		'OFFSET_Y',
		'OFFSET_Z'
	],
	#category : 'SDL3-GPU-Tests-GraphicsPipeline',
	#package : 'SDL3-GPU-Tests',
	#tag : 'GraphicsPipeline'
}

{ #category : 'field definition' }
SDL3TestGraphicsColorVertex class >> fieldsDesc [

	^ #(
	float x;
	float y;
	float z;
	float r;
	float g;
	float b;
	float a
	)
]

{ #category : 'accessing - structure variables' }
SDL3TestGraphicsColorVertex >> a [
	"This method was automatically generated"
	^handle floatAt: OFFSET_A
]

{ #category : 'accessing - structure variables' }
SDL3TestGraphicsColorVertex >> a: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_A put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3TestGraphicsColorVertex >> b [
	"This method was automatically generated"
	^handle floatAt: OFFSET_B
]

{ #category : 'accessing - structure variables' }
SDL3TestGraphicsColorVertex >> b: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_B put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3TestGraphicsColorVertex >> g [
	"This method was automatically generated"
	^handle floatAt: OFFSET_G
]

{ #category : 'accessing - structure variables' }
SDL3TestGraphicsColorVertex >> g: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_G put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3TestGraphicsColorVertex >> r [
	"This method was automatically generated"
	^handle floatAt: OFFSET_R
]

{ #category : 'accessing - structure variables' }
SDL3TestGraphicsColorVertex >> r: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_R put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3TestGraphicsColorVertex >> x [
	"This method was automatically generated"
	^handle floatAt: OFFSET_X
]

{ #category : 'accessing - structure variables' }
SDL3TestGraphicsColorVertex >> x: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_X put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3TestGraphicsColorVertex >> y [
	"This method was automatically generated"
	^handle floatAt: OFFSET_Y
]

{ #category : 'accessing - structure variables' }
SDL3TestGraphicsColorVertex >> y: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_Y put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3TestGraphicsColorVertex >> z [
	"This method was automatically generated"
	^handle floatAt: OFFSET_Z
]

{ #category : 'accessing - structure variables' }
SDL3TestGraphicsColorVertex >> z: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_Z put: anObject
]
