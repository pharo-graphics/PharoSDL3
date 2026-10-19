"
I am a SDL3 FFI binding for `SDL_Palette`.

A set of indexed colors representing a palette.

See: https://wiki.libsdl.org/SDL3/SDL_Palette
"
Class {
	#name : 'SDL3Palette',
	#superclass : 'SDL3Structure',
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
SDL3Palette class >> fieldsDesc [

	^ #(
	int ncolors;
	SDL_Color* colors;
	Uint32 version;
	int refcount
	)
]

{ #category : 'instance creation' }
SDL3Palette class >> unownedNew: ncolors [

	^ (self ffiLibrary createPalette: ncolors)
		  assertNotNullReturn;
		  yourself
]

{ #category : 'accessing - structure variables' }
SDL3Palette >> colors [
	"This method was automatically generated"
	^SDL3Color fromHandle: (handle pointerAt: OFFSET_COLORS)
]

{ #category : 'accessing - structure variables' }
SDL3Palette >> colors: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_COLORS put: anObject getHandle.
]

{ #category : 'accessing' }
SDL3Palette >> colors: colors firstcolor: firstcolor ncolors: ncolors [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			setPaletteColorsPalette: self
			colors: colors
			firstcolor: firstcolor
			ncolors: ncolors)
]

{ #category : 'finalization' }
SDL3Palette >> destroy [

	self ffiLibrary destroyPalette: self
]

{ #category : 'finalization' }
SDL3Palette >> dispose [

	(handle isNil or: [ self isNull ]) ifTrue: [ ^ self ].
	self destroy.
	handle := nil
]

{ #category : 'accessing - structure variables' }
SDL3Palette >> ncolors [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_NCOLORS
]

{ #category : 'accessing - structure variables' }
SDL3Palette >> ncolors: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_NCOLORS put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3Palette >> refcount [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_REFCOUNT
]

{ #category : 'accessing - structure variables' }
SDL3Palette >> refcount: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_REFCOUNT put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3Palette >> version [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_VERSION
]

{ #category : 'accessing - structure variables' }
SDL3Palette >> version: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_VERSION put: anObject
]
