Class {
	#name : 'S3SDL_SensorEvent',
	#superclass : 'S3Structure',
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
S3SDL_SensorEvent class >> fieldsDesc [

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
S3SDL_SensorEvent >> data [
	"This method was automatically generated"
	^(FFITypeArray ofType: #FFIFloat32 size: 6) fromHandle: (handle copyFrom: OFFSET_DATA to: OFFSET_DATA + 23)
]

{ #category : 'accessing - structure variables' }
S3SDL_SensorEvent >> data: anObject [
	"This method was automatically generated"
	handle replaceFrom: OFFSET_DATA to: OFFSET_DATA + 23 with: anObject getHandle startingAt: 1
]

{ #category : 'accessing - structure variables' }
S3SDL_SensorEvent >> reserved [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_RESERVED
]

{ #category : 'accessing - structure variables' }
S3SDL_SensorEvent >> reserved: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_RESERVED put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_SensorEvent >> sensor_timestamp [
	"This method was automatically generated"
	^handle unsignedLongLongAt: OFFSET_SENSOR_TIMESTAMP
]

{ #category : 'accessing - structure variables' }
S3SDL_SensorEvent >> sensor_timestamp: anObject [
	"This method was automatically generated"
	handle unsignedLongLongAt: OFFSET_SENSOR_TIMESTAMP put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_SensorEvent >> timestamp [
	"This method was automatically generated"
	^handle unsignedLongLongAt: OFFSET_TIMESTAMP
]

{ #category : 'accessing - structure variables' }
S3SDL_SensorEvent >> timestamp: anObject [
	"This method was automatically generated"
	handle unsignedLongLongAt: OFFSET_TIMESTAMP put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_SensorEvent >> type [
	"This method was automatically generated"
	^S3SDL_EventType fromInteger: (handle unsignedLongAt: OFFSET_TYPE)
]

{ #category : 'accessing - structure variables' }
S3SDL_SensorEvent >> type: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_TYPE put: anObject value
]

{ #category : 'accessing - structure variables' }
S3SDL_SensorEvent >> which [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_WHICH
]

{ #category : 'accessing - structure variables' }
S3SDL_SensorEvent >> which: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_WHICH put: anObject
]
