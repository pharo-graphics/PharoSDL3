Extension { #name : 'SDL3GPUDevice' }

{ #category : '*SDL3-Own' }
SDL3GPUDevice >> gpuShaderFormatsAsArray [

	| formatsBitFlags |
	formatsBitFlags := self gpuShaderFormats.

	formatsBitFlags = 0 ifTrue: [ ^ #() ].

	^ SDL3GPUShaderFormat allValuesIn: formatsBitFlags
]

{ #category : '*SDL3-Own' }
SDL3GPUDevice >> new2DTextureFormat: format usage: usage width: width height: height [
	"Create a 2D texture with the given format, usage, and dimensions."

	| createinfo |
	createinfo := SDL3GPUTextureCreateInfo new.
	createinfo
		type: SDL3GPUTextureType at2d;
		format: format;
		usage: usage asInteger;
		width: width;
		height: height;
		layerCountOrDepth: 1;
		numLevels: 1;
		sampleCount: SDL3GPUSampleCount one;
		props: 0.

	^ self newGPUTextureCreateinfo: createinfo
]

{ #category : '*SDL3-Own' }
SDL3GPUDevice >> newUploadTransferBuffer: size [
	"Create a transfer buffer for uploading data to the GPU."

	| createinfo |
	createinfo := SDL3GPUTransferBufferCreateInfo new.
	createinfo
		usage: SDL3GPUTransferBufferUsage upload;
		size: size;
		props: 0.

	^ self newGPUTransferBufferCreateinfo: createinfo
]
