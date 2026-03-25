Class {
	#name : 'SDL3HapticLeftRight',
	#superclass : 'SDL3Structure',
	#classVars : [
		'OFFSET_LARGE_MAGNITUDE',
		'OFFSET_LENGTH',
		'OFFSET_SMALL_MAGNITUDE',
		'OFFSET_TYPE'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'field definition' }
SDL3HapticLeftRight class >> fieldsDesc [

	^ #(
	SDL_HapticEffectType type;
	Uint32 length;
	Uint16 large_magnitude;
	Uint16 small_magnitude
	)
]

{ #category : 'accessing - structure variables' }
SDL3HapticLeftRight >> largeMagnitude [
	"This method was automatically generated"
	^handle unsignedShortAt: OFFSET_LARGE_MAGNITUDE
]

{ #category : 'accessing - structure variables' }
SDL3HapticLeftRight >> largeMagnitude: anObject [
	"This method was automatically generated"
	handle unsignedShortAt: OFFSET_LARGE_MAGNITUDE put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3HapticLeftRight >> length [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_LENGTH
]

{ #category : 'accessing - structure variables' }
SDL3HapticLeftRight >> length: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_LENGTH put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3HapticLeftRight >> smallMagnitude [
	"This method was automatically generated"
	^handle unsignedShortAt: OFFSET_SMALL_MAGNITUDE
]

{ #category : 'accessing - structure variables' }
SDL3HapticLeftRight >> smallMagnitude: anObject [
	"This method was automatically generated"
	handle unsignedShortAt: OFFSET_SMALL_MAGNITUDE put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3HapticLeftRight >> type [
	"This method was automatically generated"
	^handle unsignedShortAt: OFFSET_TYPE
]

{ #category : 'accessing - structure variables' }
SDL3HapticLeftRight >> type: anObject [
	"This method was automatically generated"
	handle unsignedShortAt: OFFSET_TYPE put: anObject
]
