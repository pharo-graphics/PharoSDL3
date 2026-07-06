Class {
	#name : 'SDL3GPUSDFRoundedRectUniforms',
	#superclass : 'SDL3Structure',
	#classVars : [
		'OFFSET_CORNERR1',
		'OFFSET_CORNERR2',
		'OFFSET_CORNERR3',
		'OFFSET_CORNERR4',
		'OFFSET_DASHCOUNT',
		'OFFSET_DIMX',
		'OFFSET_DIMY',
		'OFFSET_FILLCOLOR',
		'OFFSET_FILLCOLOR2',
		'OFFSET_FILLTYPE',
		'OFFSET_PAD1',
		'OFFSET_PAD2',
		'OFFSET_PADDING',
		'OFFSET_PADDING2X',
		'OFFSET_PADDING2Y',
		'OFFSET_RADIUS',
		'OFFSET_SHAPETYPE',
		'OFFSET_STROKECOLOR',
		'OFFSET_STROKESIZE'
	],
	#category : 'SDL3-GPU-Demos-SDF',
	#package : 'SDL3-GPU-Demos',
	#tag : 'SDF'
}

{ #category : 'field definition' }
SDL3GPUSDFRoundedRectUniforms class >> fieldsDesc [
	<script: 'self rebuildFieldAccessors'>

	^ #(
	uint shapeType;
	float radius;
	float strokeSize;
	float padding;
	float dimX;
	float dimY;
	float padding2X;
	float padding2Y;
	float cornerR1;
	float cornerR2;
	float cornerR3;
	float cornerR4;
	SDL_FColor fillColor;
	SDL_FColor strokeColor;
	uint fillType;
	float dashCount;
	float pad1;
	float pad2;
	SDL_FColor fillColor2;
	)
]

{ #category : 'accessing - structure variables' }
SDL3GPUSDFRoundedRectUniforms >> cornerR1 [
	"This method was automatically generated"
	^handle floatAt: OFFSET_CORNERR1
]

{ #category : 'accessing - structure variables' }
SDL3GPUSDFRoundedRectUniforms >> cornerR1: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_CORNERR1 put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUSDFRoundedRectUniforms >> cornerR2 [
	"This method was automatically generated"
	^handle floatAt: OFFSET_CORNERR2
]

{ #category : 'accessing - structure variables' }
SDL3GPUSDFRoundedRectUniforms >> cornerR2: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_CORNERR2 put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUSDFRoundedRectUniforms >> cornerR3 [
	"This method was automatically generated"
	^handle floatAt: OFFSET_CORNERR3
]

{ #category : 'accessing - structure variables' }
SDL3GPUSDFRoundedRectUniforms >> cornerR3: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_CORNERR3 put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUSDFRoundedRectUniforms >> cornerR4 [
	"This method was automatically generated"
	^handle floatAt: OFFSET_CORNERR4
]

{ #category : 'accessing - structure variables' }
SDL3GPUSDFRoundedRectUniforms >> cornerR4: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_CORNERR4 put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUSDFRoundedRectUniforms >> cornerRadii [
	"This method was automatically generated"
	^(FFIArray ofType: #FFIFloat32 size: 4) fromHandle: (handle copyFrom: 25 to: 40)
]

{ #category : 'accessing - structure variables' }
SDL3GPUSDFRoundedRectUniforms >> cornerRadii: anObject [
	"This method was automatically generated"
	handle replaceFrom: 25 to: 40 with: anObject getHandle startingAt: 1
]

{ #category : 'accessing - structure variables' }
SDL3GPUSDFRoundedRectUniforms >> dashCount [
	"This method was automatically generated"
	^handle floatAt: OFFSET_DASHCOUNT
]

{ #category : 'accessing - structure variables' }
SDL3GPUSDFRoundedRectUniforms >> dashCount: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_DASHCOUNT put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUSDFRoundedRectUniforms >> dimX [
	"This method was automatically generated"
	^handle floatAt: OFFSET_DIMX
]

{ #category : 'accessing - structure variables' }
SDL3GPUSDFRoundedRectUniforms >> dimX: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_DIMX put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUSDFRoundedRectUniforms >> dimY [
	"This method was automatically generated"
	^handle floatAt: OFFSET_DIMY
]

{ #category : 'accessing - structure variables' }
SDL3GPUSDFRoundedRectUniforms >> dimY: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_DIMY put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUSDFRoundedRectUniforms >> dimensions [
	"This method was automatically generated"
	^(FFIArray ofType: #FFIFloat32 size: 2) fromHandle: (handle copyFrom: 17 to: 24)
]

{ #category : 'accessing - structure variables' }
SDL3GPUSDFRoundedRectUniforms >> dimensions: anObject [
	"This method was automatically generated"
	handle replaceFrom: 17 to: 24 with: anObject getHandle startingAt: 1
]

{ #category : 'accessing - structure variables' }
SDL3GPUSDFRoundedRectUniforms >> fillColor [
	"This method was automatically generated"
	^ SDL3FColor fromHandle: (handle referenceStructAt: OFFSET_FILLCOLOR length: SDL3FColor byteSize)
]

{ #category : 'accessing - structure variables' }
SDL3GPUSDFRoundedRectUniforms >> fillColor2 [
	"This method was automatically generated"
	^ SDL3FColor fromHandle: (handle referenceStructAt: OFFSET_FILLCOLOR2 length: SDL3FColor byteSize)
]

{ #category : 'accessing - structure variables' }
SDL3GPUSDFRoundedRectUniforms >> fillColor2: anObject [
	"This method was automatically generated"
	handle structAt: OFFSET_FILLCOLOR2 put: anObject getHandle length: SDL3FColor byteSize
]

{ #category : 'accessing - structure variables' }
SDL3GPUSDFRoundedRectUniforms >> fillColor: anObject [
	"This method was automatically generated"
	handle structAt: OFFSET_FILLCOLOR put: anObject getHandle length: SDL3FColor byteSize
]

{ #category : 'accessing - structure variables' }
SDL3GPUSDFRoundedRectUniforms >> fillType [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_FILLTYPE
]

{ #category : 'accessing - structure variables' }
SDL3GPUSDFRoundedRectUniforms >> fillType: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_FILLTYPE put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUSDFRoundedRectUniforms >> pad1 [
	"This method was automatically generated"
	^handle floatAt: OFFSET_PAD1
]

{ #category : 'accessing - structure variables' }
SDL3GPUSDFRoundedRectUniforms >> pad1: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_PAD1 put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUSDFRoundedRectUniforms >> pad2 [
	"This method was automatically generated"
	^handle floatAt: OFFSET_PAD2
]

{ #category : 'accessing - structure variables' }
SDL3GPUSDFRoundedRectUniforms >> pad2: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_PAD2 put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUSDFRoundedRectUniforms >> padding [
	"This method was automatically generated"
	^handle floatAt: OFFSET_PADDING
]

{ #category : 'accessing - structure variables' }
SDL3GPUSDFRoundedRectUniforms >> padding2 [
	"This method was automatically generated"
	^(FFIArray ofType: #FFIFloat32 size: 2) fromHandle: (handle copyFrom: 25 to: 32)
]

{ #category : 'accessing - structure variables' }
SDL3GPUSDFRoundedRectUniforms >> padding2: anObject [
	"This method was automatically generated"
	handle replaceFrom: 25 to: 32 with: anObject getHandle startingAt: 1
]

{ #category : 'accessing - structure variables' }
SDL3GPUSDFRoundedRectUniforms >> padding2X [
	"This method was automatically generated"
	^handle floatAt: OFFSET_PADDING2X
]

{ #category : 'accessing - structure variables' }
SDL3GPUSDFRoundedRectUniforms >> padding2X: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_PADDING2X put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUSDFRoundedRectUniforms >> padding2Y [
	"This method was automatically generated"
	^handle floatAt: OFFSET_PADDING2Y
]

{ #category : 'accessing - structure variables' }
SDL3GPUSDFRoundedRectUniforms >> padding2Y: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_PADDING2Y put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUSDFRoundedRectUniforms >> padding: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_PADDING put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUSDFRoundedRectUniforms >> radius [
	"This method was automatically generated"
	^handle floatAt: OFFSET_RADIUS
]

{ #category : 'accessing - structure variables' }
SDL3GPUSDFRoundedRectUniforms >> radius: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_RADIUS put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUSDFRoundedRectUniforms >> shapeType [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_SHAPETYPE
]

{ #category : 'accessing - structure variables' }
SDL3GPUSDFRoundedRectUniforms >> shapeType: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_SHAPETYPE put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUSDFRoundedRectUniforms >> strokeColor [
	"This method was automatically generated"
	^ SDL3FColor fromHandle: (handle referenceStructAt: OFFSET_STROKECOLOR length: SDL3FColor byteSize)
]

{ #category : 'accessing - structure variables' }
SDL3GPUSDFRoundedRectUniforms >> strokeColor: anObject [
	"This method was automatically generated"
	handle structAt: OFFSET_STROKECOLOR put: anObject getHandle length: SDL3FColor byteSize
]

{ #category : 'accessing - structure variables' }
SDL3GPUSDFRoundedRectUniforms >> strokeSize [
	"This method was automatically generated"
	^handle floatAt: OFFSET_STROKESIZE
]

{ #category : 'accessing - structure variables' }
SDL3GPUSDFRoundedRectUniforms >> strokeSize: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_STROKESIZE put: anObject
]
