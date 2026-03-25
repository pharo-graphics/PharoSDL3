Class {
	#name : 'SDL3HapticCustom',
	#superclass : 'SDL3Structure',
	#classVars : [
		'OFFSET_ATTACK_LENGTH',
		'OFFSET_ATTACK_LEVEL',
		'OFFSET_BUTTON',
		'OFFSET_CHANNELS',
		'OFFSET_DATA',
		'OFFSET_DELAY',
		'OFFSET_DIRECTION',
		'OFFSET_FADE_LENGTH',
		'OFFSET_FADE_LEVEL',
		'OFFSET_INTERVAL',
		'OFFSET_LENGTH',
		'OFFSET_PERIOD',
		'OFFSET_SAMPLES',
		'OFFSET_TYPE'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'field definition' }
SDL3HapticCustom class >> fieldsDesc [

	^ #(
	SDL_HapticEffectType type;
	SDL_HapticDirection direction;
	Uint32 length;
	Uint16 delay;
	Uint16 button;
	Uint16 interval;
	Uint8 channels;
	Uint16 period;
	Uint16 samples;
	Uint16* data;
	Uint16 attack_length;
	Uint16 attack_level;
	Uint16 fade_length;
	Uint16 fade_level
	)
]

{ #category : 'accessing - structure variables' }
SDL3HapticCustom >> attackLength [
	"This method was automatically generated"
	^handle unsignedShortAt: OFFSET_ATTACK_LENGTH
]

{ #category : 'accessing - structure variables' }
SDL3HapticCustom >> attackLength: anObject [
	"This method was automatically generated"
	handle unsignedShortAt: OFFSET_ATTACK_LENGTH put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3HapticCustom >> attackLevel [
	"This method was automatically generated"
	^handle unsignedShortAt: OFFSET_ATTACK_LEVEL
]

{ #category : 'accessing - structure variables' }
SDL3HapticCustom >> attackLevel: anObject [
	"This method was automatically generated"
	handle unsignedShortAt: OFFSET_ATTACK_LEVEL put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3HapticCustom >> button [
	"This method was automatically generated"
	^handle unsignedShortAt: OFFSET_BUTTON
]

{ #category : 'accessing - structure variables' }
SDL3HapticCustom >> button: anObject [
	"This method was automatically generated"
	handle unsignedShortAt: OFFSET_BUTTON put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3HapticCustom >> channels [
	"This method was automatically generated"
	^handle unsignedByteAt: OFFSET_CHANNELS
]

{ #category : 'accessing - structure variables' }
SDL3HapticCustom >> channels: anObject [
	"This method was automatically generated"
	handle unsignedByteAt: OFFSET_CHANNELS put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3HapticCustom >> data [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_DATA) type: ExternalType ushort asPointerType
]

{ #category : 'accessing - structure variables' }
SDL3HapticCustom >> data: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_DATA put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
SDL3HapticCustom >> delay [
	"This method was automatically generated"
	^handle unsignedShortAt: OFFSET_DELAY
]

{ #category : 'accessing - structure variables' }
SDL3HapticCustom >> delay: anObject [
	"This method was automatically generated"
	handle unsignedShortAt: OFFSET_DELAY put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3HapticCustom >> direction [
	"This method was automatically generated"
	^ SDL3HapticDirection fromHandle: (handle referenceStructAt: OFFSET_DIRECTION length: SDL3HapticDirection byteSize)
]

{ #category : 'accessing - structure variables' }
SDL3HapticCustom >> direction: anObject [
	"This method was automatically generated"
	handle structAt: OFFSET_DIRECTION put: anObject getHandle length: SDL3HapticDirection byteSize
]

{ #category : 'accessing - structure variables' }
SDL3HapticCustom >> fadeLength [
	"This method was automatically generated"
	^handle unsignedShortAt: OFFSET_FADE_LENGTH
]

{ #category : 'accessing - structure variables' }
SDL3HapticCustom >> fadeLength: anObject [
	"This method was automatically generated"
	handle unsignedShortAt: OFFSET_FADE_LENGTH put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3HapticCustom >> fadeLevel [
	"This method was automatically generated"
	^handle unsignedShortAt: OFFSET_FADE_LEVEL
]

{ #category : 'accessing - structure variables' }
SDL3HapticCustom >> fadeLevel: anObject [
	"This method was automatically generated"
	handle unsignedShortAt: OFFSET_FADE_LEVEL put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3HapticCustom >> interval [
	"This method was automatically generated"
	^handle unsignedShortAt: OFFSET_INTERVAL
]

{ #category : 'accessing - structure variables' }
SDL3HapticCustom >> interval: anObject [
	"This method was automatically generated"
	handle unsignedShortAt: OFFSET_INTERVAL put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3HapticCustom >> length [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_LENGTH
]

{ #category : 'accessing - structure variables' }
SDL3HapticCustom >> length: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_LENGTH put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3HapticCustom >> period [
	"This method was automatically generated"
	^handle unsignedShortAt: OFFSET_PERIOD
]

{ #category : 'accessing - structure variables' }
SDL3HapticCustom >> period: anObject [
	"This method was automatically generated"
	handle unsignedShortAt: OFFSET_PERIOD put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3HapticCustom >> samples [
	"This method was automatically generated"
	^handle unsignedShortAt: OFFSET_SAMPLES
]

{ #category : 'accessing - structure variables' }
SDL3HapticCustom >> samples: anObject [
	"This method was automatically generated"
	handle unsignedShortAt: OFFSET_SAMPLES put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3HapticCustom >> type [
	"This method was automatically generated"
	^handle unsignedShortAt: OFFSET_TYPE
]

{ #category : 'accessing - structure variables' }
SDL3HapticCustom >> type: anObject [
	"This method was automatically generated"
	handle unsignedShortAt: OFFSET_TYPE put: anObject
]
