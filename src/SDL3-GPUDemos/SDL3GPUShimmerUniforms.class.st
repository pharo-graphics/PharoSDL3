"
I hold the animation parameters for the Shimmer Loading Effect shaders.
"
Class {
	#name : 'SDL3GPUShimmerUniforms',
	#superclass : 'SDL3Structure',
	#classVars : [
		'OFFSET_BASECOLOR',
		'OFFSET_CORNERRADIUS',
		'OFFSET_EFFECTTYPE',
		'OFFSET_HIGHLIGHTCOLOR',
		'OFFSET_PAD1',
		'OFFSET_PAD2',
		'OFFSET_PAD3',
		'OFFSET_RESOLUTIONX',
		'OFFSET_RESOLUTIONY',
		'OFFSET_TIME'
	],
	#category : 'SDL3-GPUDemos-Shimmer',
	#package : 'SDL3-GPUDemos',
	#tag : 'Shimmer'
}

{ #category : 'field definition' }
SDL3GPUShimmerUniforms class >> fieldsDesc [
	<script: 'self rebuildFieldAccessors'>

	"16-byte alignment and padding to a multiple of 16 bytes for WebGPU/Vulkan/D3D12 compatibility"
	^ #(
	float time;
	float resolutionX;
	float resolutionY;
	uint effectType;
	float cornerRadius;
	float pad1;
	float pad2;
	float pad3;
	SDL3FColor baseColor;
	SDL3FColor highlightColor;
	)
]

{ #category : 'accessing - structure variables' }
SDL3GPUShimmerUniforms >> baseColor [
	"This method was automatically generated"
	^ SDL3FColor fromHandle: (handle referenceStructAt: OFFSET_BASECOLOR length: SDL3FColor byteSize)
]

{ #category : 'accessing - structure variables' }
SDL3GPUShimmerUniforms >> baseColor: anObject [
	"This method was automatically generated"
	handle structAt: OFFSET_BASECOLOR put: anObject getHandle length: SDL3FColor byteSize
]

{ #category : 'accessing - structure variables' }
SDL3GPUShimmerUniforms >> cornerRadius [
	"This method was automatically generated"
	^handle floatAt: OFFSET_CORNERRADIUS
]

{ #category : 'accessing - structure variables' }
SDL3GPUShimmerUniforms >> cornerRadius: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_CORNERRADIUS put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUShimmerUniforms >> effectType [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_EFFECTTYPE
]

{ #category : 'accessing - structure variables' }
SDL3GPUShimmerUniforms >> effectType: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_EFFECTTYPE put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUShimmerUniforms >> highlightColor [
	"This method was automatically generated"
	^ SDL3FColor fromHandle: (handle referenceStructAt: OFFSET_HIGHLIGHTCOLOR length: SDL3FColor byteSize)
]

{ #category : 'accessing - structure variables' }
SDL3GPUShimmerUniforms >> highlightColor: anObject [
	"This method was automatically generated"
	handle structAt: OFFSET_HIGHLIGHTCOLOR put: anObject getHandle length: SDL3FColor byteSize
]

{ #category : 'accessing - structure variables' }
SDL3GPUShimmerUniforms >> pad1 [
	"This method was automatically generated"
	^handle floatAt: OFFSET_PAD1
]

{ #category : 'accessing - structure variables' }
SDL3GPUShimmerUniforms >> pad1: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_PAD1 put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUShimmerUniforms >> pad2 [
	"This method was automatically generated"
	^handle floatAt: OFFSET_PAD2
]

{ #category : 'accessing - structure variables' }
SDL3GPUShimmerUniforms >> pad2: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_PAD2 put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUShimmerUniforms >> pad3 [
	"This method was automatically generated"
	^handle floatAt: OFFSET_PAD3
]

{ #category : 'accessing - structure variables' }
SDL3GPUShimmerUniforms >> pad3: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_PAD3 put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUShimmerUniforms >> resolutionX [
	"This method was automatically generated"
	^handle floatAt: OFFSET_RESOLUTIONX
]

{ #category : 'accessing - structure variables' }
SDL3GPUShimmerUniforms >> resolutionX: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_RESOLUTIONX put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUShimmerUniforms >> resolutionY [
	"This method was automatically generated"
	^handle floatAt: OFFSET_RESOLUTIONY
]

{ #category : 'accessing - structure variables' }
SDL3GPUShimmerUniforms >> resolutionY: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_RESOLUTIONY put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUShimmerUniforms >> time [
	"This method was automatically generated"
	^handle floatAt: OFFSET_TIME
]

{ #category : 'accessing - structure variables' }
SDL3GPUShimmerUniforms >> time: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_TIME put: anObject
]
