Class {
	#name : 'SDL3GPUInstancedQuadUniforms',
	#superclass : 'SDL3Structure',
	#classVars : [
		'OFFSET_ENABLEROTATION',
		'OFFSET_ENABLESCALE',
		'OFFSET_NUMCOLS',
		'OFFSET_NUMROWS',
		'OFFSET_PAD1',
		'OFFSET_PAD2',
		'OFFSET_PAD3',
		'OFFSET_TIME'
	],
	#category : 'SDL3-GPUDemos-InstancedQuads',
	#package : 'SDL3-GPUDemos',
	#tag : 'InstancedQuads'
}

{ #category : 'field definition' }
SDL3GPUInstancedQuadUniforms class >> fieldsDesc [
	<script: 'self rebuildFieldAccessors'>

	^ #(
	float time;
	float enableRotation;
	float enableScale;
	float numCols;
	float numRows;
	float pad1;
	float pad2;
	float pad3;
	)
]

{ #category : 'accessing - structure variables' }
SDL3GPUInstancedQuadUniforms >> enableRotation [
	"This method was automatically generated"
	^handle floatAt: OFFSET_ENABLEROTATION
]

{ #category : 'accessing - structure variables' }
SDL3GPUInstancedQuadUniforms >> enableRotation: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_ENABLEROTATION put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUInstancedQuadUniforms >> enableScale [
	"This method was automatically generated"
	^handle floatAt: OFFSET_ENABLESCALE
]

{ #category : 'accessing - structure variables' }
SDL3GPUInstancedQuadUniforms >> enableScale: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_ENABLESCALE put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUInstancedQuadUniforms >> numCols [
	"This method was automatically generated"
	^handle floatAt: OFFSET_NUMCOLS
]

{ #category : 'accessing - structure variables' }
SDL3GPUInstancedQuadUniforms >> numCols: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_NUMCOLS put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUInstancedQuadUniforms >> numRows [
	"This method was automatically generated"
	^handle floatAt: OFFSET_NUMROWS
]

{ #category : 'accessing - structure variables' }
SDL3GPUInstancedQuadUniforms >> numRows: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_NUMROWS put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUInstancedQuadUniforms >> pad1 [
	"This method was automatically generated"
	^handle floatAt: OFFSET_PAD1
]

{ #category : 'accessing - structure variables' }
SDL3GPUInstancedQuadUniforms >> pad1: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_PAD1 put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUInstancedQuadUniforms >> pad2 [
	"This method was automatically generated"
	^handle floatAt: OFFSET_PAD2
]

{ #category : 'accessing - structure variables' }
SDL3GPUInstancedQuadUniforms >> pad2: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_PAD2 put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUInstancedQuadUniforms >> pad3 [
	"This method was automatically generated"
	^handle floatAt: OFFSET_PAD3
]

{ #category : 'accessing - structure variables' }
SDL3GPUInstancedQuadUniforms >> pad3: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_PAD3 put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUInstancedQuadUniforms >> time [
	"This method was automatically generated"
	^handle floatAt: OFFSET_TIME
]

{ #category : 'accessing - structure variables' }
SDL3GPUInstancedQuadUniforms >> time: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_TIME put: anObject
]
