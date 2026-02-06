Extension { #name : 'SDL3GPUCommandBuffer' }

{ #category : '*SDL3-API' }
SDL3GPUCommandBuffer >> acquireGPUSwapchainTextureForWindow: window into: swapchain_texture width: swapchain_texture_width height: swapchain_texture_height [

	^ self ffiLibrary
		  acquireGPUSwapchainTextureCommandBuffer: self
		  window: window
		  swapchainTexture: swapchain_texture
		  swapchainTextureWidth: swapchain_texture_width
		  swapchainTextureHeight: swapchain_texture_height
]

{ #category : '*SDL3-API' }
SDL3GPUCommandBuffer >> beginGPUComputePassStorageTextureBindings: storage_texture_bindings numStorageTextureBindings: num_storage_texture_bindings storageBufferBindings: storage_buffer_bindings numStorageBufferBindings: num_storage_buffer_bindings [

	^ self ffiLibrary
		  beginGPUComputePassCommandBuffer: self
		  storageTextureBindings: storage_texture_bindings
		  numStorageTextureBindings: num_storage_texture_bindings
		  storageBufferBindings: storage_buffer_bindings
		  numStorageBufferBindings: num_storage_buffer_bindings
]

{ #category : '*SDL3-API' }
SDL3GPUCommandBuffer >> beginGPUCopyPass [

	^ self ffiLibrary beginGPUCopyPass: self
]

{ #category : '*SDL3-API' }
SDL3GPUCommandBuffer >> beginGPURenderPassColorTargetInfos: color_target_infos numColorTargets: num_color_targets depthStencilTargetInfo: depth_stencil_target_info [

	^ self ffiLibrary
		  beginGPURenderPassCommandBuffer: self
		  colorTargetInfos: color_target_infos
		  numColorTargets: num_color_targets
		  depthStencilTargetInfo: depth_stencil_target_info
]

{ #category : '*SDL3-API' }
SDL3GPUCommandBuffer >> blitGPUTextureInfo: info [

	^ self ffiLibrary blitGPUTextureCommandBuffer: self info: info
]

{ #category : '*SDL3-API' }
SDL3GPUCommandBuffer >> cancel [

	^ self ffiLibrary cancelGPUCommandBuffer: self
]

{ #category : '*SDL3-API' }
SDL3GPUCommandBuffer >> generateMipmapsForGPUTexture: texture [

	^ self ffiLibrary
		  generateMipmapsForGPUTextureCommandBuffer: self
		  texture: texture
]

{ #category : '*SDL3-API' }
SDL3GPUCommandBuffer >> insertGPUDebugLabelText: text [

	^ self ffiLibrary insertGPUDebugLabelCommandBuffer: self text: text
]

{ #category : '*SDL3-API' }
SDL3GPUCommandBuffer >> popGPUDebugGroup [

	^ self ffiLibrary popGPUDebugGroup: self
]

{ #category : '*SDL3-API' }
SDL3GPUCommandBuffer >> pushGPUComputeUniformDataSlotIndex: slot_index data: data length: length [

	^ self ffiLibrary
		  pushGPUComputeUniformDataCommandBuffer: self
		  slotIndex: slot_index
		  data: data
		  length: length
]

{ #category : '*SDL3-API' }
SDL3GPUCommandBuffer >> pushGPUDebugGroupName: name [

	^ self ffiLibrary pushGPUDebugGroupCommandBuffer: self name: name
]

{ #category : '*SDL3-API' }
SDL3GPUCommandBuffer >> pushGPUFragmentUniformDataSlotIndex: slot_index data: data length: length [

	^ self ffiLibrary
		  pushGPUFragmentUniformDataCommandBuffer: self
		  slotIndex: slot_index
		  data: data
		  length: length
]

{ #category : '*SDL3-API' }
SDL3GPUCommandBuffer >> pushGPUVertexUniformDataSlotIndex: slot_index data: data length: length [

	^ self ffiLibrary
		  pushGPUVertexUniformDataCommandBuffer: self
		  slotIndex: slot_index
		  data: data
		  length: length
]

{ #category : '*SDL3-API' }
SDL3GPUCommandBuffer >> submit [

	^ self ffiLibrary submitGPUCommandBuffer: self
]

{ #category : '*SDL3-API' }
SDL3GPUCommandBuffer >> submitAndAcquireFence [

	^ self ffiLibrary submitGPUCommandBufferAndAcquireFence: self
]

{ #category : '*SDL3-API' }
SDL3GPUCommandBuffer >> waitAndAcquireGPUSwapchainTextureForWindow: window into: swapchain_texture width: swapchain_texture_width height: swapchain_texture_height [

	^ self ffiLibrary
		  waitAndAcquireGPUSwapchainTextureCommandBuffer: self
		  window: window
		  swapchainTexture: swapchain_texture
		  swapchainTextureWidth: swapchain_texture_width
		  swapchainTextureHeight: swapchain_texture_height
]
