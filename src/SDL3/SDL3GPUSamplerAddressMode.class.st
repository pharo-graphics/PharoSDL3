Class {
	#name : 'SDL3GPUSamplerAddressMode',
	#superclass : 'SDL3Enumeration',
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
SDL3GPUSamplerAddressMode class >> clampToEdge [
	"This method was automatically generated"
	^ SDL_GPU_SAMPLERADDRESSMODE_CLAMP_TO_EDGE
]

{ #category : 'enum declaration' }
SDL3GPUSamplerAddressMode class >> enumDecl [

	^ #(
	SDL_GPU_SAMPLERADDRESSMODE_REPEAT 0
	SDL_GPU_SAMPLERADDRESSMODE_MIRRORED_REPEAT 1
	SDL_GPU_SAMPLERADDRESSMODE_CLAMP_TO_EDGE 2 )
]

{ #category : 'accessing enum' }
SDL3GPUSamplerAddressMode class >> mirroredRepeat [
	"This method was automatically generated"
	^ SDL_GPU_SAMPLERADDRESSMODE_MIRRORED_REPEAT
]

{ #category : 'accessing enum' }
SDL3GPUSamplerAddressMode class >> repeat [
	"This method was automatically generated"
	^ SDL_GPU_SAMPLERADDRESSMODE_REPEAT
]
