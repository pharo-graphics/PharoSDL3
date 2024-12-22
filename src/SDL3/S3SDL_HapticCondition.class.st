Class {
	#name : 'S3SDL_HapticCondition',
	#superclass : 'S3Structure',
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
S3SDL_HapticCondition class >> fieldsDesc [

	^ #(
	int type;
	SDL_HapticDirection direction;
	int length;
	int delay;
	int button;
	int interval;
	int_3 right_sat;
	int_3 left_sat;
	int_3 right_coeff;
	int_3 left_coeff;
	int_3 deadband;
	int_3 center
	)
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticCondition >> button [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_BUTTON
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticCondition >> button: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_BUTTON put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticCondition >> center [
	"This method was automatically generated"
	^(FFITypeArray ofType: #FFIInt32 size: 3) fromHandle: (handle copyFrom: OFFSET_CENTER to: OFFSET_CENTER + 11)
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticCondition >> center: anObject [
	"This method was automatically generated"
	handle replaceFrom: OFFSET_CENTER to: OFFSET_CENTER + 11 with: anObject getHandle startingAt: 1
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticCondition >> deadband [
	"This method was automatically generated"
	^(FFITypeArray ofType: #FFIInt32 size: 3) fromHandle: (handle copyFrom: OFFSET_DEADBAND to: OFFSET_DEADBAND + 11)
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticCondition >> deadband: anObject [
	"This method was automatically generated"
	handle replaceFrom: OFFSET_DEADBAND to: OFFSET_DEADBAND + 11 with: anObject getHandle startingAt: 1
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticCondition >> delay [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_DELAY
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticCondition >> delay: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_DELAY put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticCondition >> direction [
	"This method was automatically generated"
	^ S3SDL_HapticDirection fromHandle: (handle referenceStructAt: OFFSET_DIRECTION length: S3SDL_HapticDirection byteSize)
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticCondition >> direction: anObject [
	"This method was automatically generated"
	handle structAt: OFFSET_DIRECTION put: anObject getHandle length: S3SDL_HapticDirection byteSize
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticCondition >> interval [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_INTERVAL
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticCondition >> interval: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_INTERVAL put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticCondition >> left_coeff [
	"This method was automatically generated"
	^(FFITypeArray ofType: #FFIInt32 size: 3) fromHandle: (handle copyFrom: OFFSET_LEFT_COEFF to: OFFSET_LEFT_COEFF + 11)
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticCondition >> left_coeff: anObject [
	"This method was automatically generated"
	handle replaceFrom: OFFSET_LEFT_COEFF to: OFFSET_LEFT_COEFF + 11 with: anObject getHandle startingAt: 1
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticCondition >> left_sat [
	"This method was automatically generated"
	^(FFITypeArray ofType: #FFIInt32 size: 3) fromHandle: (handle copyFrom: OFFSET_LEFT_SAT to: OFFSET_LEFT_SAT + 11)
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticCondition >> left_sat: anObject [
	"This method was automatically generated"
	handle replaceFrom: OFFSET_LEFT_SAT to: OFFSET_LEFT_SAT + 11 with: anObject getHandle startingAt: 1
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticCondition >> length [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_LENGTH
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticCondition >> length: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_LENGTH put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticCondition >> right_coeff [
	"This method was automatically generated"
	^(FFITypeArray ofType: #FFIInt32 size: 3) fromHandle: (handle copyFrom: OFFSET_RIGHT_COEFF to: OFFSET_RIGHT_COEFF + 11)
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticCondition >> right_coeff: anObject [
	"This method was automatically generated"
	handle replaceFrom: OFFSET_RIGHT_COEFF to: OFFSET_RIGHT_COEFF + 11 with: anObject getHandle startingAt: 1
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticCondition >> right_sat [
	"This method was automatically generated"
	^(FFITypeArray ofType: #FFIInt32 size: 3) fromHandle: (handle copyFrom: OFFSET_RIGHT_SAT to: OFFSET_RIGHT_SAT + 11)
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticCondition >> right_sat: anObject [
	"This method was automatically generated"
	handle replaceFrom: OFFSET_RIGHT_SAT to: OFFSET_RIGHT_SAT + 11 with: anObject getHandle startingAt: 1
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticCondition >> type [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_TYPE
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticCondition >> type: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_TYPE put: anObject
]
