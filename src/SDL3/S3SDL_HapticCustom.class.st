Class {
	#name : 'S3SDL_HapticCustom',
	#superclass : 'S3Structure',
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
S3SDL_HapticCustom class >> fieldsDesc [

	^ #(
	int type;
	SDL_HapticDirection direction;
	int length;
	int delay;
	int button;
	int interval;
	int channels;
	int period;
	int samples;
	int* data;
	int attack_length;
	int attack_level;
	int fade_length;
	int fade_level
	)
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticCustom >> attack_length [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_ATTACK_LENGTH
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticCustom >> attack_length: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_ATTACK_LENGTH put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticCustom >> attack_level [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_ATTACK_LEVEL
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticCustom >> attack_level: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_ATTACK_LEVEL put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticCustom >> button [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_BUTTON
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticCustom >> button: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_BUTTON put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticCustom >> channels [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_CHANNELS
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticCustom >> channels: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_CHANNELS put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticCustom >> data [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_DATA) type: ExternalType long asPointerType
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticCustom >> data: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_DATA put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticCustom >> delay [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_DELAY
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticCustom >> delay: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_DELAY put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticCustom >> direction [
	"This method was automatically generated"
	^ S3SDL_HapticDirection fromHandle: (handle referenceStructAt: OFFSET_DIRECTION length: S3SDL_HapticDirection byteSize)
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticCustom >> direction: anObject [
	"This method was automatically generated"
	handle structAt: OFFSET_DIRECTION put: anObject getHandle length: S3SDL_HapticDirection byteSize
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticCustom >> fade_length [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_FADE_LENGTH
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticCustom >> fade_length: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_FADE_LENGTH put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticCustom >> fade_level [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_FADE_LEVEL
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticCustom >> fade_level: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_FADE_LEVEL put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticCustom >> interval [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_INTERVAL
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticCustom >> interval: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_INTERVAL put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticCustom >> length [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_LENGTH
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticCustom >> length: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_LENGTH put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticCustom >> period [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_PERIOD
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticCustom >> period: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_PERIOD put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticCustom >> samples [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_SAMPLES
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticCustom >> samples: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_SAMPLES put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticCustom >> type [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_TYPE
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticCustom >> type: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_TYPE put: anObject
]
