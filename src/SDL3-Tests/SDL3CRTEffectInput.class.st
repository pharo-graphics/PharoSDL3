Class {
	#name : 'SDL3CRTEffectInput',
	#superclass : 'FFIStructure',
	#classVars : [
		'OFFSET_UVX',
		'OFFSET_UVY'
	],
	#category : 'SDL3-Tests',
	#package : 'SDL3-Tests'
}

{ #category : 'field definition' }
SDL3CRTEffectInput class >> fieldsDesc [
	"self rebuildFieldAccessors"

	^ #(
		float uvX;
		float uvY;
		)
]

{ #category : 'accessing - structure variables' }
SDL3CRTEffectInput >> uvX [
	"This method was automatically generated"
	^handle floatAt: OFFSET_UVX
]

{ #category : 'accessing - structure variables' }
SDL3CRTEffectInput >> uvX: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_UVX put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3CRTEffectInput >> uvY [
	"This method was automatically generated"
	^handle floatAt: OFFSET_UVY
]

{ #category : 'accessing - structure variables' }
SDL3CRTEffectInput >> uvY: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_UVY put: anObject
]
