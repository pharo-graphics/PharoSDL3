Class {
	#name : 'SDL3JoyAxisEvent',
	#superclass : 'S3SDLMappedEvent',
	#classVars : [
		'OFFSET_AXIS',
		'OFFSET_PADDING1',
		'OFFSET_PADDING2',
		'OFFSET_PADDING3',
		'OFFSET_PADDING4',
		'OFFSET_RESERVED',
		'OFFSET_TIMESTAMP',
		'OFFSET_TYPE',
		'OFFSET_VALUE',
		'OFFSET_WHICH'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'field definition' }
SDL3JoyAxisEvent class >> fieldsDesc [

	^ #(
	SDL_EventType type;
	Uint32 reserved;
	Uint64 timestamp;
	SDL_JoystickID which;
	Uint8 axis;
	Uint8 padding1;
	Uint8 padding2;
	Uint8 padding3;
	Sint16 value;
	Uint16 padding4
	)
]

{ #category : 'accessing - structure variables' }
SDL3JoyAxisEvent >> axis [
	"This method was automatically generated"
	^handle unsignedByteAt: OFFSET_AXIS
]

{ #category : 'accessing - structure variables' }
SDL3JoyAxisEvent >> axis: anObject [
	"This method was automatically generated"
	handle unsignedByteAt: OFFSET_AXIS put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3JoyAxisEvent >> padding1 [
	"This method was automatically generated"
	^handle unsignedByteAt: OFFSET_PADDING1
]

{ #category : 'accessing - structure variables' }
SDL3JoyAxisEvent >> padding1: anObject [
	"This method was automatically generated"
	handle unsignedByteAt: OFFSET_PADDING1 put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3JoyAxisEvent >> padding2 [
	"This method was automatically generated"
	^handle unsignedByteAt: OFFSET_PADDING2
]

{ #category : 'accessing - structure variables' }
SDL3JoyAxisEvent >> padding2: anObject [
	"This method was automatically generated"
	handle unsignedByteAt: OFFSET_PADDING2 put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3JoyAxisEvent >> padding3 [
	"This method was automatically generated"
	^handle unsignedByteAt: OFFSET_PADDING3
]

{ #category : 'accessing - structure variables' }
SDL3JoyAxisEvent >> padding3: anObject [
	"This method was automatically generated"
	handle unsignedByteAt: OFFSET_PADDING3 put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3JoyAxisEvent >> padding4 [
	"This method was automatically generated"
	^handle unsignedShortAt: OFFSET_PADDING4
]

{ #category : 'accessing - structure variables' }
SDL3JoyAxisEvent >> padding4: anObject [
	"This method was automatically generated"
	handle unsignedShortAt: OFFSET_PADDING4 put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3JoyAxisEvent >> reserved [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_RESERVED
]

{ #category : 'accessing - structure variables' }
SDL3JoyAxisEvent >> reserved: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_RESERVED put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3JoyAxisEvent >> timestamp [
	"This method was automatically generated"
	^handle unsignedLongLongAt: OFFSET_TIMESTAMP
]

{ #category : 'accessing - structure variables' }
SDL3JoyAxisEvent >> timestamp: anObject [
	"This method was automatically generated"
	handle unsignedLongLongAt: OFFSET_TIMESTAMP put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3JoyAxisEvent >> type [
	"This method was automatically generated"
	^SDL3EventType fromInteger: (handle unsignedLongAt: OFFSET_TYPE)
]

{ #category : 'accessing - structure variables' }
SDL3JoyAxisEvent >> type: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_TYPE put: anObject value
]

{ #category : 'accessing - structure variables' }
SDL3JoyAxisEvent >> value [
	"This method was automatically generated"
	^handle signedShortAt: OFFSET_VALUE
]

{ #category : 'accessing - structure variables' }
SDL3JoyAxisEvent >> value: anObject [
	"This method was automatically generated"
	handle signedShortAt: OFFSET_VALUE put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3JoyAxisEvent >> which [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_WHICH
]

{ #category : 'accessing - structure variables' }
SDL3JoyAxisEvent >> which: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_WHICH put: anObject
]
