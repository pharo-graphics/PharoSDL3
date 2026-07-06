"
I hold parameters for the Mandelbrot compute shader.
"
Class {
	#name : 'SDL3GPUMandelbrotUniforms',
	#superclass : 'SDL3Structure',
	#classVars : [
		'OFFSET_ATLASSLOT',
		'OFFSET_MAXITERATIONS',
		'OFFSET_TILESIZE',
		'OFFSET_X1',
		'OFFSET_X2',
		'OFFSET_Y1',
		'OFFSET_Y2'
	],
	#category : 'SDL3-GPU-Demos-TiledMap',
	#package : 'SDL3-GPU-Demos',
	#tag : 'TiledMap'
}

{ #category : 'field definition' }
SDL3GPUMandelbrotUniforms class >> fieldsDesc [
	<script: 'self rebuildFieldAccessors'>

	^ #(
	float x1;
	float y1;
	float x2;
	float y2;
	uint maxIterations;
	uint atlasSlot;
	uint tileSize;
	)
]

{ #category : 'accessing - structure variables' }
SDL3GPUMandelbrotUniforms >> atlasSlot [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_ATLASSLOT
]

{ #category : 'accessing - structure variables' }
SDL3GPUMandelbrotUniforms >> atlasSlot: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_ATLASSLOT put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUMandelbrotUniforms >> maxIterations [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_MAXITERATIONS
]

{ #category : 'accessing - structure variables' }
SDL3GPUMandelbrotUniforms >> maxIterations: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_MAXITERATIONS put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUMandelbrotUniforms >> tileSize [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_TILESIZE
]

{ #category : 'accessing - structure variables' }
SDL3GPUMandelbrotUniforms >> tileSize: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_TILESIZE put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUMandelbrotUniforms >> x1 [
	"This method was automatically generated"
	^handle floatAt: OFFSET_X1
]

{ #category : 'accessing - structure variables' }
SDL3GPUMandelbrotUniforms >> x1: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_X1 put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUMandelbrotUniforms >> x2 [
	"This method was automatically generated"
	^handle floatAt: OFFSET_X2
]

{ #category : 'accessing - structure variables' }
SDL3GPUMandelbrotUniforms >> x2: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_X2 put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUMandelbrotUniforms >> y1 [
	"This method was automatically generated"
	^handle floatAt: OFFSET_Y1
]

{ #category : 'accessing - structure variables' }
SDL3GPUMandelbrotUniforms >> y1: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_Y1 put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUMandelbrotUniforms >> y2 [
	"This method was automatically generated"
	^handle floatAt: OFFSET_Y2
]

{ #category : 'accessing - structure variables' }
SDL3GPUMandelbrotUniforms >> y2: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_Y2 put: anObject
]
