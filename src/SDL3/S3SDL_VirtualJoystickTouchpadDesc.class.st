Class {
	#name : 'S3SDL_VirtualJoystickTouchpadDesc',
	#superclass : 'S3Structure',
	#classVars : [
		'OFFSET_NFINGERS',
		'OFFSET_PADDING'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'field definition' }
S3SDL_VirtualJoystickTouchpadDesc class >> fieldsDesc [

	^ #(
	Uint16 nfingers;
	Uint16_3 padding
	)
]

{ #category : 'accessing - structure variables' }
S3SDL_VirtualJoystickTouchpadDesc >> nfingers [
	"This method was automatically generated"
	^handle unsignedShortAt: OFFSET_NFINGERS
]

{ #category : 'accessing - structure variables' }
S3SDL_VirtualJoystickTouchpadDesc >> nfingers: anObject [
	"This method was automatically generated"
	handle unsignedShortAt: OFFSET_NFINGERS put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_VirtualJoystickTouchpadDesc >> padding [
	"This method was automatically generated"
	^(FFITypeArray ofType: #FFIUInt16 size: 3) fromHandle: (handle copyFrom: OFFSET_PADDING to: OFFSET_PADDING + 5)
]

{ #category : 'accessing - structure variables' }
S3SDL_VirtualJoystickTouchpadDesc >> padding: anObject [
	"This method was automatically generated"
	handle replaceFrom: OFFSET_PADDING to: OFFSET_PADDING + 5 with: anObject getHandle startingAt: 1
]
