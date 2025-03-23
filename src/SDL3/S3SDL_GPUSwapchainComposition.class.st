Class {
	#name : 'S3SDL_GPUSwapchainComposition',
	#superclass : 'S3Enumeration',
	#classVars : [
		'SDL_GPU_SWAPCHAINCOMPOSITION_HDR10_ST2084',
		'SDL_GPU_SWAPCHAINCOMPOSITION_HDR_EXTENDED_LINEAR',
		'SDL_GPU_SWAPCHAINCOMPOSITION_SDR',
		'SDL_GPU_SWAPCHAINCOMPOSITION_SDR_LINEAR'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'accessing enum' }
S3SDL_GPUSwapchainComposition class >> SDL_GPU_SWAPCHAINCOMPOSITION_HDR10_ST2048 [
	"This method was automatically generated"
	^ SDL_GPU_SWAPCHAINCOMPOSITION_HDR10_ST2048
]

{ #category : 'accessing enum' }
S3SDL_GPUSwapchainComposition class >> SDL_GPU_SWAPCHAINCOMPOSITION_HDR_EXTENDED_LINEAR [
	"This method was automatically generated"
	^ SDL_GPU_SWAPCHAINCOMPOSITION_HDR_EXTENDED_LINEAR
]

{ #category : 'accessing enum' }
S3SDL_GPUSwapchainComposition class >> SDL_GPU_SWAPCHAINCOMPOSITION_SDR [
	"This method was automatically generated"
	^ SDL_GPU_SWAPCHAINCOMPOSITION_SDR
]

{ #category : 'accessing enum' }
S3SDL_GPUSwapchainComposition class >> SDL_GPU_SWAPCHAINCOMPOSITION_SDR_LINEAR [
	"This method was automatically generated"
	^ SDL_GPU_SWAPCHAINCOMPOSITION_SDR_LINEAR
]

{ #category : 'enum declaration' }
S3SDL_GPUSwapchainComposition class >> enumDecl [

	^ #(
	SDL_GPU_SWAPCHAINCOMPOSITION_SDR 0
	SDL_GPU_SWAPCHAINCOMPOSITION_SDR_LINEAR 1
	SDL_GPU_SWAPCHAINCOMPOSITION_HDR_EXTENDED_LINEAR 2
	SDL_GPU_SWAPCHAINCOMPOSITION_HDR10_ST2084 3 )
]
