Extension { #name : 'SDL3GPUDevice' }

{ #category : '*SDL3-Own' }
SDL3GPUDevice >> downloadFrom: sourceBuffer type: ffiClass count: arraySize do: aBlock [
	"Synchronously downloads data from a GPU buffer to the CPU, stalling the CPU until complete."

	| byteSize transferBuffer commandBuffer |
	byteSize := ffiClass externalTypeSize * arraySize.
	transferBuffer := self newDownloadTransferBuffer: byteSize.
	
	[
		"1. Record and submit the copy command"
		commandBuffer := self acquireGPUCommandBuffer.
		commandBuffer copyPassDo: [ :copyPass |
			copyPass
				downloadBuffer:
					(SDL_GPUBufferRegion new
						buffer: sourceBuffer;
						offset: 0;
						size: byteSize;
						yourself)
				destination:
					(SDL_GPUTransferBufferLocation new
						transferBuffer: transferBuffer;
						offset: 0;
						yourself) ].
		commandBuffer submit.

		"2. Stall CPU until the transfer is physically complete on the GPU"
		self waitForGPUIdle.

		"3. Map memory and let the user read it"
		self mapTransferBuffer: transferBuffer cycle: false do: [ :mappedAddress |
			| array |
			array := FFIArray fromHandle: mappedAddress type: ffiClass size: arraySize.
			aBlock value: array ]
			
	] ensure: [ transferBuffer release ]
]

{ #category : '*SDL3-Own' }
SDL3GPUDevice >> gpuShaderFormatsAsArray [

	| formatsBitFlags |
	formatsBitFlags := self gpuShaderFormats.

	formatsBitFlags = 0 ifTrue: [ ^ #() ].

	^ SDL3GPUShaderFormat allValuesIn: formatsBitFlags
]

{ #category : '*SDL3-Own' }
SDL3GPUDevice >> mapTransferBuffer: transferBuffer cycle: cycle do: aBlock [

	| address |
	address := self mapGPUTransferBuffer: transferBuffer cycle: cycle.
	address isNull ifTrue: [ SDL3Error signalFromLibraryErrorMessage ].
	[ aBlock value: address ] ensure: [ self unmapGPUTransferBuffer: transferBuffer ]
]

{ #category : '*SDL3-Own' }
SDL3GPUDevice >> new2DGPUTextureFormat: pixelFormat usage: usage width: width height: height [
	"Answer a new `SDL_GPUTexture` with the given pixel format, usage and extent, and use default values."

	^ self newTexture: [ :info |
		info
			type: SDL_GPU_TEXTURETYPE_2D;
			format: pixelFormat;
			usage: usage asInteger;
			width: width;
			height: height;
			layerCountOrDepth: 1;
			numLevels: 1;
			sampleCount: SDL_GPU_SAMPLECOUNT_1;
			props: 0 ]
]

{ #category : '*SDL3-Own' }
SDL3GPUDevice >> newBuffer: aBlock [

	| info |
	info := SDL3GPUBufferCreateInfo externalNew.
	^ [ 
		aBlock value: info.
		(self ffiLibrary newGPUBufferDevice: self createinfo: info)
			assertNotNullReturn;
			device: self;
			yourself
	] ensure: [ info free ]
]

{ #category : '*SDL3-Own' }
SDL3GPUDevice >> newComputePipeline: aBlock [

	| createInfo |
	createInfo := SDL3GPUComputePipelineCreateInfo externalNew.
	^ [
		aBlock value: createInfo.
		(self ffiLibrary newGPUComputePipelineDevice: self createinfo: createInfo)
			assertNotNullReturn;
			device: self;
			yourself
	] ensure: [ createInfo free ]
]

{ #category : '*SDL3-Own' }
SDL3GPUDevice >> newDownloadTransferBuffer: size [
	"Create a transfer buffer for downloading data from the GPU."

	| info |
	info := SDL3GPUTransferBufferCreateInfo externalNew.
	^ [
		info
			usage: SDL3GPUTransferBufferUsage download;
			size: size;
			props: 0.
		(self ffiLibrary newGPUTransferBufferDevice: self createinfo: info)
			assertNotNullReturn;
			device: self;
			yourself
	] ensure: [ info free ]
]

{ #category : '*SDL3-Own' }
SDL3GPUDevice >> newGPUBufferUsage: usage size: size [

	^ self newBuffer: [ :info |
		info
			usage: usage asInteger;
			size: size ]
]

{ #category : '*SDL3-Own' }
SDL3GPUDevice >> newGPUTextureUploadingForm: aForm usage: aUsage [
	"Answer a new `SDL_GPUTexture` and copy the Form pixels to it (assuming depth is 32 bits).
	Sender is responsible of releasing the texture. Note: It may be convenient to reuse the transfer buffer and other SDL objects."

	| gpuTexture transferBuffer commandBuffer |


	self assert: [ aForm depth = 32 ].
	aForm unhibernate.

	gpuTexture :=
		self
			new2DGPUTextureFormat: SDL_GPU_TEXTUREFORMAT_B8G8R8A8_UNORM
			usage: aUsage
			width: aForm width
			height: aForm height.

	transferBuffer := self newUploadTransferBuffer: aForm bits byteSize.
	self mapTransferBuffer: transferBuffer cycle: false do: [ :mappedAddress |
		"Copy from surface pixels handle to mappedAddress handle"
		LibC memCopy: aForm bits to: mappedAddress size: aForm bits byteSize ].

	commandBuffer := self acquireGPUCommandBuffer.
	commandBuffer copyPassDo: [ :copyPass |
		copyPass
			uploadTexture:
				(SDL3GPUTextureTransferInfo new
					transferBuffer: transferBuffer;
					offset: 0;
					yourself)
			destination:
				(SDL3GPUTextureRegion new
					texture: gpuTexture;
					w: aForm width;
					h: aForm height;
					d: 1;
					yourself)
			cycle: false ].
	commandBuffer submit.

	transferBuffer release.
	
	^ gpuTexture
]

{ #category : '*SDL3-Own' }
SDL3GPUDevice >> newGraphicsPipeline: aBlock [

	| info |
	info := SDL3GPUGraphicsPipelineCreateInfo externalNew.
	^ [ 
		aBlock value: info.
		(self ffiLibrary newGPUGraphicsPipelineDevice: self createinfo: info)
			assertNotNullReturn;
			device: self;
			yourself
	] ensure: [ info free ]
]

{ #category : '*SDL3-Own' }
SDL3GPUDevice >> newSampler: aBlock [

	| info |
	info := SDL3GPUSamplerCreateInfo externalNew.
	^ [ 
		aBlock value: info.
		(self ffiLibrary newGPUSamplerDevice: self createinfo: info)
			assertNotNullReturn;
			device: self;
			yourself
	] ensure: [ info free ]
]

{ #category : '*SDL3-Own' }
SDL3GPUDevice >> newTexture: aBlock [

	| info |
	info := SDL3GPUTextureCreateInfo externalNew.
	^ [ 
		aBlock value: info.
		(self ffiLibrary newGPUTextureDevice: self createinfo: info)
			assertNotNullReturn;
			device: self;
			yourself
	] ensure: [ info free ]
]

{ #category : '*SDL3-Own' }
SDL3GPUDevice >> newUploadTransferBuffer: size [
	"Create a transfer buffer for uploading data to the GPU."

	| info |
	info := SDL3GPUTransferBufferCreateInfo externalNew.
	^ [
	 	info
			usage: SDL3GPUTransferBufferUsage upload;
			size: size;
			props: 0.
		(self ffiLibrary newGPUTransferBufferDevice: self createinfo: info)
			assertNotNullReturn;
			device: self;
			yourself
	] ensure: [ info free ]
]

{ #category : '*SDL3-Own' }
SDL3GPUDevice >> propertyGroup [

	^ SDL3PropertyGroup id: self propertiesID
]

{ #category : '*SDL3-Own' }
SDL3GPUDevice class >> unsafeNewFormatFlags: formatFlags debugMode: debugMode name: aString [

	^ (self ffiLibrary
		   newGPUDeviceFormatFlags: formatFlags
		   debugMode: debugMode
		   name: aString)
		  assertNotNullReturn;
		  yourself
]

{ #category : '*SDL3-Own' }
SDL3GPUDevice class >> unsafeNewWithProperties: propertiesID [

	^ (self ffiLibrary newGPUDeviceWithProperties: propertiesID)
		  assertNotNullReturn;
		  yourself
]

{ #category : '*SDL3-Own' }
SDL3GPUDevice >> uploadToGPUDo: aBlock [
	"Acquires a command buffer, starts a copy pass, yields an uploader for batching, and submits the commands."

	SDL3GPUUploader on: self do: aBlock
]

{ #category : '*SDL3-Own' }
SDL3GPUDevice >> waitGPUFence: aGPUFence [

	self ffiLibrary assertSuccess:
		(self waitForGPUFencesWaitAll: true fences: aGPUFence numFences: 1)
]
