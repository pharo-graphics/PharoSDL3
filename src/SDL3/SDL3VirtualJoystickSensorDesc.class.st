Class {
	#name : 'SDL3VirtualJoystickSensorDesc',
	#superclass : 'S3Structure',
	#classVars : [
		'OFFSET_RATE',
		'OFFSET_TYPE'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'field definition' }
SDL3VirtualJoystickSensorDesc class >> fieldsDesc [

	^ #(
	SDL_SensorType type;
	float rate
	)
]

{ #category : 'accessing - structure variables' }
SDL3VirtualJoystickSensorDesc >> rate [
	"This method was automatically generated"
	^handle floatAt: OFFSET_RATE
]

{ #category : 'accessing - structure variables' }
SDL3VirtualJoystickSensorDesc >> rate: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_RATE put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3VirtualJoystickSensorDesc >> type [
	"This method was automatically generated"
	^SDL3SensorType fromInteger: (handle signedLongAt: OFFSET_TYPE)
]

{ #category : 'accessing - structure variables' }
SDL3VirtualJoystickSensorDesc >> type: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_TYPE put: anObject value
]
