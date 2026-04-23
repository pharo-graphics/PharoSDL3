"
I am a base test for the SDL3 GPU API.
"
Class {
	#name : 'SDL3GPUBaseTest',
	#superclass : 'SDL3Test',
	#instVars : [
		'window',
		'gpuDevice'
	],
	#pools : [
		'SDL3GPUTextureUsageFlags',
		'SDL3InitConstants'
	],
	#category : 'SDL3-Tests-OSWindow',
	#package : 'SDL3-Tests',
	#tag : 'OSWindow'
}

{ #category : 'running' }
SDL3GPUBaseTest >> setUp [
	super setUp.
	sdl init: SDL_INIT_VIDEO.
	window := sdl
		newWindowTitle: 'GPU Test'
		w: 640
		h: 480
		flags: 0.
	window assertNotNullReturn.
	
	gpuDevice := sdl 
		newGPUDeviceFormatFlags: (SDL3GPUShaderFormat dxil | SDL3GPUShaderFormat msl | SDL3GPUShaderFormat spirv) 
		debugMode: true 
		name: nil.
	gpuDevice assertNotNullReturn.
	
	gpuDevice claimWindow: window.
]

{ #category : 'running' }
SDL3GPUBaseTest >> tearDown [
	gpuDevice ifNotNil: [ gpuDevice releaseWindow: window. gpuDevice destroy ].
	window ifNotNil: [ window destroy ].
	super tearDown.
]

{ #category : 'tests' }
SDL3GPUBaseTest >> testAcquireCommandBuffer [
	| commandBuffer |
	commandBuffer := gpuDevice acquireGPUCommandBuffer.
	self assert: commandBuffer isNull not.
	commandBuffer cancel.
]

{ #category : 'tests' }
SDL3GPUBaseTest >> testAcquireSwapchainTexture [
	| commandBuffer textureHolder success |
	commandBuffer := gpuDevice acquireGPUCommandBuffer.
	textureHolder := (FFIExternalValueHolder ofType: SDL3GPUTexture) new.
	
	success := commandBuffer
		waitAndAcquireGPUSwapchainTextureForWindow: window
		into: textureHolder
		width: nil
		height: nil.
		
	self assert: success.
	self assert: textureHolder value isNull not.
	
	commandBuffer submit.
]

{ #category : 'tests' }
SDL3GPUBaseTest >> testClearMultipleRects [
	| commandBuffer textureHolder success colorTargetInfo renderPass rects |
	commandBuffer := gpuDevice acquireGPUCommandBuffer.
	textureHolder := (FFIExternalValueHolder ofType: SDL3GPUTexture) new.
	
	success := commandBuffer
		waitAndAcquireGPUSwapchainTextureForWindow: window
		into: textureHolder
		width: nil
		height: nil.
	
	self assert: success.
	
	rects := { 
		0@0 extent: 100@100.
		200@200 extent: 50@50.
		400@100 extent: 100@200
	}.

	rects do: [ :rect |
		colorTargetInfo := SDL3GPUColorTargetInfo new.
		colorTargetInfo
			texture: textureHolder value;
			storeOp: SDL3GPUStoreOp store;
			loadOp: SDL3GPULoadOp clear.
		"Using different colors for each rect"
		colorTargetInfo clearColor updateFrom: Color random.

		renderPass := commandBuffer
			beginGPURenderPassColorTargetInfos: colorTargetInfo
			numColorTargets: 1
			depthStencilTargetInfo: nil.
		renderPass assertNotNullReturn.
		renderPass end.
	].
	
	commandBuffer submit.
]

{ #category : 'tests' }
SDL3GPUBaseTest >> testClearScreen [
	| commandBuffer textureHolder success colorTargetInfo renderPass |
	commandBuffer := gpuDevice acquireGPUCommandBuffer.
	textureHolder := (FFIExternalValueHolder ofType: SDL3GPUTexture) new.
	
	success := commandBuffer
		waitAndAcquireGPUSwapchainTextureForWindow: window
		into: textureHolder
		width: nil
		height: nil.
	
	self assert: success.
	
	colorTargetInfo := SDL3GPUColorTargetInfo new.
	colorTargetInfo
		texture: textureHolder value;
		storeOp: SDL3GPUStoreOp store;
		loadOp: SDL3GPULoadOp clear.
	colorTargetInfo clearColor updateFrom: Color red.

	renderPass := commandBuffer
		beginGPURenderPassColorTargetInfos: colorTargetInfo
		numColorTargets: 1
		depthStencilTargetInfo: nil.
	renderPass assertNotNullReturn.
	renderPass end.
	
	commandBuffer submit.
]

{ #category : 'tests' }
SDL3GPUBaseTest >> testCreateGPUDevice [
	self assert: gpuDevice isNull not
]

{ #category : 'tests' }
SDL3GPUBaseTest >> testUploadFromForm [
	| form transferBuffer |
	form := Form extent: 32 @ 32 depth: 32.
	form fillColor: Color blue.
	
	transferBuffer := gpuDevice newUploadTransferBuffer: (form width * 4 * form height).
	transferBuffer assertNotNullReturn.
	
	[ 
		transferBuffer updateFromForm: form device: gpuDevice.
	] ensure: [ 
		gpuDevice releaseGPUTransferBuffer: transferBuffer 
	]
]
