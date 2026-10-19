"
I am a SDL3 FFI binding for `SDL_FColor`.

The bits of this structure can be directly reinterpreted as a float-packed color which uses the SDL_PIXELFORMAT_RGBA128_FLOAT format

See: https://wiki.libsdl.org/SDL3/SDL_FColor
"
Class {
	#name : 'SDL3FColor',
	#superclass : 'SDL3Structure',
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
SDL3FColor class >> fieldsDesc [

	^ #(
	float r;
	float g;
	float b;
	float a
	)
]

{ #category : 'instance creation' }
SDL3FColor class >> r: red g: green b: blue a: alpha [

	^ self new
		r: red;
		g: green;
		b: blue;
		a: alpha;
		yourself
]

{ #category : 'accessing - structure variables' }
SDL3FColor >> a [
	"This method was automatically generated"
	^handle floatAt: OFFSET_A
]

{ #category : 'accessing - structure variables' }
SDL3FColor >> a: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_A put: anObject
]

{ #category : 'converting' }
SDL3FColor >> asColor [

	^ Color r: self r g: self g b: self b alpha: self a
]

{ #category : 'accessing - structure variables' }
SDL3FColor >> b [
	"This method was automatically generated"
	^handle floatAt: OFFSET_B
]

{ #category : 'accessing - structure variables' }
SDL3FColor >> b: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_B put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3FColor >> g [
	"This method was automatically generated"
	^handle floatAt: OFFSET_G
]

{ #category : 'accessing - structure variables' }
SDL3FColor >> g: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_G put: anObject
]

{ #category : 'printing' }
SDL3FColor >> printOn: aStream [

	super printOn: aStream.
	aStream
		nextPutAll: '(r: ';
		print: self r;
		nextPutAll: ' g: ';
		print: self g;
		nextPutAll: ' b: ';
		print: self b;
		nextPutAll: ' a: ';
		print: self a;
		nextPutAll: ')'
]

{ #category : 'accessing - structure variables' }
SDL3FColor >> r [
	"This method was automatically generated"
	^handle floatAt: OFFSET_R
]

{ #category : 'accessing - structure variables' }
SDL3FColor >> r: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_R put: anObject
]

{ #category : 'configuring' }
SDL3FColor >> updateFrom: aPharoColor [

	self
		r: aPharoColor red;
		g: aPharoColor green;
		b: aPharoColor blue;
		a: aPharoColor alpha
]
