"
I hold the uniforms for the initial scene rendering of the Dual Kawase Blur demo.
"
Class {
	#name : 'SDL3GPUDualKawaseBlurSceneUniforms',
	#superclass : 'SDL3Structure',
	#classVars : [
		'OFFSET_ROTATION',
		'OFFSET_SCALEX',
		'OFFSET_SCALEY',
		'OFFSET_VIEWPORTHEIGHT',
		'OFFSET_VIEWPORTWIDTH',
		'OFFSET_X',
		'OFFSET_Y'
	],
	#category : 'SDL3-GPU-Demos-KawaseBlur',
	#package : 'SDL3-GPU-Demos',
	#tag : 'KawaseBlur'
}

{ #category : 'field definition' }
SDL3GPUDualKawaseBlurSceneUniforms class >> fieldsDesc [
	^ #(
	float x;
	float y;
	float scaleX;
	float scaleY;
	float rotation;
	float viewportWidth;
	float viewportHeight;
	)
]

{ #category : 'accessing - structure variables' }
SDL3GPUDualKawaseBlurSceneUniforms >> rotation [
	"This method was automatically generated"
	^handle floatAt: OFFSET_ROTATION
]

{ #category : 'accessing - structure variables' }
SDL3GPUDualKawaseBlurSceneUniforms >> rotation: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_ROTATION put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUDualKawaseBlurSceneUniforms >> scaleX [
	"This method was automatically generated"
	^handle floatAt: OFFSET_SCALEX
]

{ #category : 'accessing - structure variables' }
SDL3GPUDualKawaseBlurSceneUniforms >> scaleX: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_SCALEX put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUDualKawaseBlurSceneUniforms >> scaleY [
	"This method was automatically generated"
	^handle floatAt: OFFSET_SCALEY
]

{ #category : 'accessing - structure variables' }
SDL3GPUDualKawaseBlurSceneUniforms >> scaleY: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_SCALEY put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUDualKawaseBlurSceneUniforms >> viewportHeight [
	"This method was automatically generated"
	^handle floatAt: OFFSET_VIEWPORTHEIGHT
]

{ #category : 'accessing - structure variables' }
SDL3GPUDualKawaseBlurSceneUniforms >> viewportHeight: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_VIEWPORTHEIGHT put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUDualKawaseBlurSceneUniforms >> viewportWidth [
	"This method was automatically generated"
	^handle floatAt: OFFSET_VIEWPORTWIDTH
]

{ #category : 'accessing - structure variables' }
SDL3GPUDualKawaseBlurSceneUniforms >> viewportWidth: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_VIEWPORTWIDTH put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUDualKawaseBlurSceneUniforms >> x [
	"This method was automatically generated"
	^handle floatAt: OFFSET_X
]

{ #category : 'accessing - structure variables' }
SDL3GPUDualKawaseBlurSceneUniforms >> x: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_X put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUDualKawaseBlurSceneUniforms >> y [
	"This method was automatically generated"
	^handle floatAt: OFFSET_Y
]

{ #category : 'accessing - structure variables' }
SDL3GPUDualKawaseBlurSceneUniforms >> y: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_Y put: anObject
]
