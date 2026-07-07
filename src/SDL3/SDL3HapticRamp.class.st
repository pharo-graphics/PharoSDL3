"
I am a SDL3 FFI binding for `SDL_HapticRamp`.

A structure containing a template for a Ramp effect.

See: https://wiki.libsdl.org/SDL3/SDL_HapticRamp
"
Class {
	#name : 'SDL3HapticRamp',
	#superclass : 'SDL3Structure',
	#classVars : [
		'OFFSET_ATTACK_LENGTH',
		'OFFSET_ATTACK_LEVEL',
		'OFFSET_BUTTON',
		'OFFSET_DELAY',
		'OFFSET_DIRECTION',
		'OFFSET_END',
		'OFFSET_FADE_LENGTH',
		'OFFSET_FADE_LEVEL',
		'OFFSET_INTERVAL',
		'OFFSET_LENGTH',
		'OFFSET_START',
		'OFFSET_TYPE'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'field definition' }
SDL3HapticRamp class >> fieldsDesc [

	^ #(
	SDL_HapticEffectType type;
	SDL_HapticDirection direction;
	Uint32 length;
	Uint16 delay;
	Uint16 button;
	Uint16 interval;
	Sint16 start;
	Sint16 end;
	Uint16 attack_length;
	Uint16 attack_level;
	Uint16 fade_length;
	Uint16 fade_level
	)
]

{ #category : 'accessing - structure variables' }
SDL3HapticRamp >> attackLength [
	"This method was automatically generated"
	^handle unsignedShortAt: OFFSET_ATTACK_LENGTH
]

{ #category : 'accessing - structure variables' }
SDL3HapticRamp >> attackLength: anObject [
	"This method was automatically generated"
	handle unsignedShortAt: OFFSET_ATTACK_LENGTH put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3HapticRamp >> attackLevel [
	"This method was automatically generated"
	^handle unsignedShortAt: OFFSET_ATTACK_LEVEL
]

{ #category : 'accessing - structure variables' }
SDL3HapticRamp >> attackLevel: anObject [
	"This method was automatically generated"
	handle unsignedShortAt: OFFSET_ATTACK_LEVEL put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3HapticRamp >> button [
	"This method was automatically generated"
	^handle unsignedShortAt: OFFSET_BUTTON
]

{ #category : 'accessing - structure variables' }
SDL3HapticRamp >> button: anObject [
	"This method was automatically generated"
	handle unsignedShortAt: OFFSET_BUTTON put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3HapticRamp >> delay [
	"This method was automatically generated"
	^handle unsignedShortAt: OFFSET_DELAY
]

{ #category : 'accessing - structure variables' }
SDL3HapticRamp >> delay: anObject [
	"This method was automatically generated"
	handle unsignedShortAt: OFFSET_DELAY put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3HapticRamp >> direction [
	"This method was automatically generated"
	^ SDL3HapticDirection fromHandle: (handle referenceStructAt: OFFSET_DIRECTION length: SDL3HapticDirection byteSize)
]

{ #category : 'accessing - structure variables' }
SDL3HapticRamp >> direction: anObject [
	"This method was automatically generated"
	handle structAt: OFFSET_DIRECTION put: anObject getHandle length: SDL3HapticDirection byteSize
]

{ #category : 'accessing - structure variables' }
SDL3HapticRamp >> end [
	"This method was automatically generated"
	^handle signedShortAt: OFFSET_END
]

{ #category : 'accessing - structure variables' }
SDL3HapticRamp >> end: anObject [
	"This method was automatically generated"
	handle signedShortAt: OFFSET_END put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3HapticRamp >> fadeLength [
	"This method was automatically generated"
	^handle unsignedShortAt: OFFSET_FADE_LENGTH
]

{ #category : 'accessing - structure variables' }
SDL3HapticRamp >> fadeLength: anObject [
	"This method was automatically generated"
	handle unsignedShortAt: OFFSET_FADE_LENGTH put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3HapticRamp >> fadeLevel [
	"This method was automatically generated"
	^handle unsignedShortAt: OFFSET_FADE_LEVEL
]

{ #category : 'accessing - structure variables' }
SDL3HapticRamp >> fadeLevel: anObject [
	"This method was automatically generated"
	handle unsignedShortAt: OFFSET_FADE_LEVEL put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3HapticRamp >> interval [
	"This method was automatically generated"
	^handle unsignedShortAt: OFFSET_INTERVAL
]

{ #category : 'accessing - structure variables' }
SDL3HapticRamp >> interval: anObject [
	"This method was automatically generated"
	handle unsignedShortAt: OFFSET_INTERVAL put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3HapticRamp >> length [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_LENGTH
]

{ #category : 'accessing - structure variables' }
SDL3HapticRamp >> length: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_LENGTH put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3HapticRamp >> start [
	"This method was automatically generated"
	^handle signedShortAt: OFFSET_START
]

{ #category : 'accessing - structure variables' }
SDL3HapticRamp >> start: anObject [
	"This method was automatically generated"
	handle signedShortAt: OFFSET_START put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3HapticRamp >> type [
	"This method was automatically generated"
	^handle unsignedShortAt: OFFSET_TYPE
]

{ #category : 'accessing - structure variables' }
SDL3HapticRamp >> type: anObject [
	"This method was automatically generated"
	handle unsignedShortAt: OFFSET_TYPE put: anObject
]
