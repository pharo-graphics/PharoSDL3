Class {
	#name : 'S3SDL_GPUSamplerAddressMode',
	#superclass : 'S3Enumeration',
	#classVars : [
		'SDL_GPU_SAMPLERADDRESSMODE_CLAMP_TO_EDGE',
		'SDL_GPU_SAMPLERADDRESSMODE_MIRRORED_REPEAT',
		'SDL_GPU_SAMPLERADDRESSMODE_REPEAT'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'accessing enum' }
S3SDL_GPUSamplerAddressMode class >> SDL_GPU_SAMPLERADDRESSMODE_CLAMP_TO_EDGE [
	"This method was automatically generated"
	^ SDL_GPU_SAMPLERADDRESSMODE_CLAMP_TO_EDGE
]

{ #category : 'accessing enum' }
S3SDL_GPUSamplerAddressMode class >> SDL_GPU_SAMPLERADDRESSMODE_MIRRORED_REPEAT [
	"This method was automatically generated"
	^ SDL_GPU_SAMPLERADDRESSMODE_MIRRORED_REPEAT
]

{ #category : 'accessing enum' }
S3SDL_GPUSamplerAddressMode class >> SDL_GPU_SAMPLERADDRESSMODE_REPEAT [
	"This method was automatically generated"
	^ SDL_GPU_SAMPLERADDRESSMODE_REPEAT
]

{ #category : 'enum declaration' }
S3SDL_GPUSamplerAddressMode class >> enumDecl [

	^ #(
	SDL_GPU_SAMPLERADDRESSMODE_REPEAT 0
	SDL_GPU_SAMPLERADDRESSMODE_MIRRORED_REPEAT 1
	SDL_GPU_SAMPLERADDRESSMODE_CLAMP_TO_EDGE 2 )
]
