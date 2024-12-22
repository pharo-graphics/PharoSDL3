Class {
	#name : 'S3SDL_Point',
	#superclass : 'S3Structure',
	#classVars : [
		'OFFSET_X',
		'OFFSET_Y'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'field definition' }
S3SDL_Point class >> fieldsDesc [

	^ #(
	int x;
	int y
	)
]

{ #category : 'accessing - structure variables' }
S3SDL_Point >> x [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_X
]

{ #category : 'accessing - structure variables' }
S3SDL_Point >> x: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_X put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_Point >> y [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_Y
]

{ #category : 'accessing - structure variables' }
S3SDL_Point >> y: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_Y put: anObject
]
