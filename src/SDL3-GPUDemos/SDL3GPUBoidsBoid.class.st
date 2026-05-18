Class {
	#name : 'SDL3GPUBoidsBoid',
	#superclass : 'SDL3Structure',
	#classVars : [
		'OFFSET_VX',
		'OFFSET_VY',
		'OFFSET_X',
		'OFFSET_Y'
	],
	#category : 'SDL3-GPUDemos-Boids',
	#package : 'SDL3-GPUDemos',
	#tag : 'Boids'
}

{ #category : 'field definition' }
SDL3GPUBoidsBoid class >> fieldsDesc [
	<script: 'self rebuildFieldAccessors'>

	^ #(
	float x;
	float y;
	float vx;
	float vy;
	)
]

{ #category : 'accessing - structure variables' }
SDL3GPUBoidsBoid >> vx [
	"This method was automatically generated"
	^handle floatAt: OFFSET_VX
]

{ #category : 'accessing - structure variables' }
SDL3GPUBoidsBoid >> vx: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_VX put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUBoidsBoid >> vy [
	"This method was automatically generated"
	^handle floatAt: OFFSET_VY
]

{ #category : 'accessing - structure variables' }
SDL3GPUBoidsBoid >> vy: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_VY put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUBoidsBoid >> x [
	"This method was automatically generated"
	^handle floatAt: OFFSET_X
]

{ #category : 'accessing - structure variables' }
SDL3GPUBoidsBoid >> x: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_X put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUBoidsBoid >> y [
	"This method was automatically generated"
	^handle floatAt: OFFSET_Y
]

{ #category : 'accessing - structure variables' }
SDL3GPUBoidsBoid >> y: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_Y put: anObject
]
