"
I am a SDL3 FFI binding for `SDL_HapticCondition`.

A structure containing a template for a Condition effect.

See: https://wiki.libsdl.org/SDL3/SDL_HapticCondition
"
Class {
	#name : 'SDL3HapticCondition',
	#superclass : 'SDL3Structure',
	#classVars : [
		'OFFSET_BUTTON',
		'OFFSET_CENTER',
		'OFFSET_DEADBAND',
		'OFFSET_DELAY',
		'OFFSET_DIRECTION',
		'OFFSET_INTERVAL',
		'OFFSET_LEFT_COEFF',
		'OFFSET_LEFT_SAT',
		'OFFSET_LENGTH',
		'OFFSET_RIGHT_COEFF',
		'OFFSET_RIGHT_SAT',
		'OFFSET_TYPE'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'field definition' }
SDL3HapticCondition class >> fieldsDesc [

	^ #(
	SDL_HapticEffectType type;
	SDL_HapticDirection direction;
	Uint32 length;
	Uint16 delay;
	Uint16 button;
	Uint16 interval;
	Uint16_3 right_sat;
	Uint16_3 left_sat;
	Sint16_3 right_coeff;
	Sint16_3 left_coeff;
	Uint16_3 deadband;
	Sint16_3 center
	)
]

{ #category : 'accessing - structure variables' }
SDL3HapticCondition >> button [
	"This method was automatically generated"
	^handle unsignedShortAt: OFFSET_BUTTON
]

{ #category : 'accessing - structure variables' }
SDL3HapticCondition >> button: anObject [
	"This method was automatically generated"
	handle unsignedShortAt: OFFSET_BUTTON put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3HapticCondition >> center [
	"This method was automatically generated"
	^(FFIArray ofType: #FFIInt16 size: 3) fromHandle: (handle copyFrom: OFFSET_CENTER to: OFFSET_CENTER + 5)
]

{ #category : 'accessing - structure variables' }
SDL3HapticCondition >> center: anObject [
	"This method was automatically generated"
	handle replaceFrom: OFFSET_CENTER to: OFFSET_CENTER + 5 with: anObject getHandle startingAt: 1
]

{ #category : 'accessing - structure variables' }
SDL3HapticCondition >> deadband [
	"This method was automatically generated"
	^(FFIArray ofType: #FFIUInt16 size: 3) fromHandle: (handle copyFrom: OFFSET_DEADBAND to: OFFSET_DEADBAND + 5)
]

{ #category : 'accessing - structure variables' }
SDL3HapticCondition >> deadband: anObject [
	"This method was automatically generated"
	handle replaceFrom: OFFSET_DEADBAND to: OFFSET_DEADBAND + 5 with: anObject getHandle startingAt: 1
]

{ #category : 'accessing - structure variables' }
SDL3HapticCondition >> delay [
	"This method was automatically generated"
	^handle unsignedShortAt: OFFSET_DELAY
]

{ #category : 'accessing - structure variables' }
SDL3HapticCondition >> delay: anObject [
	"This method was automatically generated"
	handle unsignedShortAt: OFFSET_DELAY put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3HapticCondition >> direction [
	"This method was automatically generated"
	^ SDL3HapticDirection fromHandle: (handle referenceStructAt: OFFSET_DIRECTION length: SDL3HapticDirection byteSize)
]

{ #category : 'accessing - structure variables' }
SDL3HapticCondition >> direction: anObject [
	"This method was automatically generated"
	handle structAt: OFFSET_DIRECTION put: anObject getHandle length: SDL3HapticDirection byteSize
]

{ #category : 'accessing - structure variables' }
SDL3HapticCondition >> interval [
	"This method was automatically generated"
	^handle unsignedShortAt: OFFSET_INTERVAL
]

{ #category : 'accessing - structure variables' }
SDL3HapticCondition >> interval: anObject [
	"This method was automatically generated"
	handle unsignedShortAt: OFFSET_INTERVAL put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3HapticCondition >> leftCoeff [
	"This method was automatically generated"
	^(FFIArray ofType: #FFIInt16 size: 3) fromHandle: (handle copyFrom: OFFSET_LEFT_COEFF to: OFFSET_LEFT_COEFF + 5)
]

{ #category : 'accessing - structure variables' }
SDL3HapticCondition >> leftCoeff: anObject [
	"This method was automatically generated"
	handle replaceFrom: OFFSET_LEFT_COEFF to: OFFSET_LEFT_COEFF + 5 with: anObject getHandle startingAt: 1
]

{ #category : 'accessing - structure variables' }
SDL3HapticCondition >> leftSat [
	"This method was automatically generated"
	^(FFIArray ofType: #FFIUInt16 size: 3) fromHandle: (handle copyFrom: OFFSET_LEFT_SAT to: OFFSET_LEFT_SAT + 5)
]

{ #category : 'accessing - structure variables' }
SDL3HapticCondition >> leftSat: anObject [
	"This method was automatically generated"
	handle replaceFrom: OFFSET_LEFT_SAT to: OFFSET_LEFT_SAT + 5 with: anObject getHandle startingAt: 1
]

{ #category : 'accessing - structure variables' }
SDL3HapticCondition >> length [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_LENGTH
]

{ #category : 'accessing - structure variables' }
SDL3HapticCondition >> length: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_LENGTH put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3HapticCondition >> rightCoeff [
	"This method was automatically generated"
	^(FFIArray ofType: #FFIInt16 size: 3) fromHandle: (handle copyFrom: OFFSET_RIGHT_COEFF to: OFFSET_RIGHT_COEFF + 5)
]

{ #category : 'accessing - structure variables' }
SDL3HapticCondition >> rightCoeff: anObject [
	"This method was automatically generated"
	handle replaceFrom: OFFSET_RIGHT_COEFF to: OFFSET_RIGHT_COEFF + 5 with: anObject getHandle startingAt: 1
]

{ #category : 'accessing - structure variables' }
SDL3HapticCondition >> rightSat [
	"This method was automatically generated"
	^(FFIArray ofType: #FFIUInt16 size: 3) fromHandle: (handle copyFrom: OFFSET_RIGHT_SAT to: OFFSET_RIGHT_SAT + 5)
]

{ #category : 'accessing - structure variables' }
SDL3HapticCondition >> rightSat: anObject [
	"This method was automatically generated"
	handle replaceFrom: OFFSET_RIGHT_SAT to: OFFSET_RIGHT_SAT + 5 with: anObject getHandle startingAt: 1
]

{ #category : 'accessing - structure variables' }
SDL3HapticCondition >> type [
	"This method was automatically generated"
	^handle unsignedShortAt: OFFSET_TYPE
]

{ #category : 'accessing - structure variables' }
SDL3HapticCondition >> type: anObject [
	"This method was automatically generated"
	handle unsignedShortAt: OFFSET_TYPE put: anObject
]
