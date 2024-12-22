Class {
	#name : 'S3SDL_HapticLeftRight',
	#superclass : 'S3Structure',
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
S3SDL_HapticLeftRight class >> fieldsDesc [

	^ #(
	int type;
	int length;
	int large_magnitude;
	int small_magnitude
	)
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticLeftRight >> large_magnitude [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_LARGE_MAGNITUDE
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticLeftRight >> large_magnitude: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_LARGE_MAGNITUDE put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticLeftRight >> length [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_LENGTH
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticLeftRight >> length: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_LENGTH put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticLeftRight >> small_magnitude [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_SMALL_MAGNITUDE
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticLeftRight >> small_magnitude: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_SMALL_MAGNITUDE put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticLeftRight >> type [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_TYPE
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticLeftRight >> type: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_TYPE put: anObject
]
