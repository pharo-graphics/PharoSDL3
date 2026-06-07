Extension { #name : 'SDL3GPUDevice' }

{ #category : '*SDL3-API' }
SDL3GPUDevice >> acquireGPUCommandBuffer [

	^ (self ffiLibrary acquireGPUCommandBuffer: self)
		  assertNotNullReturn;
		  yourself
]

{ #category : '*SDL3-API' }
SDL3GPUDevice >> claimWindow: window [

	self ffiLibrary assertSuccess:
		(self ffiLibrary claimWindowForGPUDevice: self window: window)
]

{ #category : '*SDL3-API' }
SDL3GPUDevice >> destroy [

	self ffiLibrary destroyGPUDevice: self
]

{ #category : '*SDL3-API' }
SDL3GPUDevice >> driver [

	^ self ffiLibrary getGPUDeviceDriver: self
]

{ #category : '*SDL3-API' }
SDL3GPUDevice >> getGPUSwapchainTextureFormatIntoWindow: window [

	^ self ffiLibrary
		  getGPUSwapchainTextureFormatDevice: self
		  window: window
]

{ #category : '*SDL3-API' }
SDL3GPUDevice >> gpuAllowedFramesInFlightAllowedFramesInFlight: allowedFramesInFlight [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			setGPUAllowedFramesInFlightDevice: self
			allowedFramesInFlight: allowedFramesInFlight)
]

{ #category : '*SDL3-API' }
SDL3GPUDevice >> gpuBufferNameBuffer: buffer text: text [

	self ffiLibrary setGPUBufferNameDevice: self buffer: buffer text: text
]

{ #category : '*SDL3-API' }
SDL3GPUDevice >> gpuShaderFormats [

	^ self ffiLibrary getGPUShaderFormats: self
]

{ #category : '*SDL3-API' }
SDL3GPUDevice >> gpuSwapchainParametersWindow: window swapchainComposition: swapchainComposition presentMode: presentMode [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			setGPUSwapchainParametersDevice: self
			window: window
			swapchainComposition: swapchainComposition
			presentMode: presentMode)
]

{ #category : '*SDL3-API' }
SDL3GPUDevice >> gpuTextureNameTexture: texture text: text [

	self ffiLibrary setGPUTextureNameDevice: self texture: texture text: text
]

{ #category : '*SDL3-API' }
SDL3GPUDevice >> gpuTextureSupportsFormat: format type: type usage: usage [

	^ self ffiLibrary
		  gpuTextureSupportsFormatDevice: self
		  format: format
		  type: type
		  usage: usage
]

{ #category : '*SDL3-API' }
SDL3GPUDevice >> gpuTextureSupportsSampleCountFormat: format sampleCount: sampleCount [

	^ self ffiLibrary
		  gpuTextureSupportsSampleCountDevice: self
		  format: format
		  sampleCount: sampleCount
]

{ #category : '*SDL3-API' }
SDL3GPUDevice >> mapGPUTransferBuffer: transferBuffer cycle: cycle [

	^ self ffiLibrary
		  mapGPUTransferBufferDevice: self
		  transferBuffer: transferBuffer
		  cycle: cycle
]

{ #category : '*SDL3-API' }
SDL3GPUDevice >> newGPUBufferCreateinfo: createinfo [

	^ (self ffiLibrary newGPUBufferDevice: self createinfo: createinfo)
		  assertNotNullReturn;
		  yourself
]

{ #category : '*SDL3-API' }
SDL3GPUDevice >> newGPUComputePipelineCreateinfo: createinfo [

	^ (self ffiLibrary
		   newGPUComputePipelineDevice: self
		   createinfo: createinfo)
		  assertNotNullReturn;
		  yourself
]

{ #category : '*SDL3-API' }
SDL3GPUDevice >> newGPUGraphicsPipelineCreateinfo: createinfo [

	^ (self ffiLibrary
		   newGPUGraphicsPipelineDevice: self
		   createinfo: createinfo)
		  assertNotNullReturn;
		  yourself
]

{ #category : '*SDL3-API' }
SDL3GPUDevice >> newGPURendererWindow: window [

	^ (self ffiLibrary newGPURendererDevice: self window: window)
		  assertNotNullReturn;
		  yourself
]

{ #category : '*SDL3-API' }
SDL3GPUDevice >> newGPUSamplerCreateinfo: createinfo [

	^ (self ffiLibrary newGPUSamplerDevice: self createinfo: createinfo)
		  assertNotNullReturn;
		  yourself
]

{ #category : '*SDL3-API' }
SDL3GPUDevice >> newGPUShaderCreateinfo: createinfo [

	^ (self ffiLibrary newGPUShaderDevice: self createinfo: createinfo)
		  assertNotNullReturn;
		  yourself
]

{ #category : '*SDL3-API' }
SDL3GPUDevice >> newGPUTextureCreateinfo: createinfo [

	^ (self ffiLibrary newGPUTextureDevice: self createinfo: createinfo)
		  assertNotNullReturn;
		  yourself
]

{ #category : '*SDL3-API' }
SDL3GPUDevice >> newGPUTransferBufferCreateinfo: createinfo [

	^ (self ffiLibrary
		   newGPUTransferBufferDevice: self
		   createinfo: createinfo)
		  assertNotNullReturn;
		  yourself
]

{ #category : '*SDL3-API' }
SDL3GPUDevice >> propertiesID [

	^ self ffiLibrary getGPUDeviceProperties: self
]

{ #category : '*SDL3-API' }
SDL3GPUDevice >> queryGPUFence: fence [

	^ self ffiLibrary queryGPUFenceDevice: self fence: fence
]

{ #category : '*SDL3-API' }
SDL3GPUDevice >> releaseGPUBuffer: buffer [

	self ffiLibrary releaseGPUBufferDevice: self buffer: buffer
]

{ #category : '*SDL3-API' }
SDL3GPUDevice >> releaseGPUComputePipeline: computePipeline [

	self ffiLibrary
		releaseGPUComputePipelineDevice: self
		computePipeline: computePipeline
]

{ #category : '*SDL3-API' }
SDL3GPUDevice >> releaseGPUFence: fence [

	self ffiLibrary releaseGPUFenceDevice: self fence: fence
]

{ #category : '*SDL3-API' }
SDL3GPUDevice >> releaseGPUGraphicsPipeline: graphicsPipeline [

	self ffiLibrary
		releaseGPUGraphicsPipelineDevice: self
		graphicsPipeline: graphicsPipeline
]

{ #category : '*SDL3-API' }
SDL3GPUDevice >> releaseGPUSampler: sampler [

	self ffiLibrary releaseGPUSamplerDevice: self sampler: sampler
]

{ #category : '*SDL3-API' }
SDL3GPUDevice >> releaseGPUShader: shader [

	self ffiLibrary releaseGPUShaderDevice: self shader: shader
]

{ #category : '*SDL3-API' }
SDL3GPUDevice >> releaseGPUTexture: texture [

	self ffiLibrary releaseGPUTextureDevice: self texture: texture
]

{ #category : '*SDL3-API' }
SDL3GPUDevice >> releaseGPUTransferBuffer: transferBuffer [

	self ffiLibrary
		releaseGPUTransferBufferDevice: self
		transferBuffer: transferBuffer
]

{ #category : '*SDL3-API' }
SDL3GPUDevice >> releaseWindow: window [

	self ffiLibrary releaseWindowFromGPUDevice: self window: window
]

{ #category : '*SDL3-API' }
SDL3GPUDevice >> unmapGPUTransferBuffer: transferBuffer [

	self ffiLibrary
		unmapGPUTransferBufferDevice: self
		transferBuffer: transferBuffer
]

{ #category : '*SDL3-API' }
SDL3GPUDevice >> waitForGPUFencesWaitAll: waitAll fences: fences numFences: numFences [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			waitForGPUFencesDevice: self
			waitAll: waitAll
			fences: fences
			numFences: numFences)
]

{ #category : '*SDL3-API' }
SDL3GPUDevice >> waitForGPUIdle [

	self ffiLibrary assertSuccess: (self ffiLibrary waitForGPUIdle: self)
]

{ #category : '*SDL3-API' }
SDL3GPUDevice >> waitForGPUSwapchainWindow: window [

	self ffiLibrary assertSuccess:
		(self ffiLibrary waitForGPUSwapchainDevice: self window: window)
]

{ #category : '*SDL3-API' }
SDL3GPUDevice >> windowSupportsGPUPresentModeWindow: window presentMode: presentMode [

	^ self ffiLibrary
		  windowSupportsGPUPresentModeDevice: self
		  window: window
		  presentMode: presentMode
]

{ #category : '*SDL3-API' }
SDL3GPUDevice >> windowSupportsGPUSwapchainCompositionWindow: window swapchainComposition: swapchainComposition [

	^ self ffiLibrary
		  windowSupportsGPUSwapchainCompositionDevice: self
		  window: window
		  swapchainComposition: swapchainComposition
]
