Class {
	#name : 'SDL3GPUTest',
	#superclass : 'SDL3Test',
	#instVars : [
		'window',
		'gpuDevice'
	],
	#category : 'SDL3-Tests-Library',
	#package : 'SDL3-Tests',
	#tag : 'Library'
}

{ #category : 'testing' }
SDL3GPUTest class >> isAbstract [

	^ self == SDL3GPUTest
]

{ #category : 'running' }
SDL3GPUTest >> setUp [

	super setUp.
	sdl := LibSDL3 uniqueInstance.
	sdl init: SDL_INIT_VIDEO.
	window := SDL3Window
		         unsafeNewTitle: 'GPU Test'
		         w: 640
		         h: 480
		         flags: 0.

	gpuDevice := SDL3GPUDevice
		            unsafeNewFormatFlags:
			            SDL_GPU_SHADERFORMAT_DXIL
			            | SDL_GPU_SHADERFORMAT_MSL
			            | SDL_GPU_SHADERFORMAT_SPIRV
		            debugMode: true
		            name: nil.

	gpuDevice claimWindow: window
]

{ #category : 'running' }
SDL3GPUTest >> tearDown [

	gpuDevice ifNotNil: [
		gpuDevice releaseWindow: window.
		gpuDevice destroy ].
	window ifNotNil: [ window destroy ].

	super tearDown
]
