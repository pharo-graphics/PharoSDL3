Class {
	#name : 'SDL3MouseDeviceEvent',
	#superclass : 'SDL3DeviceEvent',
	#classVars : [
		'OFFSET_RESERVED',
		'OFFSET_TIMESTAMP',
		'OFFSET_TYPE',
		'OFFSET_WHICH'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'field definition' }
SDL3MouseDeviceEvent class >> fieldsDesc [

	^ #(
	SDL_EventType type;
	Uint32 reserved;
	Uint64 timestamp;
	SDL_MouseID which
	)
]

{ #category : 'visitor' }
SDL3MouseDeviceEvent >> accept: aVisitor [

	^ aVisitor visitMouseDeviceEvent: self
]

{ #category : 'accessing - structure variables' }
SDL3MouseDeviceEvent >> timestamp [
	"This method was automatically generated"
	^handle unsignedLongLongAt: OFFSET_TIMESTAMP
]

{ #category : 'accessing - structure variables' }
SDL3MouseDeviceEvent >> which [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_WHICH
]
