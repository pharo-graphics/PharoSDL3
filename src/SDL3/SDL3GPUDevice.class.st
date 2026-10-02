"
I am a SDL3 FFI binding for `SDL_GPUDevice`.

An opaque handle representing the SDL_GPU context.

See: https://wiki.libsdl.org/SDL3/SDL_GPUDevice
"
Class {
	#name : 'SDL3GPUDevice',
	#superclass : 'SDL3BaseObject',
	#pools : [
		'SDL3GPUSampleCount',
		'SDL3GPUTextureFormat',
		'SDL3GPUTextureType'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}
