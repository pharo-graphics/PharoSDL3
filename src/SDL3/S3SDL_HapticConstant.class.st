Class {
	#name : 'S3SDL_HapticConstant',
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
		'OFFSET_LEVEL',
		'OFFSET_TYPE'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'field definition' }
S3SDL_HapticConstant class >> fieldsDesc [

	^ #(
	int type;
	SDL_HapticDirection direction;
	int length;
	int delay;
	int button;
	int interval;
	int level;
	int attack_length;
	int attack_level;
	int fade_length;
	int fade_level
	)
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticConstant >> attack_length [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_ATTACK_LENGTH
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticConstant >> attack_length: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_ATTACK_LENGTH put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticConstant >> attack_level [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_ATTACK_LEVEL
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticConstant >> attack_level: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_ATTACK_LEVEL put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticConstant >> button [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_BUTTON
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticConstant >> button: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_BUTTON put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticConstant >> delay [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_DELAY
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticConstant >> delay: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_DELAY put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticConstant >> direction [
	"This method was automatically generated"
	^ S3SDL_HapticDirection fromHandle: (handle referenceStructAt: OFFSET_DIRECTION length: S3SDL_HapticDirection byteSize)
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticConstant >> direction: anObject [
	"This method was automatically generated"
	handle structAt: OFFSET_DIRECTION put: anObject getHandle length: S3SDL_HapticDirection byteSize
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticConstant >> fade_length [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_FADE_LENGTH
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticConstant >> fade_length: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_FADE_LENGTH put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticConstant >> fade_level [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_FADE_LEVEL
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticConstant >> fade_level: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_FADE_LEVEL put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticConstant >> interval [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_INTERVAL
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticConstant >> interval: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_INTERVAL put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticConstant >> length [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_LENGTH
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticConstant >> length: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_LENGTH put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticConstant >> level [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_LEVEL
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticConstant >> level: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_LEVEL put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticConstant >> type [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_TYPE
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticConstant >> type: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_TYPE put: anObject
]
