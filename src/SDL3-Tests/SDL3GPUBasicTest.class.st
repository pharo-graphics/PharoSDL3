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

	sdl init: SDL_INIT_VIDEO.
	window := sdl
		newWindowTitle: 'GPU Test'
		w: 640
		h: 480
		flags: 0.
	window assertNotNullReturn.
	
	gpuDevice := sdl 
		newGPUDeviceFormatFlags:
			SDL_GPU_SHADERFORMAT_DXIL | SDL_GPU_SHADERFORMAT_MSL | SDL_GPU_SHADERFORMAT_SPIRV
		debugMode: true name: nil.
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
	commandBuffer assertNotNullReturn.
	commandBuffer cancel
]

{ #category : 'tests' }
SDL3GPUBasicTest >> test02AcquireSwapchainTextureAndSubmitEmpty [

	| commandBuffer textureHolder success |
	commandBuffer := gpuDevice acquireGPUCommandBuffer.
	commandBuffer assertNotNullReturn.

	textureHolder := (FFIExternalValueHolder ofType: SDL_GPUTexture) new.
	
	success := commandBuffer
		waitAndAcquireGPUSwapchainTextureForWindow: window
		into: textureHolder
		width: nil
		height: nil.
		
	self assert: success.
	self deny: textureHolder value isNull.

	sdl assertSuccess: commandBuffer submit
]

{ #category : 'tests' }
SDL3GPUBasicTest >> test03ClearColorInRenderPass [

	| commandBuffer textureHolder success colorTargetInfo renderPass |
	commandBuffer := gpuDevice acquireGPUCommandBuffer.
	commandBuffer assertNotNullReturn.

	textureHolder := (FFIExternalValueHolder ofType: SDL_GPUTexture) new.
	
	success := commandBuffer
		waitAndAcquireGPUSwapchainTextureForWindow: window
		into: textureHolder
		width: nil
		height: nil.
	
	self assert: success.
	self deny: textureHolder value isNull.
	
	colorTargetInfo := SDL_GPUColorTargetInfo new.
	colorTargetInfo
		texture: textureHolder value;
		storeOp: SDL_GPUStoreOp store;
		loadOp: SDL_GPULoadOp clear.
	colorTargetInfo clearColor updateFrom: Color yellow.

	renderPass := commandBuffer
		beginGPURenderPassColorTargetInfos: colorTargetInfo
		numColorTargets: 1
		depthStencilTargetInfo: nil.
	renderPass assertNotNullReturn.
	renderPass end.
	
	sdl assertSuccess: commandBuffer submit
]
