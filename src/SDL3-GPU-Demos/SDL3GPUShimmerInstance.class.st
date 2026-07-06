"
I represent the instance data for a shimmer panel, including its bounds and corner radius.
"
Class {
	#name : 'SDL3GPUShimmerInstance',
	#superclass : 'SDL3Structure',
	#classVars : [
		'OFFSET_H',
		'OFFSET_PADDING1',
		'OFFSET_PADDING2',
		'OFFSET_PADDING3',
		'OFFSET_RADIUS',
		'OFFSET_W',
		'OFFSET_X',
		'OFFSET_Y'
	],
	#category : 'SDL3-GPU-Demos-Shimmer',
	#package : 'SDL3-GPU-Demos',
	#tag : 'Shimmer'
}

{ #category : 'field definition' }
SDL3GPUShimmerInstance class >> fieldsDesc [
	<script: 'self rebuildFieldAccessors'>

	^ #(
	float x;
	float y;
	float w;
	float h;
	float radius;
	float padding1;
	float padding2;
	float padding3;
	)
]

{ #category : 'accessing - structure variables' }
SDL3GPUShimmerInstance >> h [
	"This method was automatically generated"
	^handle floatAt: OFFSET_H
]

{ #category : 'accessing - structure variables' }
SDL3GPUShimmerInstance >> h: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_H put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUShimmerInstance >> padding1 [
	"This method was automatically generated"
	^handle floatAt: OFFSET_PADDING1
]

{ #category : 'accessing - structure variables' }
SDL3GPUShimmerInstance >> padding1: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_PADDING1 put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUShimmerInstance >> padding2 [
	"This method was automatically generated"
	^handle floatAt: OFFSET_PADDING2
]

{ #category : 'accessing - structure variables' }
SDL3GPUShimmerInstance >> padding2: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_PADDING2 put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUShimmerInstance >> padding3 [
	"This method was automatically generated"
	^handle floatAt: OFFSET_PADDING3
]

{ #category : 'accessing - structure variables' }
SDL3GPUShimmerInstance >> padding3: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_PADDING3 put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUShimmerInstance >> radius [
	"This method was automatically generated"
	^handle floatAt: OFFSET_RADIUS
]

{ #category : 'accessing - structure variables' }
SDL3GPUShimmerInstance >> radius: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_RADIUS put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUShimmerInstance >> w [
	"This method was automatically generated"
	^handle floatAt: OFFSET_W
]

{ #category : 'accessing - structure variables' }
SDL3GPUShimmerInstance >> w: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_W put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUShimmerInstance >> x [
	"This method was automatically generated"
	^handle floatAt: OFFSET_X
]

{ #category : 'accessing - structure variables' }
SDL3GPUShimmerInstance >> x: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_X put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUShimmerInstance >> y [
	"This method was automatically generated"
	^handle floatAt: OFFSET_Y
]

{ #category : 'accessing - structure variables' }
SDL3GPUShimmerInstance >> y: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_Y put: anObject
]
