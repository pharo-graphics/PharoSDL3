Class {
	#name : 'SDL3PinchFingerEvent',
	#superclass : 'SDL3WindowIDEvent',
	#classVars : [
		'OFFSET_RESERVED',
		'OFFSET_SCALE',
		'OFFSET_TIMESTAMP',
		'OFFSET_TYPE',
		'OFFSET_WINDOWID'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'field definition' }
SDL3PinchFingerEvent class >> fieldsDesc [

	^ #(
	SDL_EventType type;
	Uint32 reserved;
	Uint64 timestamp;
	float scale;
	SDL_WindowID windowID
	)
]

{ #category : 'accessing - structure variables' }
SDL3PinchFingerEvent >> reserved [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_RESERVED
]

{ #category : 'accessing - structure variables' }
SDL3PinchFingerEvent >> reserved: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_RESERVED put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3PinchFingerEvent >> scale [
	"This method was automatically generated"
	^handle floatAt: OFFSET_SCALE
]

{ #category : 'accessing - structure variables' }
SDL3PinchFingerEvent >> scale: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_SCALE put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3PinchFingerEvent >> timestamp [
	"This method was automatically generated"
	^handle unsignedLongLongAt: OFFSET_TIMESTAMP
]

{ #category : 'accessing - structure variables' }
SDL3PinchFingerEvent >> timestamp: anObject [
	"This method was automatically generated"
	handle unsignedLongLongAt: OFFSET_TIMESTAMP put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3PinchFingerEvent >> type [
	"This method was automatically generated"
	^SDL3EventType fromInteger: (handle unsignedLongAt: OFFSET_TYPE)
]

{ #category : 'accessing - structure variables' }
SDL3PinchFingerEvent >> type: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_TYPE put: anObject value
]

{ #category : 'accessing - structure variables' }
SDL3PinchFingerEvent >> windowID [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_WINDOWID
]

{ #category : 'accessing - structure variables' }
SDL3PinchFingerEvent >> windowID: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_WINDOWID put: anObject
]
