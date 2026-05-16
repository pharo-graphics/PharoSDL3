Class {
	#name : 'SDL3GPUBoidsVertex',
	#superclass : 'SDL3Structure',
	#classVars : [
		'OFFSET_HUE',
		'OFFSET_PADDING',
		'OFFSET_X',
		'OFFSET_Y'
	],
	#category : 'SDL3-GPUDemos-Boids',
	#package : 'SDL3-GPUDemos',
	#tag : 'Boids'
}

{ #category : 'field definition' }
SDL3GPUBoidsVertex class >> fieldsDesc [
	<script: 'self rebuildFieldAccessors'>

	^ #(
	float x;
	float y;
	float hue;
	float padding;
	)
]

{ #category : 'accessing - structure variables' }
SDL3GPUBoidsVertex >> hue [
	"This method was automatically generated"
	^handle floatAt: OFFSET_HUE
]

{ #category : 'accessing - structure variables' }
SDL3GPUBoidsVertex >> hue: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_HUE put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUBoidsVertex >> padding [
	"This method was automatically generated"
	^handle floatAt: OFFSET_PADDING
]

{ #category : 'accessing - structure variables' }
SDL3GPUBoidsVertex >> padding: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_PADDING put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUBoidsVertex >> x [
	"This method was automatically generated"
	^handle floatAt: OFFSET_X
]

{ #category : 'accessing - structure variables' }
SDL3GPUBoidsVertex >> x: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_X put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUBoidsVertex >> y [
	"This method was automatically generated"
	^handle floatAt: OFFSET_Y
]

{ #category : 'accessing - structure variables' }
SDL3GPUBoidsVertex >> y: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_Y put: anObject
]
