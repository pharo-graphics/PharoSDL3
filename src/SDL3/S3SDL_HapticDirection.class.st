Class {
	#name : 'S3SDL_HapticDirection',
	#superclass : 'S3Structure',
	#classVars : [
		'OFFSET_DIR',
		'OFFSET_TYPE'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'field definition' }
S3SDL_HapticDirection class >> fieldsDesc [

	^ #(
	int type;
	int_3 dir
	)
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticDirection >> dir [
	"This method was automatically generated"
	^(FFITypeArray ofType: #FFIInt32 size: 3) fromHandle: (handle copyFrom: OFFSET_DIR to: OFFSET_DIR + 11)
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticDirection >> dir: anObject [
	"This method was automatically generated"
	handle replaceFrom: OFFSET_DIR to: OFFSET_DIR + 11 with: anObject getHandle startingAt: 1
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticDirection >> type [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_TYPE
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticDirection >> type: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_TYPE put: anObject
]
