Class {
	#name : 'SDL3KeyboardDeviceEvent',
	#superclass : 'SDL3MappedEvent',
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
SDL3KeyboardDeviceEvent class >> fieldsDesc [

	^ #(
	SDL_EventType type;
	Uint32 reserved;
	Uint64 timestamp;
	SDL_KeyboardID which
	)
]

{ #category : 'accessing - structure variables' }
SDL3KeyboardDeviceEvent >> reserved [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_RESERVED
]

{ #category : 'accessing - structure variables' }
SDL3KeyboardDeviceEvent >> reserved: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_RESERVED put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3KeyboardDeviceEvent >> timestamp [
	"This method was automatically generated"
	^handle unsignedLongLongAt: OFFSET_TIMESTAMP
]

{ #category : 'accessing - structure variables' }
SDL3KeyboardDeviceEvent >> timestamp: anObject [
	"This method was automatically generated"
	handle unsignedLongLongAt: OFFSET_TIMESTAMP put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3KeyboardDeviceEvent >> type [
	"This method was automatically generated"
	^SDL3EventType fromInteger: (handle unsignedLongAt: OFFSET_TYPE)
]

{ #category : 'accessing - structure variables' }
SDL3KeyboardDeviceEvent >> type: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_TYPE put: anObject value
]

{ #category : 'accessing - structure variables' }
SDL3KeyboardDeviceEvent >> which [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_WHICH
]

{ #category : 'accessing - structure variables' }
SDL3KeyboardDeviceEvent >> which: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_WHICH put: anObject
]
