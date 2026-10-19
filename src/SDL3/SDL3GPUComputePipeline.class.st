"
I am a SDL3 FFI binding for `SDL_GPUComputePipeline`.

An opaque handle representing a compute pipeline.

See: https://wiki.libsdl.org/SDL3/SDL_GPUComputePipeline
"
Class {
	#name : 'SDL3GPUComputePipeline',
	#superclass : 'SDL3GPUDeviceObject',
	#instVars : [
		'metadata'
	],
	#category : 'SDL3-GPU-Base',
	#package : 'SDL3',
	#tag : 'GPU-Base'
}

{ #category : 'accessing' }
SDL3GPUComputePipeline >> metadata [
	^ metadata
]

{ #category : 'accessing' }
SDL3GPUComputePipeline >> metadata: aMetadata [
	metadata := aMetadata
]

{ #category : 'releasing' }
SDL3GPUComputePipeline >> releaseFromGPUDevice [

	device ffiLibrary
		releaseGPUComputePipelineDevice: device
		computePipeline: self
]
