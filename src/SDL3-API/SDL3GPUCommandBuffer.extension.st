Extension { #name : 'SDL3GPUCommandBuffer' }

{ #category : '*SDL3-API' }
SDL3GPUCommandBuffer >> acquireGPUSwapchainTextureForWindow: window into: swapchainTexture width: swapchainTextureWidth height: swapchainTextureHeight [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			acquireGPUSwapchainTextureCommandBuffer: self
			window: window
			swapchainTexture: swapchainTexture
			swapchainTextureWidth: swapchainTextureWidth
			swapchainTextureHeight: swapchainTextureHeight)
]

{ #category : '*SDL3-API' }
SDL3GPUCommandBuffer >> beginGPUComputePassStorageTextureBindings: storageTextureBindings numStorageTextureBindings: numStorageTextureBindings storageBufferBindings: storageBufferBindings numStorageBufferBindings: numStorageBufferBindings [

	^ self ffiLibrary
		  beginGPUComputePassCommandBuffer: self
		  storageTextureBindings: storageTextureBindings
		  numStorageTextureBindings: numStorageTextureBindings
		  storageBufferBindings: storageBufferBindings
		  numStorageBufferBindings: numStorageBufferBindings
]

{ #category : '*SDL3-API' }
SDL3GPUCommandBuffer >> beginGPUCopyPass [

	^ self ffiLibrary beginGPUCopyPass: self
]

{ #category : '*SDL3-API' }
SDL3GPUCommandBuffer >> beginGPURenderPassColorTargetInfos: colorTargetInfos numColorTargets: numColorTargets depthStencilTargetInfo: depthStencilTargetInfo [

	^ self ffiLibrary
		  beginGPURenderPassCommandBuffer: self
		  colorTargetInfos: colorTargetInfos
		  numColorTargets: numColorTargets
		  depthStencilTargetInfo: depthStencilTargetInfo
]

{ #category : '*SDL3-API' }
SDL3GPUCommandBuffer >> blitGPUTextureInfo: info [

	self ffiLibrary blitGPUTextureCommandBuffer: self info: info
]

{ #category : '*SDL3-API' }
SDL3GPUCommandBuffer >> cancel [

	self ffiLibrary assertSuccess:
		(self ffiLibrary cancelGPUCommandBuffer: self)
]

{ #category : '*SDL3-API' }
SDL3GPUCommandBuffer >> generateMipmapsForGPUTexture: texture [

	self ffiLibrary
		generateMipmapsForGPUTextureCommandBuffer: self
		texture: texture
]

{ #category : '*SDL3-API' }
SDL3GPUCommandBuffer >> insertGPUDebugLabelText: text [

	self ffiLibrary insertGPUDebugLabelCommandBuffer: self text: text
]

{ #category : '*SDL3-API' }
SDL3GPUCommandBuffer >> popGPUDebugGroup [

	self ffiLibrary popGPUDebugGroup: self
]

{ #category : '*SDL3-API' }
SDL3GPUCommandBuffer >> pushGPUComputeUniformDataSlotIndex: slotIndex data: data length: length [

	self ffiLibrary
		pushGPUComputeUniformDataCommandBuffer: self
		slotIndex: slotIndex
		data: data
		length: length
]

{ #category : '*SDL3-API' }
SDL3GPUCommandBuffer >> pushGPUDebugGroupName: name [

	self ffiLibrary pushGPUDebugGroupCommandBuffer: self name: name
]

{ #category : '*SDL3-API' }
SDL3GPUCommandBuffer >> pushGPUFragmentUniformDataSlotIndex: slotIndex data: data length: length [

	self ffiLibrary
		pushGPUFragmentUniformDataCommandBuffer: self
		slotIndex: slotIndex
		data: data
		length: length
]

{ #category : '*SDL3-API' }
SDL3GPUCommandBuffer >> pushGPUVertexUniformDataSlotIndex: slotIndex data: data length: length [

	self ffiLibrary
		pushGPUVertexUniformDataCommandBuffer: self
		slotIndex: slotIndex
		data: data
		length: length
]

{ #category : '*SDL3-API' }
SDL3GPUCommandBuffer >> submit [

	self ffiLibrary assertSuccess:
		(self ffiLibrary submitGPUCommandBuffer: self)
]

{ #category : '*SDL3-API' }
SDL3GPUCommandBuffer >> submitAndAcquireFence [

	^ (self ffiLibrary submitGPUCommandBufferAndAcquireFence: self)
		  assertNotNullReturn;
		  yourself
]

{ #category : '*SDL3-API' }
SDL3GPUCommandBuffer >> waitAndAcquireGPUSwapchainTextureForWindow: window into: swapchainTexture width: swapchainTextureWidth height: swapchainTextureHeight [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			waitAndAcquireGPUSwapchainTextureCommandBuffer: self
			window: window
			swapchainTexture: swapchainTexture
			swapchainTextureWidth: swapchainTextureWidth
			swapchainTextureHeight: swapchainTextureHeight)
]
