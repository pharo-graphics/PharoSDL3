"
I am a SDL3 FFI binding for `SDL_FRect`.

A rectangle stored using floating point values.

See: https://wiki.libsdl.org/SDL3/SDL_FRect
"
Class {
	#name : 'SDL3FRect',
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
SDL3FRect class >> fieldsDesc [

	^ #(
	float x;
	float y;
	float w;
	float h
	)
]

{ #category : 'instance creation' }
SDL3FRect class >> newFrom: aRectangle [

	^ self origin: aRectangle origin extent: aRectangle extent
]

{ #category : 'instance creation' }
SDL3FRect class >> origin: origin extent: extent [

	^ self
		 x: origin x
		 y: origin y
		 width: extent x
		 height: extent y
]

{ #category : 'instance creation' }
SDL3FRect class >> x: x y: y width: w height: h [

	^ self new
		 x: x;
		 y: y;
		 w: w;
		 h: h;
		 yourself
]

{ #category : 'accessing' }
SDL3FRect >> extent [

	^ self w @ self h
]

{ #category : 'accessing - structure variables' }
SDL3FRect >> h [
	"This method was automatically generated"
	^handle floatAt: OFFSET_H
]

{ #category : 'accessing - structure variables' }
SDL3FRect >> h: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_H put: anObject
]

{ #category : 'accessing' }
SDL3FRect >> origin [

	^ self x @ self y
]

{ #category : 'configuring' }
SDL3FRect >> updateFrom: aRectangle [

	self
		x: aRectangle origin x asFloat;
		y: aRectangle origin y asFloat;
		w: aRectangle width asFloat;
		h: aRectangle height asFloat
]

{ #category : 'accessing - structure variables' }
SDL3FRect >> w [
	"This method was automatically generated"
	^handle floatAt: OFFSET_W
]

{ #category : 'accessing - structure variables' }
SDL3FRect >> w: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_W put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3FRect >> x [
	"This method was automatically generated"
	^handle floatAt: OFFSET_X
]

{ #category : 'accessing - structure variables' }
SDL3FRect >> x: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_X put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3FRect >> y [
	"This method was automatically generated"
	^handle floatAt: OFFSET_Y
]

{ #category : 'accessing - structure variables' }
SDL3FRect >> y: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_Y put: anObject
]
