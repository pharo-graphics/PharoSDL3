Class {
	#name : 'S3SDL_Texture',
	#superclass : 'S3Structure',
	#classVars : [
		'OFFSET_FORMAT',
		'OFFSET_H',
		'OFFSET_REFCOUNT',
		'OFFSET_W'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'field definition' }
S3SDL_Texture class >> fieldsDesc [

	^ #(
	int format;
	int w;
	int h;
	int refcount
	)
]

{ #category : 'accessing - structure variables' }
S3SDL_Texture >> format [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_FORMAT
]

{ #category : 'accessing - structure variables' }
S3SDL_Texture >> format: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_FORMAT put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_Texture >> h [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_H
]

{ #category : 'accessing - structure variables' }
S3SDL_Texture >> h: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_H put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_Texture >> refcount [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_REFCOUNT
]

{ #category : 'accessing - structure variables' }
S3SDL_Texture >> refcount: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_REFCOUNT put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_Texture >> w [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_W
]

{ #category : 'accessing - structure variables' }
S3SDL_Texture >> w: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_W put: anObject
]
