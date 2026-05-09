Class {
	#name : 'SDL3GPUBlurUniforms',
	#superclass : 'SDL3Structure',
	#classVars : [
		'OFFSET_BLURRADIUS',
		'OFFSET_BLURSPREAD',
		'OFFSET_BRIGHTNESS',
		'OFFSET_DIRECTION'
	],
	#category : 'SDL3-Tests-Quads',
	#package : 'SDL3-Tests',
	#tag : 'Quads'
}

{ #category : 'field definition' }
SDL3GPUBlurUniforms class >> fieldsDesc [
	"
	self rebuildFieldAccessors 
	"

	^ #(
	float blurRadius
	float blurSpread
	int direction
	float brightness
	)
]

{ #category : 'accessing - structure variables' }
SDL3GPUBlurUniforms >> blurRadius [
	"This method was automatically generated"
	^handle floatAt: OFFSET_BLURRADIUS
]

{ #category : 'accessing - structure variables' }
SDL3GPUBlurUniforms >> blurRadius: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_BLURRADIUS put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUBlurUniforms >> blurSpread [
	"This method was automatically generated"
	^handle floatAt: OFFSET_BLURSPREAD
]

{ #category : 'accessing - structure variables' }
SDL3GPUBlurUniforms >> blurSpread: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_BLURSPREAD put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUBlurUniforms >> brightness [
	"This method was automatically generated"
	^handle floatAt: OFFSET_BRIGHTNESS
]

{ #category : 'accessing - structure variables' }
SDL3GPUBlurUniforms >> brightness: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_BRIGHTNESS put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUBlurUniforms >> direction [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_DIRECTION
]

{ #category : 'accessing - structure variables' }
SDL3GPUBlurUniforms >> direction: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_DIRECTION put: anObject
]
