Class {
	#name : 'SDL3HapticPeriodic',
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
		'OFFSET_MAGNITUDE',
		'OFFSET_OFFSET',
		'OFFSET_PERIOD',
		'OFFSET_PHASE',
		'OFFSET_TYPE'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'field definition' }
SDL3HapticPeriodic class >> fieldsDesc [

	^ #(
	SDL_HapticEffectType type;
	SDL_HapticDirection direction;
	Uint32 length;
	Uint16 delay;
	Uint16 button;
	Uint16 interval;
	Uint16 period;
	Sint16 magnitude;
	Sint16 offset;
	Uint16 phase;
	Uint16 attack_length;
	Uint16 attack_level;
	Uint16 fade_length;
	Uint16 fade_level
	)
]

{ #category : 'accessing - structure variables' }
SDL3HapticPeriodic >> attackLength [
	"This method was automatically generated"
	^handle unsignedShortAt: OFFSET_ATTACK_LENGTH
]

{ #category : 'accessing - structure variables' }
SDL3HapticPeriodic >> attackLength: anObject [
	"This method was automatically generated"
	handle unsignedShortAt: OFFSET_ATTACK_LENGTH put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3HapticPeriodic >> attackLevel [
	"This method was automatically generated"
	^handle unsignedShortAt: OFFSET_ATTACK_LEVEL
]

{ #category : 'accessing - structure variables' }
SDL3HapticPeriodic >> attackLevel: anObject [
	"This method was automatically generated"
	handle unsignedShortAt: OFFSET_ATTACK_LEVEL put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3HapticPeriodic >> button [
	"This method was automatically generated"
	^handle unsignedShortAt: OFFSET_BUTTON
]

{ #category : 'accessing - structure variables' }
SDL3HapticPeriodic >> button: anObject [
	"This method was automatically generated"
	handle unsignedShortAt: OFFSET_BUTTON put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3HapticPeriodic >> delay [
	"This method was automatically generated"
	^handle unsignedShortAt: OFFSET_DELAY
]

{ #category : 'accessing - structure variables' }
SDL3HapticPeriodic >> delay: anObject [
	"This method was automatically generated"
	handle unsignedShortAt: OFFSET_DELAY put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3HapticPeriodic >> direction [
	"This method was automatically generated"
	^ SDL3HapticDirection fromHandle: (handle referenceStructAt: OFFSET_DIRECTION length: SDL3HapticDirection byteSize)
]

{ #category : 'accessing - structure variables' }
SDL3HapticPeriodic >> direction: anObject [
	"This method was automatically generated"
	handle structAt: OFFSET_DIRECTION put: anObject getHandle length: SDL3HapticDirection byteSize
]

{ #category : 'accessing - structure variables' }
SDL3HapticPeriodic >> fadeLength [
	"This method was automatically generated"
	^handle unsignedShortAt: OFFSET_FADE_LENGTH
]

{ #category : 'accessing - structure variables' }
SDL3HapticPeriodic >> fadeLength: anObject [
	"This method was automatically generated"
	handle unsignedShortAt: OFFSET_FADE_LENGTH put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3HapticPeriodic >> fadeLevel [
	"This method was automatically generated"
	^handle unsignedShortAt: OFFSET_FADE_LEVEL
]

{ #category : 'accessing - structure variables' }
SDL3HapticPeriodic >> fadeLevel: anObject [
	"This method was automatically generated"
	handle unsignedShortAt: OFFSET_FADE_LEVEL put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3HapticPeriodic >> interval [
	"This method was automatically generated"
	^handle unsignedShortAt: OFFSET_INTERVAL
]

{ #category : 'accessing - structure variables' }
SDL3HapticPeriodic >> interval: anObject [
	"This method was automatically generated"
	handle unsignedShortAt: OFFSET_INTERVAL put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3HapticPeriodic >> length [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_LENGTH
]

{ #category : 'accessing - structure variables' }
SDL3HapticPeriodic >> length: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_LENGTH put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3HapticPeriodic >> magnitude [
	"This method was automatically generated"
	^handle signedShortAt: OFFSET_MAGNITUDE
]

{ #category : 'accessing - structure variables' }
SDL3HapticPeriodic >> magnitude: anObject [
	"This method was automatically generated"
	handle signedShortAt: OFFSET_MAGNITUDE put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3HapticPeriodic >> offset [
	"This method was automatically generated"
	^handle signedShortAt: OFFSET_OFFSET
]

{ #category : 'accessing - structure variables' }
SDL3HapticPeriodic >> offset: anObject [
	"This method was automatically generated"
	handle signedShortAt: OFFSET_OFFSET put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3HapticPeriodic >> period [
	"This method was automatically generated"
	^handle unsignedShortAt: OFFSET_PERIOD
]

{ #category : 'accessing - structure variables' }
SDL3HapticPeriodic >> period: anObject [
	"This method was automatically generated"
	handle unsignedShortAt: OFFSET_PERIOD put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3HapticPeriodic >> phase [
	"This method was automatically generated"
	^handle unsignedShortAt: OFFSET_PHASE
]

{ #category : 'accessing - structure variables' }
SDL3HapticPeriodic >> phase: anObject [
	"This method was automatically generated"
	handle unsignedShortAt: OFFSET_PHASE put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3HapticPeriodic >> type [
	"This method was automatically generated"
	^handle unsignedShortAt: OFFSET_TYPE
]

{ #category : 'accessing - structure variables' }
SDL3HapticPeriodic >> type: anObject [
	"This method was automatically generated"
	handle unsignedShortAt: OFFSET_TYPE put: anObject
]
