"
I hold the uniforms for the Dual Kawase Blur fragment shaders.
"
Class {
	#name : 'SDL3GPUDualKawaseBlurUniforms',
	#superclass : 'SDL3Structure',
	#classVars : [
		'OFFSET_BLURRADIUS',
		'OFFSET_TEXELSIZEX',
		'OFFSET_TEXELSIZEY'
	],
	#category : 'SDL3-GPU-Demos-KawaseBlur',
	#package : 'SDL3-GPU-Demos',
	#tag : 'KawaseBlur'
}

{ #category : 'field definition' }
SDL3GPUDualKawaseBlurUniforms class >> fieldsDesc [
	^ #(
	float texelSizeX;
	float texelSizeY;
	float blurRadius;
	)
]

{ #category : 'accessing - structure variables' }
SDL3GPUDualKawaseBlurUniforms >> blurRadius [
	"This method was automatically generated"
	^handle floatAt: OFFSET_BLURRADIUS
]

{ #category : 'accessing - structure variables' }
SDL3GPUDualKawaseBlurUniforms >> blurRadius: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_BLURRADIUS put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUDualKawaseBlurUniforms >> texelSizeX [
	"This method was automatically generated"
	^handle floatAt: OFFSET_TEXELSIZEX
]

{ #category : 'accessing - structure variables' }
SDL3GPUDualKawaseBlurUniforms >> texelSizeX: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_TEXELSIZEX put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUDualKawaseBlurUniforms >> texelSizeY [
	"This method was automatically generated"
	^handle floatAt: OFFSET_TEXELSIZEY
]

{ #category : 'accessing - structure variables' }
SDL3GPUDualKawaseBlurUniforms >> texelSizeY: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_TEXELSIZEY put: anObject
]
