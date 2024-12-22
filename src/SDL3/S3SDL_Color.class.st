Class {
	#name : 'S3SDL_Color',
	#superclass : 'S3Structure',
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
S3SDL_Color class >> fieldsDesc [

	^ #(
	int r;
	int g;
	int b;
	int a
	)
]

{ #category : 'accessing - structure variables' }
S3SDL_Color >> a [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_A
]

{ #category : 'accessing - structure variables' }
S3SDL_Color >> a: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_A put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_Color >> b [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_B
]

{ #category : 'accessing - structure variables' }
S3SDL_Color >> b: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_B put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_Color >> g [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_G
]

{ #category : 'accessing - structure variables' }
S3SDL_Color >> g: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_G put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_Color >> r [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_R
]

{ #category : 'accessing - structure variables' }
S3SDL_Color >> r: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_R put: anObject
]
