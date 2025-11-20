Extension { #name : 'SDL3GPUDevice' }

{ #category : '* SDL3-API' }
SDL3GPUDevice >> acquireGPUCommandBuffer [

	^ self ffiLibrary acquireGPUCommandBuffer: self
]

{ #category : '* SDL3-API' }
SDL3GPUDevice >> claimWindowForWindow: window [

	^ self ffiLibrary claimWindowForGPUDevice: self window: window
]

{ #category : '* SDL3-API' }
SDL3GPUDevice >> destroy [

	^ self ffiLibrary destroyGPUDevice: self
]

{ #category : '* SDL3-API' }
SDL3GPUDevice >> getGPUSwapchainTextureFormatIntoWindow: window [

	^ self ffiLibrary
		  getGPUSwapchainTextureFormatDevice: self
		  window: window
]

{ #category : '* SDL3-API' }
SDL3GPUDevice >> gpuAllowedFramesInFlightAllowedFramesInFlight: allowed_frames_in_flight [

	^ self ffiLibrary
		  setGPUAllowedFramesInFlightDevice: self
		  allowedFramesInFlight: allowed_frames_in_flight
]

{ #category : '* SDL3-API' }
SDL3GPUDevice >> gpuBufferNameBuffer: buffer text: text [

	^ self ffiLibrary
		  setGPUBufferNameDevice: self
		  buffer: buffer
		  text: text
]

{ #category : '* SDL3-API' }
SDL3GPUDevice >> gpuDriver [

	^ self ffiLibrary getGPUDeviceDriver: self
]

{ #category : '* SDL3-API' }
SDL3GPUDevice >> gpuProperties [

	^ self ffiLibrary getGPUDeviceProperties: self
]

{ #category : '* SDL3-API' }
SDL3GPUDevice >> gpuShaderFormats [

	^ self ffiLibrary getGPUShaderFormats: self
]

{ #category : '* SDL3-API' }
SDL3GPUDevice >> gpuSwapchainParametersWindow: window swapchainComposition: swapchain_composition presentMode: present_mode [

	^ self ffiLibrary
		  setGPUSwapchainParametersDevice: self
		  window: window
		  swapchainComposition: swapchain_composition
		  presentMode: present_mode
]

{ #category : '* SDL3-API' }
SDL3GPUDevice >> gpuTextureNameTexture: texture text: text [

	^ self ffiLibrary
		  setGPUTextureNameDevice: self
		  texture: texture
		  text: text
]

{ #category : '* SDL3-API' }
SDL3GPUDevice >> gpuTextureSupportsFormat: format type: type usage: usage [

	^ self ffiLibrary
		  gpuTextureSupportsFormatDevice: self
		  format: format
		  type: type
		  usage: usage
]

{ #category : '* SDL3-API' }
SDL3GPUDevice >> gpuTextureSupportsSampleCountFormat: format sampleCount: sample_count [

	^ self ffiLibrary
		  gpuTextureSupportsSampleCountDevice: self
		  format: format
		  sampleCount: sample_count
]

{ #category : '* SDL3-API' }
SDL3GPUDevice >> mapGPUTransferBuffer: transfer_buffer cycle: cycle [

	^ self ffiLibrary
		  mapGPUTransferBufferDevice: self
		  transferBuffer: transfer_buffer
		  cycle: cycle
]

{ #category : '* SDL3-API' }
SDL3GPUDevice >> newGPUBufferCreateinfo: createinfo [

	^ self ffiLibrary newGPUBufferDevice: self createinfo: createinfo
]

{ #category : '* SDL3-API' }
SDL3GPUDevice >> newGPUComputePipelineCreateinfo: createinfo [

	^ self ffiLibrary
		  newGPUComputePipelineDevice: self
		  createinfo: createinfo
]

{ #category : '* SDL3-API' }
SDL3GPUDevice >> newGPUGraphicsPipelineCreateinfo: createinfo [

	^ self ffiLibrary
		  newGPUGraphicsPipelineDevice: self
		  createinfo: createinfo
]

{ #category : '* SDL3-API' }
SDL3GPUDevice >> newGPURendererWindow: window [

	^ self ffiLibrary newGPURendererDevice: self window: window
]

{ #category : '* SDL3-API' }
SDL3GPUDevice >> newGPUSamplerCreateinfo: createinfo [

	^ self ffiLibrary newGPUSamplerDevice: self createinfo: createinfo
]

{ #category : '* SDL3-API' }
SDL3GPUDevice >> newGPUShaderCreateinfo: createinfo [

	^ self ffiLibrary newGPUShaderDevice: self createinfo: createinfo
]

{ #category : '* SDL3-API' }
SDL3GPUDevice >> newGPUTextureCreateinfo: createinfo [

	^ self ffiLibrary newGPUTextureDevice: self createinfo: createinfo
]

{ #category : '* SDL3-API' }
SDL3GPUDevice >> newGPUTransferBufferCreateinfo: createinfo [

	^ self ffiLibrary
		  newGPUTransferBufferDevice: self
		  createinfo: createinfo
]

{ #category : '* SDL3-API' }
SDL3GPUDevice >> queryGPUFence: fence [

	^ self ffiLibrary queryGPUFenceDevice: self fence: fence
]

{ #category : '* SDL3-API' }
SDL3GPUDevice >> releaseGPUBuffer: buffer [

	^ self ffiLibrary releaseGPUBufferDevice: self buffer: buffer
]

{ #category : '* SDL3-API' }
SDL3GPUDevice >> releaseGPUComputePipeline: compute_pipeline [

	^ self ffiLibrary
		  releaseGPUComputePipelineDevice: self
		  computePipeline: compute_pipeline
]

{ #category : '* SDL3-API' }
SDL3GPUDevice >> releaseGPUFence: fence [

	^ self ffiLibrary releaseGPUFenceDevice: self fence: fence
]

{ #category : '* SDL3-API' }
SDL3GPUDevice >> releaseGPUGraphicsPipeline: graphics_pipeline [

	^ self ffiLibrary
		  releaseGPUGraphicsPipelineDevice: self
		  graphicsPipeline: graphics_pipeline
]

{ #category : '* SDL3-API' }
SDL3GPUDevice >> releaseGPUSampler: sampler [

	^ self ffiLibrary releaseGPUSamplerDevice: self sampler: sampler
]

{ #category : '* SDL3-API' }
SDL3GPUDevice >> releaseGPUShader: shader [

	^ self ffiLibrary releaseGPUShaderDevice: self shader: shader
]

{ #category : '* SDL3-API' }
SDL3GPUDevice >> releaseGPUTexture: texture [

	^ self ffiLibrary releaseGPUTextureDevice: self texture: texture
]

{ #category : '* SDL3-API' }
SDL3GPUDevice >> releaseGPUTransferBuffer: transfer_buffer [

	^ self ffiLibrary
		  releaseGPUTransferBufferDevice: self
		  transferBuffer: transfer_buffer
]

{ #category : '* SDL3-API' }
SDL3GPUDevice >> releaseWindowFromWindow: window [

	^ self ffiLibrary releaseWindowFromGPUDevice: self window: window
]

{ #category : '* SDL3-API' }
SDL3GPUDevice >> unmapGPUTransferBuffer: transfer_buffer [

	^ self ffiLibrary
		  unmapGPUTransferBufferDevice: self
		  transferBuffer: transfer_buffer
]

{ #category : '* SDL3-API' }
SDL3GPUDevice >> waitForGPUFencesWaitAll: wait_all fences: fences numFences: num_fences [

	^ self ffiLibrary
		  waitForGPUFencesDevice: self
		  waitAll: wait_all
		  fences: fences
		  numFences: num_fences
]

{ #category : '* SDL3-API' }
SDL3GPUDevice >> waitForGPUIdle [

	^ self ffiLibrary waitForGPUIdle: self
]

{ #category : '* SDL3-API' }
SDL3GPUDevice >> waitForGPUSwapchainWindow: window [

	^ self ffiLibrary waitForGPUSwapchainDevice: self window: window
]

{ #category : '* SDL3-API' }
SDL3GPUDevice >> windowSupportsGPUPresentModeWindow: window presentMode: present_mode [

	^ self ffiLibrary
		  windowSupportsGPUPresentModeDevice: self
		  window: window
		  presentMode: present_mode
]

{ #category : '* SDL3-API' }
SDL3GPUDevice >> windowSupportsGPUSwapchainCompositionWindow: window swapchainComposition: swapchain_composition [

	^ self ffiLibrary
		  windowSupportsGPUSwapchainCompositionDevice: self
		  window: window
		  swapchainComposition: swapchain_composition
]
