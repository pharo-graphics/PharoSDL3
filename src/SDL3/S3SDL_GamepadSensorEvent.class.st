Class {
	#name : 'S3SDL_GamepadSensorEvent',
	#superclass : 'S3Structure',
	#classVars : [
		'OFFSET_DATA',
		'OFFSET_RESERVED',
		'OFFSET_SENSOR',
		'OFFSET_SENSOR_TIMESTAMP',
		'OFFSET_TIMESTAMP',
		'OFFSET_TYPE',
		'OFFSET_WHICH'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'field definition' }
S3SDL_GamepadSensorEvent class >> fieldsDesc [

	^ #(
	SDL_EventType type;
	Uint32 reserved;
	Uint64 timestamp;
	SDL_JoystickID which;
	Sint32 sensor;
	float_3 data;
	Uint64 sensor_timestamp
	)
]

{ #category : 'accessing - structure variables' }
S3SDL_GamepadSensorEvent >> data [
	"This method was automatically generated"
	^(FFITypeArray ofType: #FFIFloat32 size: 3) fromHandle: (handle copyFrom: OFFSET_DATA to: OFFSET_DATA + 11)
]

{ #category : 'accessing - structure variables' }
S3SDL_GamepadSensorEvent >> data: anObject [
	"This method was automatically generated"
	handle replaceFrom: OFFSET_DATA to: OFFSET_DATA + 11 with: anObject getHandle startingAt: 1
]

{ #category : 'accessing - structure variables' }
S3SDL_GamepadSensorEvent >> reserved [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_RESERVED
]

{ #category : 'accessing - structure variables' }
S3SDL_GamepadSensorEvent >> reserved: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_RESERVED put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_GamepadSensorEvent >> sensor [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_SENSOR
]

{ #category : 'accessing - structure variables' }
S3SDL_GamepadSensorEvent >> sensor: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_SENSOR put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_GamepadSensorEvent >> sensor_timestamp [
	"This method was automatically generated"
	^handle unsignedLongLongAt: OFFSET_SENSOR_TIMESTAMP
]

{ #category : 'accessing - structure variables' }
S3SDL_GamepadSensorEvent >> sensor_timestamp: anObject [
	"This method was automatically generated"
	handle unsignedLongLongAt: OFFSET_SENSOR_TIMESTAMP put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_GamepadSensorEvent >> timestamp [
	"This method was automatically generated"
	^handle unsignedLongLongAt: OFFSET_TIMESTAMP
]

{ #category : 'accessing - structure variables' }
S3SDL_GamepadSensorEvent >> timestamp: anObject [
	"This method was automatically generated"
	handle unsignedLongLongAt: OFFSET_TIMESTAMP put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_GamepadSensorEvent >> type [
	"This method was automatically generated"
	^S3SDL_EventType fromInteger: (handle unsignedLongAt: OFFSET_TYPE)
]

{ #category : 'accessing - structure variables' }
S3SDL_GamepadSensorEvent >> type: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_TYPE put: anObject value
]

{ #category : 'accessing - structure variables' }
S3SDL_GamepadSensorEvent >> which [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_WHICH
]

{ #category : 'accessing - structure variables' }
S3SDL_GamepadSensorEvent >> which: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_WHICH put: anObject
]
