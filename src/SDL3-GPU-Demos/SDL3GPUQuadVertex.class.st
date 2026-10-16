"
I represent a vertex struct in the quads demo (see my references).
"
Class {
	#name : 'SDL3GPUQuadVertex',
	#superclass : 'SDL3GPUVertexInputStructure',
	#classVars : [
		'OFFSET_U',
		'OFFSET_V',
		'OFFSET_X',
		'OFFSET_Y',
		'OFFSET_Z'
	],
	#category : 'SDL3-GPU-Demos-SimpleQuads',
	#package : 'SDL3-GPU-Demos',
	#tag : 'SimpleQuads'
}

{ #category : 'field definition' }
SDL3GPUQuadVertex class >> fieldsDesc [
	<script: 'self rebuildFieldAccessors'>

	^ #(
	float x;
	float y;
	float z;
	float u;
	float v
	)
]

{ #category : 'accessing' }
SDL3GPUQuadVertex class >> gpuVertexElementsDescription [

	^ {
		(SDL3GPUVertexElement location: 0 oneBasedOffset: OFFSET_X format: SDL3GPUVertexElementFormat float3).
		(SDL3GPUVertexElement location: 1 oneBasedOffset: OFFSET_U format: SDL3GPUVertexElementFormat float2) }
]

{ #category : 'accessing - structure variables' }
SDL3GPUQuadVertex >> u [
	"This method was automatically generated"
	^handle floatAt: OFFSET_U
]

{ #category : 'accessing - structure variables' }
SDL3GPUQuadVertex >> u: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_U put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUQuadVertex >> v [
	"This method was automatically generated"
	^handle floatAt: OFFSET_V
]

{ #category : 'accessing - structure variables' }
SDL3GPUQuadVertex >> v: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_V put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUQuadVertex >> x [
	"This method was automatically generated"
	^handle floatAt: OFFSET_X
]

{ #category : 'accessing - structure variables' }
SDL3GPUQuadVertex >> x: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_X put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUQuadVertex >> y [
	"This method was automatically generated"
	^handle floatAt: OFFSET_Y
]

{ #category : 'accessing - structure variables' }
SDL3GPUQuadVertex >> y: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_Y put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUQuadVertex >> z [
	"This method was automatically generated"
	^handle floatAt: OFFSET_Z
]

{ #category : 'accessing - structure variables' }
SDL3GPUQuadVertex >> z: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_Z put: anObject
]
