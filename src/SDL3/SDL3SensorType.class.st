Class {
	#name : 'SDL3SensorType',
	#superclass : 'S3Enumeration',
	#classVars : [
		'SDL_SENSOR_ACCEL',
		'SDL_SENSOR_ACCEL_L',
		'SDL_SENSOR_ACCEL_R',
		'SDL_SENSOR_GYRO',
		'SDL_SENSOR_GYRO_L',
		'SDL_SENSOR_GYRO_R',
		'SDL_SENSOR_INVALID',
		'SDL_SENSOR_UNKNOWN'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'accessing enum' }
SDL3SensorType class >> accel [
	"This method was automatically generated"
	^ SDL_SENSOR_ACCEL
]

{ #category : 'accessing enum' }
SDL3SensorType class >> accelL [
	"This method was automatically generated"
	^ SDL_SENSOR_ACCEL_L
]

{ #category : 'accessing enum' }
SDL3SensorType class >> accelR [
	"This method was automatically generated"
	^ SDL_SENSOR_ACCEL_R
]

{ #category : 'enum declaration' }
SDL3SensorType class >> enumDecl [

	^ #(
	SDL_SENSOR_INVALID -1
	SDL_SENSOR_UNKNOWN 0
	SDL_SENSOR_ACCEL 1
	SDL_SENSOR_GYRO 2
	SDL_SENSOR_ACCEL_L 3
	SDL_SENSOR_GYRO_L 4
	SDL_SENSOR_ACCEL_R 5
	SDL_SENSOR_GYRO_R 6 )
]

{ #category : 'accessing enum' }
SDL3SensorType class >> gyro [
	"This method was automatically generated"
	^ SDL_SENSOR_GYRO
]

{ #category : 'accessing enum' }
SDL3SensorType class >> gyroL [
	"This method was automatically generated"
	^ SDL_SENSOR_GYRO_L
]

{ #category : 'accessing enum' }
SDL3SensorType class >> gyroR [
	"This method was automatically generated"
	^ SDL_SENSOR_GYRO_R
]

{ #category : 'accessing enum' }
SDL3SensorType class >> invalid [
	"This method was automatically generated"
	^ SDL_SENSOR_INVALID
]

{ #category : 'accessing enum' }
SDL3SensorType class >> unknown [
	"This method was automatically generated"
	^ SDL_SENSOR_UNKNOWN
]
