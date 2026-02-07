Class {
	#name : 'SDL3SensorEvent',
	#superclass : 'SDL3MappedEvent',
	#classVars : [
		'OFFSET_DATA',
		'OFFSET_RESERVED',
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
SDL3SensorEvent class >> fieldsDesc [

	^ #(
	SDL_EventType type;
	Uint32 reserved;
	Uint64 timestamp;
	SDL_SensorID which;
	float_6 data;
	Uint64 sensor_timestamp
	)
]

{ #category : 'accessing - structure variables' }
SDL3SensorEvent >> data [
	"This method was automatically generated"
	^(FFIArray ofType: #FFIFloat32 size: 6) fromHandle: (handle copyFrom: OFFSET_DATA to: OFFSET_DATA + 23)
]

{ #category : 'accessing - structure variables' }
SDL3SensorEvent >> sensorTimestamp [
	"This method was automatically generated"
	^handle unsignedLongLongAt: OFFSET_SENSOR_TIMESTAMP
]

{ #category : 'accessing - structure variables' }
SDL3SensorEvent >> timestamp [
	"This method was automatically generated"
	^handle unsignedLongLongAt: OFFSET_TIMESTAMP
]

{ #category : 'accessing - structure variables' }
SDL3SensorEvent >> which [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_WHICH
]
