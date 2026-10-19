"
I am a SDL3 FFI binding for `SDL_Rect`.

A rectangle, with the origin at the upper left (using integers).

See: https://wiki.libsdl.org/SDL3/SDL_Rect
"
Class {
	#name : 'SDL3Rect',
	#superclass : 'SDL3Structure',
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
SDL3Rect class >> fieldsDesc [

	^ #(
	int x;
	int y;
	int w;
	int h
	)
]

{ #category : 'instance creation' }
SDL3Rect class >> newFrom: aRectangle [
	^ self new
		x: aRectangle origin x asInteger;
		y: aRectangle origin y asInteger;
		w: aRectangle width asInteger;
		h: aRectangle height asInteger;
		yourself
]

{ #category : 'converting' }
SDL3Rect >> asRectangle [

	^ self origin extent: self extent
]

{ #category : 'accessing' }
SDL3Rect >> extent [

	^ self w @ self h
]

{ #category : 'accessing - structure variables' }
SDL3Rect >> h [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_H
]

{ #category : 'accessing - structure variables' }
SDL3Rect >> h: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_H put: anObject
]

{ #category : 'accessing' }
SDL3Rect >> origin [

	^ self x @ self y
]

{ #category : 'printing' }
SDL3Rect >> printOn: aStream [

	self asRectangle printOn: aStream
]

{ #category : 'configuring' }
SDL3Rect >> updateFrom: aRectangle [

	self
		x: aRectangle origin x asInteger;
		y: aRectangle origin y asInteger;
		w: aRectangle width asInteger;
		h: aRectangle height asInteger
]

{ #category : 'accessing - structure variables' }
SDL3Rect >> w [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_W
]

{ #category : 'accessing - structure variables' }
SDL3Rect >> w: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_W put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3Rect >> x [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_X
]

{ #category : 'accessing - structure variables' }
SDL3Rect >> x: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_X put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3Rect >> y [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_Y
]

{ #category : 'accessing - structure variables' }
SDL3Rect >> y: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_Y put: anObject
]
