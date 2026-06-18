Extension { #name : 'SDL3GPUCommandBuffer' }

{ #category : '*SDL3-API' }
SDL3GPUCommandBuffer >> acquireSwapchainTextureForWindow: window into: swapchainTexture width: swapchainTextureWidth height: swapchainTextureHeight [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			acquireGPUSwapchainTextureCommandBuffer: self
			window: window
			swapchainTexture: swapchainTexture
			swapchainTextureWidth: swapchainTextureWidth
			swapchainTextureHeight: swapchainTextureHeight)
]

{ #category : '*SDL3-API' }
SDL3GPUCommandBuffer >> beginComputePassTextures: storageTextureBindings count: numStorageTextureBindings storageBuffers: storageBufferBindings count: numStorageBufferBindings [

	^ self ffiLibrary
		  beginGPUComputePassCommandBuffer: self
		  storageTextureBindings: storageTextureBindings
		  numStorageTextureBindings: numStorageTextureBindings
		  storageBufferBindings: storageBufferBindings
		  numStorageBufferBindings: numStorageBufferBindings
]

{ #category : '*SDL3-API' }
SDL3GPUCommandBuffer >> beginCopyPass [

	^ (self ffiLibrary beginGPUCopyPass: self)
		  assertNotNullReturn;
		  device: self device;
		  yourself
]

{ #category : '*SDL3-API' }
SDL3GPUCommandBuffer >> beginRenderPassTargets: colorTargetInfos count: numColorTargets depthStencil: depthStencilTargetInfo [

	^ self ffiLibrary
		  beginGPURenderPassCommandBuffer: self
		  colorTargetInfos: colorTargetInfos
		  numColorTargets: numColorTargets
		  depthStencilTargetInfo: depthStencilTargetInfo
]

{ #category : '*SDL3-API' }
SDL3GPUCommandBuffer >> blit: info [

	self ffiLibrary blitGPUTextureCommandBuffer: self info: info
]

{ #category : '*SDL3-API' }
SDL3GPUCommandBuffer >> cancel [

	self ffiLibrary assertSuccess:
		(self ffiLibrary cancelGPUCommandBuffer: self)
]

{ #category : '*SDL3-API' }
SDL3GPUCommandBuffer >> generateMipmaps: texture [

	self ffiLibrary
		generateMipmapsForGPUTextureCommandBuffer: self
		texture: texture
]

{ #category : '*SDL3-API' }
SDL3GPUCommandBuffer >> insertDebugLabel: text [

	self ffiLibrary insertGPUDebugLabelCommandBuffer: self text: text
]

{ #category : '*SDL3-API' }
SDL3GPUCommandBuffer >> popDebugGroup [

	self ffiLibrary popGPUDebugGroup: self
]

{ #category : '*SDL3-API' }
SDL3GPUCommandBuffer >> pushComputeUniformSlot: slotIndex data: data length: length [

	self ffiLibrary
		pushGPUComputeUniformDataCommandBuffer: self
		slotIndex: slotIndex
		data: data
		length: length
]

{ #category : '*SDL3-API' }
SDL3GPUCommandBuffer >> pushDebugGroup: name [

	self ffiLibrary pushGPUDebugGroupCommandBuffer: self name: name
]

{ #category : '*SDL3-API' }
SDL3GPUCommandBuffer >> pushFragmentUniformSlot: slotIndex data: data length: length [

	self ffiLibrary
		pushGPUFragmentUniformDataCommandBuffer: self
		slotIndex: slotIndex
		data: data
		length: length
]

{ #category : '*SDL3-API' }
SDL3GPUCommandBuffer >> pushVertexUniformSlot: slotIndex data: data length: length [

	self ffiLibrary
		pushGPUVertexUniformDataCommandBuffer: self
		slotIndex: slotIndex
		data: data
		length: length
]

{ #category : '*SDL3-API' }
SDL3GPUCommandBuffer >> releaseFromGPUDevice [
	"Command buffers are released when they are submitted or canceled. Manual release is usually not needed but provided for completeness."

	self cancel
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
		  device: self device;
		  yourself
]

{ #category : '*SDL3-API' }
SDL3GPUCommandBuffer >> waitAndAcquireSwapchainTextureForWindow: window into: swapchainTexture width: swapchainTextureWidth height: swapchainTextureHeight [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			waitAndAcquireGPUSwapchainTextureCommandBuffer: self
			window: window
			swapchainTexture: swapchainTexture
			swapchainTextureWidth: swapchainTextureWidth
			swapchainTextureHeight: swapchainTextureHeight)
]
