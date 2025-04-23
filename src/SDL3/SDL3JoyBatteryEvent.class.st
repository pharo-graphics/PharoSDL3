Class {
	#name : 'SDL3JoyBatteryEvent',
	#superclass : 'S3SDLMappedEvent',
	#classVars : [
		'OFFSET_PERCENT',
		'OFFSET_RESERVED',
		'OFFSET_STATE',
		'OFFSET_TIMESTAMP',
		'OFFSET_TYPE',
		'OFFSET_WHICH'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'field definition' }
SDL3JoyBatteryEvent class >> fieldsDesc [

	^ #(
	SDL_EventType type;
	Uint32 reserved;
	Uint64 timestamp;
	SDL_JoystickID which;
	SDL_PowerState state;
	int percent
	)
]

{ #category : 'accessing - structure variables' }
SDL3JoyBatteryEvent >> percent [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_PERCENT
]

{ #category : 'accessing - structure variables' }
SDL3JoyBatteryEvent >> percent: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_PERCENT put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3JoyBatteryEvent >> reserved [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_RESERVED
]

{ #category : 'accessing - structure variables' }
SDL3JoyBatteryEvent >> reserved: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_RESERVED put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3JoyBatteryEvent >> state [
	"This method was automatically generated"
	^SDL3PowerState fromInteger: (handle signedLongAt: OFFSET_STATE)
]

{ #category : 'accessing - structure variables' }
SDL3JoyBatteryEvent >> state: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_STATE put: anObject value
]

{ #category : 'accessing - structure variables' }
SDL3JoyBatteryEvent >> timestamp [
	"This method was automatically generated"
	^handle unsignedLongLongAt: OFFSET_TIMESTAMP
]

{ #category : 'accessing - structure variables' }
SDL3JoyBatteryEvent >> timestamp: anObject [
	"This method was automatically generated"
	handle unsignedLongLongAt: OFFSET_TIMESTAMP put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3JoyBatteryEvent >> type [
	"This method was automatically generated"
	^SDL3EventType fromInteger: (handle unsignedLongAt: OFFSET_TYPE)
]

{ #category : 'accessing - structure variables' }
SDL3JoyBatteryEvent >> type: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_TYPE put: anObject value
]

{ #category : 'accessing - structure variables' }
SDL3JoyBatteryEvent >> which [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_WHICH
]

{ #category : 'accessing - structure variables' }
SDL3JoyBatteryEvent >> which: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_WHICH put: anObject
]
