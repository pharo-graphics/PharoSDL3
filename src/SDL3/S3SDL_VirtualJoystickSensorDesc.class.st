Class {
	#name : 'S3SDL_VirtualJoystickSensorDesc',
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
S3SDL_VirtualJoystickSensorDesc class >> fieldsDesc [

	^ #(
	SDL_SensorType type;
	float rate
	)
]

{ #category : 'accessing - structure variables' }
S3SDL_VirtualJoystickSensorDesc >> rate [
	"This method was automatically generated"
	^handle floatAt: OFFSET_RATE
]

{ #category : 'accessing - structure variables' }
S3SDL_VirtualJoystickSensorDesc >> rate: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_RATE put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_VirtualJoystickSensorDesc >> type [
	"This method was automatically generated"
	^S3SDL_SensorType fromInteger: (handle signedLongAt: OFFSET_TYPE)
]

{ #category : 'accessing - structure variables' }
S3SDL_VirtualJoystickSensorDesc >> type: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_TYPE put: anObject value
]
