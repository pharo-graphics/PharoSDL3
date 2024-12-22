Class {
	#name : 'S3SDL_Palette',
	#superclass : 'S3Structure',
	#classVars : [
		'OFFSET_COLORS',
		'OFFSET_NCOLORS',
		'OFFSET_REFCOUNT',
		'OFFSET_VERSION'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'field definition' }
S3SDL_Palette class >> fieldsDesc [

	^ #(
	int ncolors;
	SDL_Color* colors;
	int version;
	int refcount
	)
]

{ #category : 'accessing - structure variables' }
S3SDL_Palette >> colors [
	"This method was automatically generated"
	^S3SDL_Color fromHandle: (handle pointerAt: OFFSET_COLORS)
]

{ #category : 'accessing - structure variables' }
S3SDL_Palette >> colors: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_COLORS put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
S3SDL_Palette >> ncolors [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_NCOLORS
]

{ #category : 'accessing - structure variables' }
S3SDL_Palette >> ncolors: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_NCOLORS put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_Palette >> refcount [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_REFCOUNT
]

{ #category : 'accessing - structure variables' }
S3SDL_Palette >> refcount: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_REFCOUNT put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_Palette >> version [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_VERSION
]

{ #category : 'accessing - structure variables' }
S3SDL_Palette >> version: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_VERSION put: anObject
]
