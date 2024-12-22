Class {
	#name : 'S3SDL_Rect',
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
S3SDL_Rect class >> fieldsDesc [

	^ #(
	int x;
	int y;
	int w;
	int h
	)
]

{ #category : 'accessing - structure variables' }
S3SDL_Rect >> h [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_H
]

{ #category : 'accessing - structure variables' }
S3SDL_Rect >> h: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_H put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_Rect >> w [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_W
]

{ #category : 'accessing - structure variables' }
S3SDL_Rect >> w: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_W put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_Rect >> x [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_X
]

{ #category : 'accessing - structure variables' }
S3SDL_Rect >> x: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_X put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_Rect >> y [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_Y
]

{ #category : 'accessing - structure variables' }
S3SDL_Rect >> y: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_Y put: anObject
]
