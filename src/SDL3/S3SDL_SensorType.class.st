Class {
	#name : 'S3SDL_SensorType',
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
S3SDL_SensorType class >> SDL_SENSOR_ACCEL [
	"This method was automatically generated"
	^ SDL_SENSOR_ACCEL
]

{ #category : 'accessing enum' }
S3SDL_SensorType class >> SDL_SENSOR_ACCEL_L [
	"This method was automatically generated"
	^ SDL_SENSOR_ACCEL_L
]

{ #category : 'accessing enum' }
S3SDL_SensorType class >> SDL_SENSOR_ACCEL_R [
	"This method was automatically generated"
	^ SDL_SENSOR_ACCEL_R
]

{ #category : 'accessing enum' }
S3SDL_SensorType class >> SDL_SENSOR_GYRO [
	"This method was automatically generated"
	^ SDL_SENSOR_GYRO
]

{ #category : 'accessing enum' }
S3SDL_SensorType class >> SDL_SENSOR_GYRO_L [
	"This method was automatically generated"
	^ SDL_SENSOR_GYRO_L
]

{ #category : 'accessing enum' }
S3SDL_SensorType class >> SDL_SENSOR_GYRO_R [
	"This method was automatically generated"
	^ SDL_SENSOR_GYRO_R
]

{ #category : 'accessing enum' }
S3SDL_SensorType class >> SDL_SENSOR_INVALID [
	"This method was automatically generated"
	^ SDL_SENSOR_INVALID
]

{ #category : 'accessing enum' }
S3SDL_SensorType class >> SDL_SENSOR_UNKNOWN [
	"This method was automatically generated"
	^ SDL_SENSOR_UNKNOWN
]

{ #category : 'enum declaration' }
S3SDL_SensorType class >> enumDecl [

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
