Extension { #name : 'SDL3GPUCommandBuffer' }

{ #category : '*SDL3-Own' }
SDL3GPUCommandBuffer >> beginGPUComputePassStorageTextureBindings: storageTextureBindings storageBufferBindings: storageBufferBindings [

	^ self
		 beginGPUComputePassStorageTextureBindings: (storageTextureBindings ifEmpty: [ ExternalAddress null ])
		 numStorageTextureBindings: storageTextureBindings size
		 storageBufferBindings: (storageBufferBindings ifEmpty: [ ExternalAddress null ])
		 numStorageBufferBindings: storageBufferBindings size
]

{ #category : '*SDL3-Own' }
SDL3GPUCommandBuffer >> beginGPURenderPassColorTargetInfos: colorTargetInfos depthStencilTargetInfo: depthStencilTargetInfo [

	^ self
		 beginGPURenderPassColorTargetInfos: (colorTargetInfos ifEmpty: [ ExternalAddress null ])
		 numColorTargets: colorTargetInfos size
		 depthStencilTargetInfo: depthStencilTargetInfo
]
