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
