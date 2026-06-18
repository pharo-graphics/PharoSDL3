Extension { #name : 'SDL3GPUDevice' }

{ #category : '*SDL3-API' }
SDL3GPUDevice >> acquireGPUCommandBuffer [

	^ (self ffiLibrary acquireGPUCommandBuffer: self)
		  assertNotNullReturn;
		  device: self;
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
SDL3GPUDevice >> newGPURendererWindow: window [

	^ (self ffiLibrary newGPURendererDevice: self window: window)
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
