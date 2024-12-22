Class {
	#name : 'S3SDL_FRect',
	#superclass : 'S3Structure',
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
S3SDL_FRect class >> fieldsDesc [

	^ #(
	float x;
	float y;
	float w;
	float h
	)
]

{ #category : 'accessing - structure variables' }
S3SDL_FRect >> h [
	"This method was automatically generated"
	^handle floatAt: OFFSET_H
]

{ #category : 'accessing - structure variables' }
S3SDL_FRect >> h: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_H put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_FRect >> w [
	"This method was automatically generated"
	^handle floatAt: OFFSET_W
]

{ #category : 'accessing - structure variables' }
S3SDL_FRect >> w: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_W put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_FRect >> x [
	"This method was automatically generated"
	^handle floatAt: OFFSET_X
]

{ #category : 'accessing - structure variables' }
S3SDL_FRect >> x: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_X put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_FRect >> y [
	"This method was automatically generated"
	^handle floatAt: OFFSET_Y
]

{ #category : 'accessing - structure variables' }
S3SDL_FRect >> y: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_Y put: anObject
]
