"
I am a SDL3 FFI binding for `SDL_HapticConstant`.

A structure containing a template for a Constant effect.

See: https://wiki.libsdl.org/SDL3/SDL_HapticConstant
"
Class {
	#name : 'SDL3HapticConstant',
	#superclass : 'SDL3Structure',
	#classVars : [
		'OFFSET_ATTACK_LENGTH',
		'OFFSET_ATTACK_LEVEL',
		'OFFSET_BUTTON',
		'OFFSET_DELAY',
		'OFFSET_DIRECTION',
		'OFFSET_FADE_LENGTH',
		'OFFSET_FADE_LEVEL',
		'OFFSET_INTERVAL',
		'OFFSET_LENGTH',
		'OFFSET_LEVEL',
		'OFFSET_TYPE'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'field definition' }
SDL3HapticConstant class >> fieldsDesc [

	^ #(
	SDL_HapticEffectType type;
	SDL_HapticDirection direction;
	Uint32 length;
	Uint16 delay;
	Uint16 button;
	Uint16 interval;
	Sint16 level;
	Uint16 attack_length;
	Uint16 attack_level;
	Uint16 fade_length;
	Uint16 fade_level
	)
]

{ #category : 'accessing - structure variables' }
SDL3HapticConstant >> attackLength [
	"This method was automatically generated"
	^handle unsignedShortAt: OFFSET_ATTACK_LENGTH
]

{ #category : 'accessing - structure variables' }
SDL3HapticConstant >> attackLength: anObject [
	"This method was automatically generated"
	handle unsignedShortAt: OFFSET_ATTACK_LENGTH put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3HapticConstant >> attackLevel [
	"This method was automatically generated"
	^handle unsignedShortAt: OFFSET_ATTACK_LEVEL
]

{ #category : 'accessing - structure variables' }
SDL3HapticConstant >> attackLevel: anObject [
	"This method was automatically generated"
	handle unsignedShortAt: OFFSET_ATTACK_LEVEL put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3HapticConstant >> button [
	"This method was automatically generated"
	^handle unsignedShortAt: OFFSET_BUTTON
]

{ #category : 'accessing - structure variables' }
SDL3HapticConstant >> button: anObject [
	"This method was automatically generated"
	handle unsignedShortAt: OFFSET_BUTTON put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3HapticConstant >> delay [
	"This method was automatically generated"
	^handle unsignedShortAt: OFFSET_DELAY
]

{ #category : 'accessing - structure variables' }
SDL3HapticConstant >> delay: anObject [
	"This method was automatically generated"
	handle unsignedShortAt: OFFSET_DELAY put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3HapticConstant >> direction [
	"This method was automatically generated"
	^ SDL3HapticDirection fromHandle: (handle referenceStructAt: OFFSET_DIRECTION length: SDL3HapticDirection byteSize)
]

{ #category : 'accessing - structure variables' }
SDL3HapticConstant >> direction: anObject [
	"This method was automatically generated"
	handle structAt: OFFSET_DIRECTION put: anObject getHandle length: SDL3HapticDirection byteSize
]

{ #category : 'accessing - structure variables' }
SDL3HapticConstant >> fadeLength [
	"This method was automatically generated"
	^handle unsignedShortAt: OFFSET_FADE_LENGTH
]

{ #category : 'accessing - structure variables' }
SDL3HapticConstant >> fadeLength: anObject [
	"This method was automatically generated"
	handle unsignedShortAt: OFFSET_FADE_LENGTH put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3HapticConstant >> fadeLevel [
	"This method was automatically generated"
	^handle unsignedShortAt: OFFSET_FADE_LEVEL
]

{ #category : 'accessing - structure variables' }
SDL3HapticConstant >> fadeLevel: anObject [
	"This method was automatically generated"
	handle unsignedShortAt: OFFSET_FADE_LEVEL put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3HapticConstant >> interval [
	"This method was automatically generated"
	^handle unsignedShortAt: OFFSET_INTERVAL
]

{ #category : 'accessing - structure variables' }
SDL3HapticConstant >> interval: anObject [
	"This method was automatically generated"
	handle unsignedShortAt: OFFSET_INTERVAL put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3HapticConstant >> length [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_LENGTH
]

{ #category : 'accessing - structure variables' }
SDL3HapticConstant >> length: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_LENGTH put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3HapticConstant >> level [
	"This method was automatically generated"
	^handle signedShortAt: OFFSET_LEVEL
]

{ #category : 'accessing - structure variables' }
SDL3HapticConstant >> level: anObject [
	"This method was automatically generated"
	handle signedShortAt: OFFSET_LEVEL put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3HapticConstant >> type [
	"This method was automatically generated"
	^handle unsignedShortAt: OFFSET_TYPE
]

{ #category : 'accessing - structure variables' }
SDL3HapticConstant >> type: anObject [
	"This method was automatically generated"
	handle unsignedShortAt: OFFSET_TYPE put: anObject
]
