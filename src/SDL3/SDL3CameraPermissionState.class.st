Class {
	#name : 'SDL3CameraPermissionState',
	#superclass : 'SDL3Enumeration',
	#classVars : [
		'SDL_CAMERA_PERMISSION_STATE_APPROVED',
		'SDL_CAMERA_PERMISSION_STATE_DENIED',
		'SDL_CAMERA_PERMISSION_STATE_PENDING'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'accessing enum' }
SDL3CameraPermissionState class >> approved [
	"This method was automatically generated"
	^ SDL_CAMERA_PERMISSION_STATE_APPROVED
]

{ #category : 'accessing enum' }
SDL3CameraPermissionState class >> denied [
	"This method was automatically generated"
	^ SDL_CAMERA_PERMISSION_STATE_DENIED
]

{ #category : 'enum declaration' }
SDL3CameraPermissionState class >> enumDecl [

	^ #(
	SDL_CAMERA_PERMISSION_STATE_DENIED -1
	SDL_CAMERA_PERMISSION_STATE_PENDING 0
	SDL_CAMERA_PERMISSION_STATE_APPROVED 1 )
]

{ #category : 'accessing enum' }
SDL3CameraPermissionState class >> pending [
	"This method was automatically generated"
	^ SDL_CAMERA_PERMISSION_STATE_PENDING
]
