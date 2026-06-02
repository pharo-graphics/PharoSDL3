Extension { #name : 'SDL3GPUDevice' }

{ #category : '*SDL3-Own' }
SDL3GPUDevice >> gpuShaderFormatsAsArray [

	| formatsBitFlags |
	formatsBitFlags := self gpuShaderFormats.

	formatsBitFlags = 0 ifTrue: [ ^ #() ].

	^ SDL3GPUShaderFormat allValuesIn: formatsBitFlags
]

{ #category : '*SDL3-Own' }
SDL3GPUDevice >> new2DGPUTextureFormat: pixelFormat usage: usage width: width height: height [
	"Answer a new `SDL_GPUTexture` with the given pixel format, usage and extent, and use default values."

	| createinfo texture |
	createinfo := SDL_GPUTextureCreateInfo new.
	createinfo
		type: SDL_GPU_TEXTURETYPE_2D;
		format: pixelFormat;
		usage: usage asInteger;
		width: width;
		height: height;
		layerCountOrDepth: 1;
		numLevels: 1;
		sampleCount: SDL_GPU_SAMPLECOUNT_1;
		props: 0.

	texture := self newGPUTextureCreateinfo: createinfo.
	^ texture
]

{ #category : '*SDL3-Own' }
SDL3GPUDevice >> newDownloadTransferBuffer: size [
	"Create a transfer buffer for downloading data from the GPU."

	| createinfo transferBuffer |
	createinfo := SDL3GPUTransferBufferCreateInfo new.
	createinfo
		usage: SDL3GPUTransferBufferUsage download;
		size: size;
		props: 0.

	transferBuffer := self newGPUTransferBufferCreateinfo: createinfo.
	^ transferBuffer
]

{ #category : '*SDL3-Own' }
SDL3GPUDevice >> newGPUBufferUsage: usage size: size [

	| createInfo gpuBuffer |
	createInfo :=
		SDL_GPUBufferCreateInfo new 
			usage: usage asInteger;
			size: size;
			yourself.

	gpuBuffer := self newGPUBufferCreateinfo: createInfo.
	^ gpuBuffer
]

{ #category : '*SDL3-Own' }
SDL3GPUDevice >> newGPUTextureUploadingForm: aForm usage: aUsage [
	"Answer a new `SDL_GPUTexture` and copy the Form pixels to it (assuming depth is 32 bits).
	Sender is responsible of releasing the texture. Note: It may be convenient to reuse the transfer buffer and other SDL objects."

	| gpuTexture transferBuffer mappedAddress commandBuffer copyPass |
	self assert: [ aForm depth = 32 ].
	aForm unhibernate.

	gpuTexture :=
		self
			new2DGPUTextureFormat: SDL_GPU_TEXTUREFORMAT_B8G8R8A8_UNORM
			usage: aUsage
			width: aForm width
			height: aForm height.

	transferBuffer := self newUploadTransferBuffer: aForm bits byteSize.
	mappedAddress := self mapGPUTransferBuffer: transferBuffer cycle: false.
	mappedAddress isNull ifTrue: [ SDL3Error signalFromLibraryErrorMessage ].

	"Copy from surface pixels handle to mappedAddress handle"
	LibC memCopy: aForm bits to: mappedAddress size: aForm bits byteSize.
	self unmapGPUTransferBuffer: transferBuffer.

	commandBuffer := self acquireGPUCommandBuffer.
	copyPass := commandBuffer beginGPUCopyPass.
	copyPass
		uploadToGPUTextureSource:
			(SDL_GPUTextureTransferInfo new
				transferBuffer: transferBuffer;
				offset: 0;
				yourself)
		destination:
			(SDL_GPUTextureRegion new
				texture: gpuTexture;
				w: aForm width;
				h: aForm height;
				d: 1;
				yourself)
		cycle: false.
	copyPass end.
	self ffiLibrary assertSuccess: commandBuffer submit.

	self releaseGPUTransferBuffer: transferBuffer.
	
	^ gpuTexture
]

{ #category : '*SDL3-Own' }
SDL3GPUDevice >> newUploadTransferBuffer: size [
	"Create a transfer buffer for uploading data to the GPU."

	| createinfo transferBuffer |
	createinfo := SDL3GPUTransferBufferCreateInfo new.
	createinfo
		usage: SDL3GPUTransferBufferUsage upload;
		size: size;
		props: 0.

	transferBuffer := self newGPUTransferBufferCreateinfo: createinfo.
	^ transferBuffer
]

{ #category : '*SDL3-Own' }
SDL3GPUDevice >> propertyGroup [

	^ SDL3PropertyGroup id: self propertiesID
]

{ #category : '*SDL3-Own' }
SDL3GPUDevice >> waitGPUFence: aGPUFence [

	self ffiLibrary assertSuccess:
		(self waitForGPUFencesWaitAll: true fences: aGPUFence numFences: 1)
]
