Class {
	#name : 'SDL3VirtualJoystickTouchpadDesc',
	#superclass : 'SDL3Structure',
	#classVars : [
		'OFFSET_NFINGERS',
		'OFFSET_PADDING'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'field definition' }
SDL3VirtualJoystickTouchpadDesc class >> fieldsDesc [

	^ #(
	Uint16 nfingers;
	Uint16_3 padding
	)
]

{ #category : 'accessing - structure variables' }
SDL3VirtualJoystickTouchpadDesc >> nfingers [
	"This method was automatically generated"
	^handle unsignedShortAt: OFFSET_NFINGERS
]

{ #category : 'accessing - structure variables' }
SDL3VirtualJoystickTouchpadDesc >> nfingers: anObject [
	"This method was automatically generated"
	handle unsignedShortAt: OFFSET_NFINGERS put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3VirtualJoystickTouchpadDesc >> padding [
	"This method was automatically generated"
	^(FFITypeArray ofType: #FFIUInt16 size: 3) fromHandle: (handle copyFrom: OFFSET_PADDING to: OFFSET_PADDING + 5)
]

{ #category : 'accessing - structure variables' }
SDL3VirtualJoystickTouchpadDesc >> padding: anObject [
	"This method was automatically generated"
	handle replaceFrom: OFFSET_PADDING to: OFFSET_PADDING + 5 with: anObject getHandle startingAt: 1
]
