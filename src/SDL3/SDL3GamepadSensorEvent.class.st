Class {
	#name : 'SDL3GamepadSensorEvent',
	#superclass : 'SDL3MappedEvent',
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
SDL3GamepadSensorEvent class >> fieldsDesc [

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
SDL3GamepadSensorEvent >> data [
	"This method was automatically generated"
	^(FFIArray ofType: #FFIFloat32 size: 3) fromHandle: (handle copyFrom: OFFSET_DATA to: OFFSET_DATA + 11)
]

{ #category : 'accessing - structure variables' }
SDL3GamepadSensorEvent >> reserved [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_RESERVED
]

{ #category : 'accessing - structure variables' }
SDL3GamepadSensorEvent >> sensor [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_SENSOR
]

{ #category : 'accessing - structure variables' }
SDL3GamepadSensorEvent >> sensorTimestamp [
	"This method was automatically generated"
	^handle unsignedLongLongAt: OFFSET_SENSOR_TIMESTAMP
]

{ #category : 'accessing - structure variables' }
SDL3GamepadSensorEvent >> timestamp [
	"This method was automatically generated"
	^handle unsignedLongLongAt: OFFSET_TIMESTAMP
]

{ #category : 'accessing - structure variables' }
SDL3GamepadSensorEvent >> which [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_WHICH
]
