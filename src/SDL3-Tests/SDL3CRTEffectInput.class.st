"
I represent the input structure for `SDL3CRTEffectShaderSource`
"
Class {
	#name : 'SDL3CRTEffectInput',
	#superclass : 'FFIStructure',
	#classVars : [
		'OFFSET_RESOLUTIONX',
		'OFFSET_RESOLUTIONY'
	],
	#category : 'SDL3-Tests',
	#package : 'SDL3-Tests'
}

{ #category : 'field definition' }
SDL3CRTEffectInput class >> fieldsDesc [
	"self rebuildFieldAccessors"

	^ #(
		float resolutionX;
		float resolutionY;
		)
]

{ #category : 'accessing' }
SDL3CRTEffectInput >> byteSize [

	^ self class byteSize
]

{ #category : 'accessing - structure variables' }
SDL3CRTEffectInput >> resolutionX [
	"This method was automatically generated"
	^handle floatAt: OFFSET_RESOLUTIONX
]

{ #category : 'accessing - structure variables' }
SDL3CRTEffectInput >> resolutionX: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_RESOLUTIONX put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3CRTEffectInput >> resolutionY [
	"This method was automatically generated"
	^handle floatAt: OFFSET_RESOLUTIONY
]

{ #category : 'accessing - structure variables' }
SDL3CRTEffectInput >> resolutionY: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_RESOLUTIONY put: anObject
]
