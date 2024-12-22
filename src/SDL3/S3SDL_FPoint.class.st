Class {
	#name : 'S3SDL_FPoint',
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
S3SDL_FPoint class >> fieldsDesc [

	^ #(
	float x;
	float y
	)
]

{ #category : 'accessing - structure variables' }
S3SDL_FPoint >> x [
	"This method was automatically generated"
	^handle floatAt: OFFSET_X
]

{ #category : 'accessing - structure variables' }
S3SDL_FPoint >> x: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_X put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_FPoint >> y [
	"This method was automatically generated"
	^handle floatAt: OFFSET_Y
]

{ #category : 'accessing - structure variables' }
S3SDL_FPoint >> y: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_Y put: anObject
]
