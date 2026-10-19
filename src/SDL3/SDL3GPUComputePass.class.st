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
	#category : 'SDL3-GPU-Base',
	#package : 'SDL3',
	#tag : 'GPU-Base'
}

{ #category : 'binding' }
SDL3GPUComputePass >> computeSamplers: textureSamplerBindings slot: firstSlot [

	^ self
		 computeSamplersSlot: firstSlot
		 bindings: (textureSamplerBindings ifEmpty: [ ExternalAddress null ])
		 count: textureSamplerBindings size
]

{ #category : 'binding' }
SDL3GPUComputePass >> computeSamplersSlot: firstSlot bindings: textureSamplerBindings count: numBindings [

	self ffiLibrary
		bindGPUComputeSamplersComputePass: self
		firstSlot: firstSlot
		textureSamplerBindings: textureSamplerBindings
		numBindings: numBindings
]

{ #category : 'binding' }
SDL3GPUComputePass >> computeStorageBuffers: storageBuffers slot: firstSlot [

	^ self
		 computeStorageBuffersSlot: firstSlot
		 bindings: (storageBuffers ifEmpty: [ ExternalAddress null ])
		 count: storageBuffers size
]

{ #category : 'binding' }
SDL3GPUComputePass >> computeStorageBuffersSlot: firstSlot bindings: storageBuffers count: numBindings [

	self ffiLibrary
		bindGPUComputeStorageBuffersComputePass: self
		firstSlot: firstSlot
		storageBuffers: storageBuffers
		numBindings: numBindings
]

{ #category : 'binding' }
SDL3GPUComputePass >> computeStorageTextures: storageTextures slot: firstSlot [

	^ self
		 computeStorageTexturesSlot: firstSlot
		 bindings: (storageTextures ifEmpty: [ ExternalAddress null ])
		 count: storageTextures size
]

{ #category : 'binding' }
SDL3GPUComputePass >> computeStorageTexturesSlot: firstSlot bindings: storageTextures count: numBindings [

	self ffiLibrary
		bindGPUComputeStorageTexturesComputePass: self
		firstSlot: firstSlot
		storageTextures: storageTextures
		numBindings: numBindings
]

{ #category : 'dispatching' }
SDL3GPUComputePass >> dispatchIndirectBuffer: buffer offset: offset [

	self ffiLibrary
		dispatchGPUComputeIndirectComputePass: self
		buffer: buffer
		offset: offset
]

{ #category : 'dispatching' }
SDL3GPUComputePass >> dispatchX: x [

	self dispatchX: x y: 1 z: 1
]

{ #category : 'dispatching' }
SDL3GPUComputePass >> dispatchX: x y: y z: z [

	| m |
	m := self pipeline metadata.
	self ffiLibrary
		dispatchGPUComputeComputePass: self
		groupcountX: (x + m threadCountX - 1 // m threadCountX)
		groupcountY: (y + m threadCountY - 1 // m threadCountY)
		groupcountZ: (z + m threadCountZ - 1 // m threadCountZ)
]

{ #category : 'operations' }
SDL3GPUComputePass >> end [

	self ffiLibrary endGPUComputePass: self
]

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

{ #category : 'releasing' }
SDL3GPUComputePass >> releaseFromGPUDevice [
	"Passes are released when they are ended."

	self end
]
