"
I am a SDL3 FFI binding for `SDL_GPUSamplerAddressMode`.

Specifies behavior of texture sampling when the coordinates exceed the 0-1 range.

See: https://wiki.libsdl.org/SDL3/SDL_GPUSamplerAddressMode
"
Class {
	#name : 'SDL3GPUSamplerAddressMode',
	#superclass : 'SDL3Enumeration',
	#classVars : [
		'SDL_GPU_SAMPLERADDRESSMODE_CLAMP_TO_EDGE',
		'SDL_GPU_SAMPLERADDRESSMODE_MIRRORED_REPEAT',
		'SDL_GPU_SAMPLERADDRESSMODE_REPEAT'
	],
	#category : 'SDL3-Enumerations',
	#package : 'SDL3',
	#tag : 'Enumerations'
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
