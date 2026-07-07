"
I am a SDL3 FFI binding for `SDL_GPUComputePass`.

An opaque handle representing a compute pass.

See: https://wiki.libsdl.org/SDL3/SDL_GPUComputePass
"
Class {
	#name : 'SDL3GPUComputePass',
	#superclass : 'SDL3GPUDeviceObject',
	#instVars : [
		'pipeline'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'accessing' }
SDL3GPUComputePass >> pipeline [
	^ pipeline
]

{ #category : 'accessing' }
SDL3GPUComputePass >> pipeline: computePipeline [

	self ffiLibrary
		bindGPUComputePipelineComputePass: self
		computePipeline: computePipeline.
	pipeline := computePipeline
]
