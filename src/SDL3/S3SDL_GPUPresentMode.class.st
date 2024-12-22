Class {
	#name : 'S3SDL_GPUPresentMode',
	#superclass : 'S3Enumeration',
	#classVars : [
		'SDL_GPU_PRESENTMODE_IMMEDIATE',
		'SDL_GPU_PRESENTMODE_MAILBOX',
		'SDL_GPU_PRESENTMODE_VSYNC'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'accessing enum' }
S3SDL_GPUPresentMode class >> SDL_GPU_PRESENTMODE_IMMEDIATE [
	"This method was automatically generated"
	^ SDL_GPU_PRESENTMODE_IMMEDIATE
]

{ #category : 'accessing enum' }
S3SDL_GPUPresentMode class >> SDL_GPU_PRESENTMODE_MAILBOX [
	"This method was automatically generated"
	^ SDL_GPU_PRESENTMODE_MAILBOX
]

{ #category : 'accessing enum' }
S3SDL_GPUPresentMode class >> SDL_GPU_PRESENTMODE_VSYNC [
	"This method was automatically generated"
	^ SDL_GPU_PRESENTMODE_VSYNC
]

{ #category : 'enum declaration' }
S3SDL_GPUPresentMode class >> enumDecl [

	^ #(
	SDL_GPU_PRESENTMODE_VSYNC 0
	SDL_GPU_PRESENTMODE_IMMEDIATE 1
	SDL_GPU_PRESENTMODE_MAILBOX 2 )
]
