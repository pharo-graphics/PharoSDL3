Extension { #name : 'SDL3GPUCommandBuffer' }

{ #category : '*SDL3-Own' }
SDL3GPUCommandBuffer >> acquireSwapchainTextureForWindow: window into: swapchainTexture width: swapchainTextureWidth height: swapchainTextureHeight [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			acquireGPUSwapchainTextureCommandBuffer: self
			window: window
			swapchainTexture: swapchainTexture
			swapchainTextureWidth: swapchainTextureWidth
			swapchainTextureHeight: swapchainTextureHeight)
]

{ #category : '*SDL3-Own' }
SDL3GPUCommandBuffer >> beginComputePassTextures: storageTextureBindings count: numStorageTextureBindings storageBuffers: storageBufferBindings count: numStorageBufferBindings [

	^ self ffiLibrary
		  beginGPUComputePassCommandBuffer: self
		  storageTextureBindings: storageTextureBindings
		  numStorageTextureBindings: numStorageTextureBindings
		  storageBufferBindings: storageBufferBindings
		  numStorageBufferBindings: numStorageBufferBindings
]

{ #category : '*SDL3-Own' }
SDL3GPUCommandBuffer >> beginComputePassTextures: storageTextureBindings storageBuffers: storageBuffers [

	^ self
		 beginComputePassTextures: (storageTextureBindings ifEmpty: [ ExternalAddress null ])
		 count: storageTextureBindings size
		 storageBuffers: (storageBuffers ifEmpty: [ ExternalAddress null ])
		 count: storageBuffers size
]

{ #category : '*SDL3-Own' }
SDL3GPUCommandBuffer >> beginCopyPass [

	^ (self ffiLibrary beginGPUCopyPass: self)
		  assertNotNullReturn;
		  device: self device;
		  yourself
]

{ #category : '*SDL3-Own' }
SDL3GPUCommandBuffer >> beginRenderPassTargets: colorTargetInfos [

	^ self beginRenderPassTargets: colorTargetInfos depthStencil: nil
]

{ #category : '*SDL3-Own' }
SDL3GPUCommandBuffer >> beginRenderPassTargets: colorTargetInfos count: numColorTargets depthStencil: depthStencilTargetInfo [

	^ self ffiLibrary
		  beginGPURenderPassCommandBuffer: self
		  colorTargetInfos: colorTargetInfos
		  numColorTargets: numColorTargets
		  depthStencilTargetInfo: depthStencilTargetInfo
]

{ #category : '*SDL3-Own' }
SDL3GPUCommandBuffer >> beginRenderPassTargets: colorTargetInfos depthStencil: depthStencilTargetInfo [

	^ self
		 beginRenderPassTargets: (colorTargetInfos ifEmpty: [ ExternalAddress null ])
		 count: colorTargetInfos size
		 depthStencil: depthStencilTargetInfo
]

{ #category : '*SDL3-Own' }
SDL3GPUCommandBuffer >> blit: info [

	self ffiLibrary blitGPUTextureCommandBuffer: self info: info
]

{ #category : '*SDL3-Own' }
SDL3GPUCommandBuffer >> blitFrom: sourceTexture to: destinationTexture do: aBlock [

	| info |
	info := SDL3GPUBlitInfo externalNew.
	[ 
	info
		beSource: sourceTexture
		destination: destinationTexture
		filter: SDL3GPUFilter linear.
	aBlock value: info.
	^ self blit: info ] ensure: [ info free ]
]

{ #category : '*SDL3-Own' }
SDL3GPUCommandBuffer >> cancel [

	self ffiLibrary assertSuccess:
		(self ffiLibrary cancelGPUCommandBuffer: self)
]

{ #category : '*SDL3-Own' }
SDL3GPUCommandBuffer >> computePassTextures: texArray computeStorageBuffers: bufArray do: aBlock [

	| pass |
	pass := self beginComputePassTextures: texArray storageBuffers: bufArray.
	[ aBlock value: pass ] ensure: [ pass end ]
]

{ #category : '*SDL3-Own' }
SDL3GPUCommandBuffer >> copyPassDo: aBlock [

	| pass |
	pass := self beginCopyPass.
	[ aBlock value: pass ] ensure: [ pass end ]
]

{ #category : '*SDL3-Own' }
SDL3GPUCommandBuffer >> generateMipmaps: texture [

	self ffiLibrary
		generateMipmapsForGPUTextureCommandBuffer: self
		texture: texture
]

{ #category : '*SDL3-Own' }
SDL3GPUCommandBuffer >> insertDebugLabel: text [

	self ffiLibrary insertGPUDebugLabelCommandBuffer: self text: text
]

{ #category : '*SDL3-Own' }
SDL3GPUCommandBuffer >> popDebugGroup [

	self ffiLibrary popGPUDebugGroup: self
]

{ #category : '*SDL3-Own' }
SDL3GPUCommandBuffer >> pushComputeUniform: data slot: slot [

	^ self
		  pushComputeUniformSlot: slot
		  data: data
		  length: data class structureSize
]

{ #category : '*SDL3-Own' }
SDL3GPUCommandBuffer >> pushComputeUniformSlot: slotIndex data: data length: length [

	self ffiLibrary
		pushGPUComputeUniformDataCommandBuffer: self
		slotIndex: slotIndex
		data: data
		length: length
]

{ #category : '*SDL3-Own' }
SDL3GPUCommandBuffer >> pushDebugGroup: name [

	self ffiLibrary pushGPUDebugGroupCommandBuffer: self name: name
]

{ #category : '*SDL3-Own' }
SDL3GPUCommandBuffer >> pushFragmentUniform: data slot: slot [

	^ self
		  pushFragmentUniformSlot: slot
		  data: data
		  length: data class structureSize
]

{ #category : '*SDL3-Own' }
SDL3GPUCommandBuffer >> pushFragmentUniformSlot: slotIndex data: data length: length [

	self ffiLibrary
		pushGPUFragmentUniformDataCommandBuffer: self
		slotIndex: slotIndex
		data: data
		length: length
]

{ #category : '*SDL3-Own' }
SDL3GPUCommandBuffer >> pushVertexUniform: data slot: slot [

	^ self
		  pushVertexUniformSlot: slot
		  data: data
		  length: data class structureSize
]

{ #category : '*SDL3-Own' }
SDL3GPUCommandBuffer >> pushVertexUniformSlot: slotIndex data: data length: length [

	self ffiLibrary
		pushGPUVertexUniformDataCommandBuffer: self
		slotIndex: slotIndex
		data: data
		length: length
]

{ #category : '*SDL3-Own' }
SDL3GPUCommandBuffer >> releaseFromGPUDevice [
	"Command buffers are released when they are submitted or canceled. Manual release is usually not needed but provided for completeness."

	self cancel
]

{ #category : '*SDL3-Own' }
SDL3GPUCommandBuffer >> renderPassTargets: targetArray depthStencil: depthInfo do: aBlock [

	| pass |
	pass := self beginRenderPassTargets: targetArray depthStencil: depthInfo.
	[ aBlock value: pass ] ensure: [ pass end ]
]

{ #category : '*SDL3-Own' }
SDL3GPUCommandBuffer >> renderPassTargets: targetArray do: aBlock [

	self renderPassTargets: targetArray depthStencil: nil do: aBlock
]

{ #category : '*SDL3-Own' }
SDL3GPUCommandBuffer >> submit [

	self ffiLibrary assertSuccess:
		(self ffiLibrary submitGPUCommandBuffer: self)
]

{ #category : '*SDL3-Own' }
SDL3GPUCommandBuffer >> submitAndAcquireFence [

	^ (self ffiLibrary submitGPUCommandBufferAndAcquireFence: self)
		  assertNotNullReturn;
		  device: self device;
		  yourself
]

{ #category : '*SDL3-Own' }
SDL3GPUCommandBuffer >> waitAndAcquireSwapchainTextureForWindow: window into: swapchainTexture width: swapchainTextureWidth height: swapchainTextureHeight [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			waitAndAcquireGPUSwapchainTextureCommandBuffer: self
			window: window
			swapchainTexture: swapchainTexture
			swapchainTextureWidth: swapchainTextureWidth
			swapchainTextureHeight: swapchainTextureHeight)
]
