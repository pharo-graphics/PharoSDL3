Class {
	#name : 'SDL3FColor',
	#superclass : 'SDL3Structure',
	#classVars : [
		'OFFSET_A',
		'OFFSET_B',
		'OFFSET_G',
		'OFFSET_R'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'field definition' }
SDL3FColor class >> fieldsDesc [

	^ #(
	float r;
	float g;
	float b;
	float a
	)
]

{ #category : 'accessing - structure variables' }
SDL3FColor >> a [
	"This method was automatically generated"
	^handle floatAt: OFFSET_A
]

{ #category : 'accessing - structure variables' }
SDL3FColor >> a: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_A put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3FColor >> b [
	"This method was automatically generated"
	^handle floatAt: OFFSET_B
]

{ #category : 'accessing - structure variables' }
SDL3FColor >> b: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_B put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3FColor >> g [
	"This method was automatically generated"
	^handle floatAt: OFFSET_G
]

{ #category : 'accessing - structure variables' }
SDL3FColor >> g: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_G put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3FColor >> r [
	"This method was automatically generated"
	^handle floatAt: OFFSET_R
]

{ #category : 'accessing - structure variables' }
SDL3FColor >> r: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_R put: anObject
]
