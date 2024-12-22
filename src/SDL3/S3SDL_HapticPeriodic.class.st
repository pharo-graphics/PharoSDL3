Class {
	#name : 'S3SDL_HapticPeriodic',
	#superclass : 'S3Structure',
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
S3SDL_HapticPeriodic class >> fieldsDesc [

	^ #(
	int type;
	SDL_HapticDirection direction;
	int length;
	int delay;
	int button;
	int interval;
	int period;
	int magnitude;
	int offset;
	int phase;
	int attack_length;
	int attack_level;
	int fade_length;
	int fade_level
	)
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticPeriodic >> attack_length [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_ATTACK_LENGTH
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticPeriodic >> attack_length: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_ATTACK_LENGTH put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticPeriodic >> attack_level [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_ATTACK_LEVEL
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticPeriodic >> attack_level: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_ATTACK_LEVEL put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticPeriodic >> button [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_BUTTON
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticPeriodic >> button: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_BUTTON put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticPeriodic >> delay [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_DELAY
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticPeriodic >> delay: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_DELAY put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticPeriodic >> direction [
	"This method was automatically generated"
	^ S3SDL_HapticDirection fromHandle: (handle referenceStructAt: OFFSET_DIRECTION length: S3SDL_HapticDirection byteSize)
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticPeriodic >> direction: anObject [
	"This method was automatically generated"
	handle structAt: OFFSET_DIRECTION put: anObject getHandle length: S3SDL_HapticDirection byteSize
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticPeriodic >> fade_length [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_FADE_LENGTH
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticPeriodic >> fade_length: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_FADE_LENGTH put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticPeriodic >> fade_level [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_FADE_LEVEL
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticPeriodic >> fade_level: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_FADE_LEVEL put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticPeriodic >> interval [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_INTERVAL
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticPeriodic >> interval: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_INTERVAL put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticPeriodic >> length [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_LENGTH
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticPeriodic >> length: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_LENGTH put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticPeriodic >> magnitude [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_MAGNITUDE
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticPeriodic >> magnitude: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_MAGNITUDE put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticPeriodic >> offset [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_OFFSET
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticPeriodic >> offset: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_OFFSET put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticPeriodic >> period [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_PERIOD
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticPeriodic >> period: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_PERIOD put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticPeriodic >> phase [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_PHASE
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticPeriodic >> phase: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_PHASE put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticPeriodic >> type [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_TYPE
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticPeriodic >> type: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_TYPE put: anObject
]
