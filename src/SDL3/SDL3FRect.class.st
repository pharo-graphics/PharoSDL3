Class {
	#name : 'SDL3FRect',
	#superclass : 'SDL3Structure',
	#classVars : [
		'OFFSET_H',
		'OFFSET_W',
		'OFFSET_X',
		'OFFSET_Y'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'field definition' }
SDL3FRect class >> fieldsDesc [

	^ #(
	float x;
	float y;
	float w;
	float h
	)
]

{ #category : 'accessing - structure variables' }
SDL3FRect >> h [
	"This method was automatically generated"
	^handle floatAt: OFFSET_H
]

{ #category : 'accessing - structure variables' }
SDL3FRect >> h: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_H put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3FRect >> w [
	"This method was automatically generated"
	^handle floatAt: OFFSET_W
]

{ #category : 'accessing - structure variables' }
SDL3FRect >> w: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_W put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3FRect >> x [
	"This method was automatically generated"
	^handle floatAt: OFFSET_X
]

{ #category : 'accessing - structure variables' }
SDL3FRect >> x: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_X put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3FRect >> y [
	"This method was automatically generated"
	^handle floatAt: OFFSET_Y
]

{ #category : 'accessing - structure variables' }
SDL3FRect >> y: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_Y put: anObject
]
