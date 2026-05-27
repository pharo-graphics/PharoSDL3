"
I represent fragment uniforms for color.
"
Class {
	#name : 'SDL3TestGraphicsFragUniform',
	#superclass : 'SDL3Structure',
	#classVars : [
		'OFFSET_A',
		'OFFSET_B',
		'OFFSET_G',
		'OFFSET_R'
	],
	#category : 'SDL3-Graphics-Tests',
	#package : 'SDL3-Graphics-Tests'
}

{ #category : 'field definition' }
SDL3TestGraphicsFragUniform class >> fieldsDesc [

	^ #(
	float r;
	float g;
	float b;
	float a
	)
]

{ #category : 'accessing - structure variables' }
SDL3TestGraphicsFragUniform >> a [
	"This method was automatically generated"
	^handle floatAt: OFFSET_A
]

{ #category : 'accessing - structure variables' }
SDL3TestGraphicsFragUniform >> a: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_A put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3TestGraphicsFragUniform >> b [
	"This method was automatically generated"
	^handle floatAt: OFFSET_B
]

{ #category : 'accessing - structure variables' }
SDL3TestGraphicsFragUniform >> b: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_B put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3TestGraphicsFragUniform >> g [
	"This method was automatically generated"
	^handle floatAt: OFFSET_G
]

{ #category : 'accessing - structure variables' }
SDL3TestGraphicsFragUniform >> g: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_G put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3TestGraphicsFragUniform >> r [
	"This method was automatically generated"
	^handle floatAt: OFFSET_R
]

{ #category : 'accessing - structure variables' }
SDL3TestGraphicsFragUniform >> r: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_R put: anObject
]
