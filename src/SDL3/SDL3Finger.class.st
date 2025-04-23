Class {
	#name : 'SDL3Finger',
	#superclass : 'SDL3Structure',
	#classVars : [
		'OFFSET_ID',
		'OFFSET_PRESSURE',
		'OFFSET_X',
		'OFFSET_Y'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'field definition' }
SDL3Finger class >> fieldsDesc [

	^ #(
	SDL_FingerID id;
	float x;
	float y;
	float pressure
	)
]

{ #category : 'accessing - structure variables' }
SDL3Finger >> id [
	"This method was automatically generated"
	^handle unsignedLongLongAt: OFFSET_ID
]

{ #category : 'accessing - structure variables' }
SDL3Finger >> id: anObject [
	"This method was automatically generated"
	handle unsignedLongLongAt: OFFSET_ID put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3Finger >> pressure [
	"This method was automatically generated"
	^handle floatAt: OFFSET_PRESSURE
]

{ #category : 'accessing - structure variables' }
SDL3Finger >> pressure: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_PRESSURE put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3Finger >> x [
	"This method was automatically generated"
	^handle floatAt: OFFSET_X
]

{ #category : 'accessing - structure variables' }
SDL3Finger >> x: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_X put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3Finger >> y [
	"This method was automatically generated"
	^handle floatAt: OFFSET_Y
]

{ #category : 'accessing - structure variables' }
SDL3Finger >> y: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_Y put: anObject
]
