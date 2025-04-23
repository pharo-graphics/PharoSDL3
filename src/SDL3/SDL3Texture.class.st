Class {
	#name : 'SDL3Texture',
	#superclass : 'SDL3Structure',
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
SDL3Texture class >> fieldsDesc [

	^ #(
	SDL_PixelFormat format;
	int w;
	int h;
	int refcount
	)
]

{ #category : 'accessing - structure variables' }
SDL3Texture >> format [
	"This method was automatically generated"
	^SDL3PixelFormat fromInteger: (handle unsignedLongAt: OFFSET_FORMAT)
]

{ #category : 'accessing - structure variables' }
SDL3Texture >> format: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_FORMAT put: anObject value
]

{ #category : 'accessing - structure variables' }
SDL3Texture >> h [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_H
]

{ #category : 'accessing - structure variables' }
SDL3Texture >> h: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_H put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3Texture >> refcount [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_REFCOUNT
]

{ #category : 'accessing - structure variables' }
SDL3Texture >> refcount: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_REFCOUNT put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3Texture >> w [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_W
]

{ #category : 'accessing - structure variables' }
SDL3Texture >> w: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_W put: anObject
]
