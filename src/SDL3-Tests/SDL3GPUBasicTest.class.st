"
I am a base test for the SDL3 GPU API.
"
Class {
	#name : 'SDL3GPUBasicTest',
	#superclass : 'SDL3Test',
	#instVars : [
		'window',
		'gpuDevice'
	],
	#category : 'SDL3-Tests-Library',
	#package : 'SDL3-Tests',
	#tag : 'Library'
}

{ #category : 'running' }
SDL3GPUBasicTest >> setUp [

	super setUp.
	sdl := LibSDL3 uniqueInstance.
	sdl init: SDL_INIT_VIDEO.
	window := sdl
		         newWindowTitle: 'GPU Test'
		         w: 640
		         h: 480
		         flags: 0.
	window assertNotNullReturn.

	gpuDevice := sdl
		            newGPUDeviceFormatFlags:
			            SDL_GPU_SHADERFORMAT_DXIL
			            | SDL_GPU_SHADERFORMAT_MSL
			            | SDL_GPU_SHADERFORMAT_SPIRV
		            debugMode: true
		            name: nil.
	gpuDevice assertNotNullReturn.

	gpuDevice claimWindow: window
]

{ #category : 'running' }
SDL3GPUBasicTest >> tearDown [

	gpuDevice ifNotNil: [
		gpuDevice releaseWindow: window.
		gpuDevice destroy ].
	window ifNotNil: [ window destroy ].

	super tearDown
]

{ #category : 'tests' }
SDL3GPUBasicTest >> test01AcquireAndCancelCommandBuffer [

	| commandBuffer |
	commandBuffer := gpuDevice acquireGPUCommandBuffer.
	commandBuffer cancel
]

{ #category : 'tests' }
SDL3GPUBasicTest >> test02AcquireSwapchainTextureAndSubmitEmpty [

	| commandBuffer textureHolder |
	commandBuffer := gpuDevice acquireGPUCommandBuffer.

	textureHolder := (FFIExternalValueHolder ofType: SDL_GPUTexture) new.
	
	commandBuffer
		waitAndAcquireGPUSwapchainTextureForWindow: window
		into: textureHolder
		width: nil
		height: nil.
		
	self deny: textureHolder value isNull.

	commandBuffer submit
]

{ #category : 'tests' }
SDL3GPUBasicTest >> test03ClearColorInRenderPass [

	| commandBuffer textureHolder renderPass colorTargetInfos |
	commandBuffer := gpuDevice acquireGPUCommandBuffer.

	textureHolder := (FFIExternalValueHolder ofType: SDL_GPUTexture) new.
	
	commandBuffer
		waitAndAcquireGPUSwapchainTextureForWindow: window
		into: textureHolder
		width: nil
		height: nil.
	
	self deny: textureHolder value isNull.
	
	colorTargetInfos := FFIExternalArray externalNewType: SDL_GPUColorTargetInfo size: 1.
	colorTargetInfos autoRelease.
	colorTargetInfos first
		texture: textureHolder value;
		storeOp: SDL_GPU_STOREOP_STORE;
		loadOp: SDL_GPU_LOADOP_CLEAR;
		updateClearColorFrom: Color yellow.

	renderPass := commandBuffer
		beginGPURenderPassColorTargetInfos: colorTargetInfos
		depthStencilTargetInfo: nil.
		renderPass end.

	commandBuffer submit

]
