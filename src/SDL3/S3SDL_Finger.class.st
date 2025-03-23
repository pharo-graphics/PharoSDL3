Class {
	#name : 'S3SDL_Finger',
	#superclass : 'S3Structure',
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
S3SDL_Finger class >> fieldsDesc [

	^ #(
	SDL_FingerID id;
	float x;
	float y;
	float pressure
	)
]

{ #category : 'accessing - structure variables' }
S3SDL_Finger >> id [
	"This method was automatically generated"
	^handle unsignedLongLongAt: OFFSET_ID
]

{ #category : 'accessing - structure variables' }
S3SDL_Finger >> id: anObject [
	"This method was automatically generated"
	handle unsignedLongLongAt: OFFSET_ID put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_Finger >> pressure [
	"This method was automatically generated"
	^handle floatAt: OFFSET_PRESSURE
]

{ #category : 'accessing - structure variables' }
S3SDL_Finger >> pressure: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_PRESSURE put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_Finger >> x [
	"This method was automatically generated"
	^handle floatAt: OFFSET_X
]

{ #category : 'accessing - structure variables' }
S3SDL_Finger >> x: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_X put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_Finger >> y [
	"This method was automatically generated"
	^handle floatAt: OFFSET_Y
]

{ #category : 'accessing - structure variables' }
S3SDL_Finger >> y: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_Y put: anObject
]
