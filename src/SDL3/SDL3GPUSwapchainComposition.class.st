"
I am a SDL3 FFI binding for `SDL_GPUSwapchainComposition`.

Specifies the texture format and colorspace of the swapchain textures.

See: https://wiki.libsdl.org/SDL3/SDL_GPUSwapchainComposition
"
Class {
	#name : 'SDL3GPUSwapchainComposition',
	#superclass : 'SDL3Enumeration',
	#classVars : [
		'SDL_GPU_SWAPCHAINCOMPOSITION_HDR10_ST2084',
		'SDL_GPU_SWAPCHAINCOMPOSITION_HDR_EXTENDED_LINEAR',
		'SDL_GPU_SWAPCHAINCOMPOSITION_SDR',
		'SDL_GPU_SWAPCHAINCOMPOSITION_SDR_LINEAR'
	],
	#category : 'SDL3-Enumerations',
	#package : 'SDL3',
	#tag : 'Enumerations'
}

{ #category : 'enum declaration' }
SDL3GPUSwapchainComposition class >> enumDecl [

	^ #(
	SDL_GPU_SWAPCHAINCOMPOSITION_SDR 0
	SDL_GPU_SWAPCHAINCOMPOSITION_SDR_LINEAR 1
	SDL_GPU_SWAPCHAINCOMPOSITION_HDR_EXTENDED_LINEAR 2
	SDL_GPU_SWAPCHAINCOMPOSITION_HDR10_ST2084 3 )
]

{ #category : 'accessing enum' }
SDL3GPUSwapchainComposition class >> hdr10St2084 [
	"This method was automatically generated"
	^ SDL_GPU_SWAPCHAINCOMPOSITION_HDR10_ST2084
]

{ #category : 'accessing enum' }
SDL3GPUSwapchainComposition class >> hdrExtendedLinear [
	"This method was automatically generated"
	^ SDL_GPU_SWAPCHAINCOMPOSITION_HDR_EXTENDED_LINEAR
]

{ #category : 'accessing enum' }
SDL3GPUSwapchainComposition class >> sdr [
	"This method was automatically generated"
	^ SDL_GPU_SWAPCHAINCOMPOSITION_SDR
]

{ #category : 'accessing enum' }
SDL3GPUSwapchainComposition class >> sdrLinear [
	"This method was automatically generated"
	^ SDL_GPU_SWAPCHAINCOMPOSITION_SDR_LINEAR
]
