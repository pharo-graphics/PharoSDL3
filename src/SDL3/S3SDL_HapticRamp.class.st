Class {
	#name : 'S3SDL_HapticRamp',
	#superclass : 'S3Structure',
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
S3SDL_HapticRamp class >> fieldsDesc [

	^ #(
	int type;
	SDL_HapticDirection direction;
	int length;
	int delay;
	int button;
	int interval;
	int start;
	int end;
	int attack_length;
	int attack_level;
	int fade_length;
	int fade_level
	)
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticRamp >> attack_length [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_ATTACK_LENGTH
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticRamp >> attack_length: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_ATTACK_LENGTH put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticRamp >> attack_level [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_ATTACK_LEVEL
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticRamp >> attack_level: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_ATTACK_LEVEL put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticRamp >> button [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_BUTTON
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticRamp >> button: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_BUTTON put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticRamp >> delay [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_DELAY
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticRamp >> delay: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_DELAY put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticRamp >> direction [
	"This method was automatically generated"
	^ S3SDL_HapticDirection fromHandle: (handle referenceStructAt: OFFSET_DIRECTION length: S3SDL_HapticDirection byteSize)
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticRamp >> direction: anObject [
	"This method was automatically generated"
	handle structAt: OFFSET_DIRECTION put: anObject getHandle length: S3SDL_HapticDirection byteSize
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticRamp >> end [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_END
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticRamp >> end: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_END put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticRamp >> fade_length [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_FADE_LENGTH
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticRamp >> fade_length: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_FADE_LENGTH put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticRamp >> fade_level [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_FADE_LEVEL
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticRamp >> fade_level: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_FADE_LEVEL put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticRamp >> interval [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_INTERVAL
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticRamp >> interval: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_INTERVAL put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticRamp >> length [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_LENGTH
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticRamp >> length: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_LENGTH put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticRamp >> start [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_START
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticRamp >> start: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_START put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticRamp >> type [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_TYPE
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticRamp >> type: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_TYPE put: anObject
]
