Class {
	#name : 'SDL3GPUNode',
	#superclass : 'SDL3Structure',
	#classVars : [
		'OFFSET_HUE',
		'OFFSET_ISSELECTED',
		'OFFSET_PADDING',
		'OFFSET_RADIUS',
		'OFFSET_VX',
		'OFFSET_VY',
		'OFFSET_X',
		'OFFSET_Y'
	],
	#category : 'SDL3-GPUDemos-NodeGraph',
	#package : 'SDL3-GPUDemos',
	#tag : 'NodeGraph'
}

{ #category : 'field definition' }
SDL3GPUNode class >> fieldsDesc [
	<script: 'self rebuildFieldAccessors'>

	^ #(
	float x;
	float y;
	float vx;
	float vy;
	float radius;
	float hue;
	uint isSelected;
	uint padding;
	)
]

{ #category : 'accessing - structure variables' }
SDL3GPUNode >> hue [
	"This method was automatically generated"
	^handle floatAt: OFFSET_HUE
]

{ #category : 'accessing - structure variables' }
SDL3GPUNode >> hue: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_HUE put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUNode >> isSelected [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_ISSELECTED
]

{ #category : 'accessing - structure variables' }
SDL3GPUNode >> isSelected: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_ISSELECTED put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUNode >> padding [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_PADDING
]

{ #category : 'accessing - structure variables' }
SDL3GPUNode >> padding: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_PADDING put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUNode >> radius [
	"This method was automatically generated"
	^handle floatAt: OFFSET_RADIUS
]

{ #category : 'accessing - structure variables' }
SDL3GPUNode >> radius: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_RADIUS put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUNode >> vx [
	"This method was automatically generated"
	^handle floatAt: OFFSET_VX
]

{ #category : 'accessing - structure variables' }
SDL3GPUNode >> vx: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_VX put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUNode >> vy [
	"This method was automatically generated"
	^handle floatAt: OFFSET_VY
]

{ #category : 'accessing - structure variables' }
SDL3GPUNode >> vy: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_VY put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUNode >> x [
	"This method was automatically generated"
	^handle floatAt: OFFSET_X
]

{ #category : 'accessing - structure variables' }
SDL3GPUNode >> x: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_X put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUNode >> y [
	"This method was automatically generated"
	^handle floatAt: OFFSET_Y
]

{ #category : 'accessing - structure variables' }
SDL3GPUNode >> y: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_Y put: anObject
]
