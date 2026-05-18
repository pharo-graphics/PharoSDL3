"
I test the SDL3 GPU compute pipeline in a headless environment.
I also serve as a pedagogical reference for developers.
"
Class {
	#name : 'SDL3ComputePipelineTest',
	#superclass : 'SDL3Test',
	#instVars : [
		'gpuDevice',
		'shaderFormats'
	],
	#pools : [
		'SDL3AllEnumerations',
		'SDL3ZConstants'
	],
	#category : 'SDL3-Compute-Tests',
	#package : 'SDL3-Compute-Tests'
}

{ #category : 'running' }
SDL3ComputePipelineTest >> setUp [

	super setUp.

	self
		assert: (sdl initSubSystem: SDL3InitFlags video)
		description: 'Initialize video subsystem'.

	gpuDevice := sdl
		newGPUDeviceFormatFlags: SDL_GPU_SHADERFORMAT_DXIL | SDL_GPU_SHADERFORMAT_MSL | SDL_GPU_SHADERFORMAT_SPIRV
		debugMode: true name: nil.
	gpuDevice assertNotNullReturn.

	shaderFormats := gpuDevice gpuShaderFormatsAsArray
]

{ #category : 'running' }
SDL3ComputePipelineTest >> tearDown [

	gpuDevice ifNotNil: [ gpuDevice destroy ].
	gpuDevice := nil.

	super tearDown
]

{ #category : 'tests' }
SDL3ComputePipelineTest >> test01SimpleMath [
	"Case 1: Simple Buffer Math
	Reads from input buffer, multiplies by 2, writes to result buffer."

	| inputData inputBuffer resultBuffer computePipeline commandBuffer computePass transferBuffer mappedAddress resultData numElements byteSize rwBindings roBindings |
	
	numElements := 1024.
	byteSize := numElements * FFIFloat32 externalTypeSize.

	"1. Prepare data"
	inputData := FFIArray newType: FFIFloat32 size: numElements.
	1 to: numElements do: [ :i | inputData at: i put: i asFloat ].
	1 to: numElements do: [ :i | self assert: (inputData at: i) equals: i asFloat ].

	"2. Create GPU buffers"
	inputBuffer := gpuDevice
		newGPUBufferUsage: SDL_GPU_BUFFERUSAGE_COMPUTE_STORAGE_READ
		size: byteSize.
	resultBuffer := gpuDevice
		newGPUBufferUsage: SDL_GPU_BUFFERUSAGE_COMPUTE_STORAGE_WRITE
		size: byteSize.
	transferBuffer := gpuDevice newUploadTransferBuffer: byteSize.

	"3. Upload input data"
	mappedAddress := gpuDevice mapGPUTransferBuffer: transferBuffer cycle: false.
	LibC memCopy: inputData getHandle to: mappedAddress size: byteSize.
	gpuDevice unmapGPUTransferBuffer: transferBuffer.

	commandBuffer := gpuDevice acquireGPUCommandBuffer.
	
	"A. Upload copy"
	commandBuffer beginGPUCopyPass
		uploadToGPUBufferSource: (SDL_GPUTransferBufferLocation new transferBuffer: transferBuffer; offset: 0; yourself)
		destination: (SDL_GPUBufferRegion new buffer: inputBuffer; offset: 0; size: byteSize; yourself)
		cycle: false;
		end.

	"B. Compute"
	computePipeline := SDL3TestComputeMathShaderSource newComputePipelineAmong: shaderFormats device: gpuDevice.

	"Inlined binding logic to match Boids demo and ensure handle persistence"
	rwBindings := FFIArray newType: SDL3GPUStorageBufferReadWriteBinding size: 1.
	rwBindings first buffer: resultBuffer; cycle: false.
	
	roBindings := FFIArray newType: ExternalAddress size: 1.
	roBindings at: 1 put: inputBuffer getHandle.

	computePass := commandBuffer
		  beginGPUComputePassStorageTextureBindings: nil
		  numStorageTextureBindings: 0
		  storageBufferBindings: rwBindings
		  numStorageBufferBindings: 1.
		
	computePass bindGPUComputePipeline: computePipeline.
	computePass bindGPUComputeStorageBuffersFirstSlot: 0 storageBuffers: roBindings numBindings: 1.
	
	computePass dispatchWorkgroupCountX: (SDL3TestComputeMathShaderSource dispatchWorkgroupCountXFor: numElements) y: 1 z: 1.
	computePass end.
	
	sdl assertSuccess: commandBuffer submit.

	"4. Download results"
	gpuDevice releaseGPUTransferBuffer: transferBuffer.
	transferBuffer := gpuDevice newDownloadTransferBuffer: byteSize.
	commandBuffer := gpuDevice acquireGPUCommandBuffer.
	commandBuffer beginGPUCopyPass
		downloadFromGPUBufferSource: (SDL_GPUBufferRegion new buffer: resultBuffer; offset: 0; size: byteSize; yourself)
		destination: (SDL_GPUTransferBufferLocation new transferBuffer: transferBuffer; offset: 0; yourself);
		end.
	sdl assertSuccess: commandBuffer submit.

	gpuDevice waitForGPUIdle.

	"5. Assert"
	mappedAddress := gpuDevice mapGPUTransferBuffer: transferBuffer cycle: false.
	resultData := FFIArray fromHandle: mappedAddress type: FFIFloat32 size: numElements.
	1 to: numElements do: [ :i |
		self assert: (resultData at: i) equals: (i * 2) asFloat ].
	gpuDevice unmapGPUTransferBuffer: transferBuffer.

	"Cleanup"
	gpuDevice releaseGPUComputePipeline: computePipeline.
	gpuDevice releaseGPUBuffer: inputBuffer.
	gpuDevice releaseGPUBuffer: resultBuffer.
	gpuDevice releaseGPUTransferBuffer: transferBuffer.
	inputData free
]

{ #category : 'tests' }
SDL3ComputePipelineTest >> test02Uniforms [
	"Case 2: Uniform & Buffer Interaction
	Reads multiplier and offset from uniform buffer, writes results to storage buffer."

	| resultBuffer computePipeline commandBuffer computePass transferBuffer mappedAddress resultData uniforms numElements byteSize rwBindings |
	
	numElements := 1024.
	byteSize := numElements * FFIFloat32 externalTypeSize.

	"1. Prepare uniforms"
	uniforms := SDL3TestComputeUniforms new.
	uniforms multiplier: 10.0; offset: 5.0.

	"2. Create GPU buffers"
	resultBuffer := gpuDevice
		newGPUBufferUsage: SDL_GPU_BUFFERUSAGE_COMPUTE_STORAGE_WRITE
		size: byteSize.
	
	"3. Setup pipeline and dispatch"
	computePipeline := SDL3TestComputeUniformShaderSource
		newComputePipelineAmong: shaderFormats
		device: gpuDevice.

	commandBuffer := gpuDevice acquireGPUCommandBuffer.
	commandBuffer
		pushGPUComputeUniformDataSlotIndex: 0
		data: uniforms
		length: uniforms class structureSize.

	rwBindings := FFIArray newType: SDL3GPUStorageBufferReadWriteBinding size: 1.
	rwBindings first buffer: resultBuffer; cycle: false.

	computePass := commandBuffer
		  beginGPUComputePassStorageTextureBindings: nil
		  numStorageTextureBindings: 0
		  storageBufferBindings: rwBindings
		  numStorageBufferBindings: 1.

	computePass bindGPUComputePipeline: computePipeline.
	computePass dispatchWorkgroupCountX: (SDL3TestComputeUniformShaderSource dispatchWorkgroupCountXFor: numElements) y: 1 z: 1.
	computePass end.
	
	sdl assertSuccess: commandBuffer submit.
	
	"4. Download results"
	transferBuffer := gpuDevice newDownloadTransferBuffer: byteSize.
	commandBuffer := gpuDevice acquireGPUCommandBuffer.
	commandBuffer beginGPUCopyPass
		downloadFromGPUBufferSource: (SDL_GPUBufferRegion new buffer: resultBuffer; offset: 0; size: byteSize; yourself)
		destination: (SDL_GPUTransferBufferLocation new transferBuffer: transferBuffer; offset: 0; yourself);
		end.
	sdl assertSuccess: commandBuffer submit.

	gpuDevice waitForGPUIdle.

	"5. Assert"
	mappedAddress := gpuDevice mapGPUTransferBuffer: transferBuffer cycle: false.
	resultData := FFIArray fromHandle: mappedAddress type: FFIFloat32 size: numElements.
	1 to: numElements do: [ :i |
		"Expected: (i-1) * 10.0 + 5.0"
		self assert: (resultData at: i) equals: ((i - 1) * 10.0 + 5.0) asFloat ].
	gpuDevice unmapGPUTransferBuffer: transferBuffer.

	"Cleanup"
	gpuDevice releaseGPUComputePipeline: computePipeline.
	gpuDevice releaseGPUBuffer: resultBuffer.
	gpuDevice releaseGPUTransferBuffer: transferBuffer
]

{ #category : 'tests' }
SDL3ComputePipelineTest >> test03MultiDispatchChaining [
	"Case 3: Multi-Dispatch Chaining & Barriers
	Chains two dispatches: Dispatch A adds 1.0, Dispatch B adds another 1.0."

	| bufferA bufferB bufferC computePipeline commandBuffer computePass transferBuffer mappedAddress resultData numElements inputData byteSize rwBindingsA roBindingsA rwBindingsB roBindingsB |
	
	numElements := 1024.
	byteSize := numElements * FFIFloat32 externalTypeSize.

	"1. Create 3 buffers for double-buffering style chain"
	bufferA := gpuDevice newGPUBufferUsage: SDL_GPU_BUFFERUSAGE_COMPUTE_STORAGE_READ size: byteSize.
	bufferB := gpuDevice newGPUBufferUsage: SDL_GPU_BUFFERUSAGE_COMPUTE_STORAGE_READ | SDL_GPU_BUFFERUSAGE_COMPUTE_STORAGE_WRITE size: byteSize.
	bufferC := gpuDevice newGPUBufferUsage: SDL_GPU_BUFFERUSAGE_COMPUTE_STORAGE_WRITE size: byteSize.
	
	"Initial data: 10.0"
	inputData := FFIArray newType: FFIFloat32 size: numElements.
	1 to: numElements do: [ :i | inputData at: i put: 10.0 ].

	transferBuffer := gpuDevice newUploadTransferBuffer: byteSize.
	mappedAddress := gpuDevice mapGPUTransferBuffer: transferBuffer cycle: false.
	LibC memCopy: inputData getHandle to: mappedAddress size: byteSize.
	gpuDevice unmapGPUTransferBuffer: transferBuffer.

	commandBuffer := gpuDevice acquireGPUCommandBuffer.
	
	"A. Upload"
	commandBuffer beginGPUCopyPass
		uploadToGPUBufferSource: (SDL_GPUTransferBufferLocation new transferBuffer: transferBuffer; offset: 0; yourself)
		destination: (SDL_GPUBufferRegion new buffer: bufferA; offset: 0; size: byteSize; yourself)
		cycle: false;
		end.

	"B. Setup pipeline"
	computePipeline := SDL3TestComputeAddOneShaderSource
		newComputePipelineAmong: shaderFormats
		device: gpuDevice.

	"C. Dispatch A: A -> B"
	rwBindingsA := FFIArray newType: SDL3GPUStorageBufferReadWriteBinding size: 1.
	rwBindingsA first buffer: bufferB; cycle: false.
	roBindingsA := FFIArray newType: ExternalAddress size: 1.
	roBindingsA at: 1 put: bufferA getHandle.

	computePass := commandBuffer beginGPUComputePassStorageTextureBindings: nil numStorageTextureBindings: 0 storageBufferBindings: rwBindingsA numStorageBufferBindings: 1.
	computePass bindGPUComputePipeline: computePipeline.
	computePass bindGPUComputeStorageBuffersFirstSlot: 0 storageBuffers: roBindingsA numBindings: 1.
	computePass dispatchWorkgroupCountX: (SDL3TestComputeAddOneShaderSource dispatchWorkgroupCountXFor: numElements) y: 1 z: 1.
	computePass end.
	
	"D. Dispatch B: B -> C"
	rwBindingsB := FFIArray newType: SDL3GPUStorageBufferReadWriteBinding size: 1.
	rwBindingsB first buffer: bufferC; cycle: false.
	roBindingsB := FFIArray newType: ExternalAddress size: 1.
	roBindingsB at: 1 put: bufferB getHandle.

	computePass := commandBuffer beginGPUComputePassStorageTextureBindings: nil numStorageTextureBindings: 0 storageBufferBindings: rwBindingsB numStorageBufferBindings: 1.
	computePass bindGPUComputePipeline: computePipeline.
	computePass bindGPUComputeStorageBuffersFirstSlot: 0 storageBuffers: roBindingsB numBindings: 1.
	computePass dispatchWorkgroupCountX: (SDL3TestComputeAddOneShaderSource dispatchWorkgroupCountXFor: numElements) y: 1 z: 1.
	computePass end.
	
	sdl assertSuccess: commandBuffer submit.

	"3. Download results from C"
	gpuDevice releaseGPUTransferBuffer: transferBuffer.
	transferBuffer := gpuDevice newDownloadTransferBuffer: byteSize.
	commandBuffer := gpuDevice acquireGPUCommandBuffer.
	commandBuffer beginGPUCopyPass
		downloadFromGPUBufferSource: (SDL_GPUBufferRegion new buffer: bufferC; offset: 0; size: byteSize; yourself)
		destination: (SDL_GPUTransferBufferLocation new transferBuffer: transferBuffer; offset: 0; yourself);
		end.
	sdl assertSuccess: commandBuffer submit.

	gpuDevice waitForGPUIdle.

	"4. Assert: 10.0 + 1.0 + 1.0 = 12.0"
	mappedAddress := gpuDevice mapGPUTransferBuffer: transferBuffer cycle: false.
	resultData := FFIArray fromHandle: mappedAddress type: FFIFloat32 size: numElements.
	1 to: numElements do: [ :i |
		self assert: (resultData at: i) equals: 12.0 ].
	gpuDevice unmapGPUTransferBuffer: transferBuffer.

	"Cleanup"
	gpuDevice releaseGPUComputePipeline: computePipeline.
	gpuDevice releaseGPUBuffer: bufferA.
	gpuDevice releaseGPUBuffer: bufferB.
	gpuDevice releaseGPUBuffer: bufferC.
	gpuDevice releaseGPUTransferBuffer: transferBuffer.
	inputData free
]

{ #category : 'tests' }
SDL3ComputePipelineTest >> test04StructuredBuffers [
	"Case 4: Structured Buffers & Alignment
	Uses SDL3TestComputeStruct to show 16-byte alignment."

	| inputData inputBuffer resultBuffer computePipeline commandBuffer computePass transferBuffer mappedAddress resultData numElements byteSize rwBindings roBindings |
	
	numElements := 1024.
	byteSize := numElements * SDL3TestComputeStruct structureSize.

	"1. Prepare data"
	inputData := FFIArray newType: SDL3TestComputeStruct size: numElements.
	1 to: numElements do: [ :i |
		(inputData at: i) x: 10.0; y: 20.0; z: 30.0; w: 40.0 ].

	"2. Create GPU buffers"
	inputBuffer := gpuDevice
		newGPUBufferUsage: SDL_GPU_BUFFERUSAGE_COMPUTE_STORAGE_READ
		size: byteSize.
	resultBuffer := gpuDevice
		newGPUBufferUsage: SDL_GPU_BUFFERUSAGE_COMPUTE_STORAGE_WRITE
		size: byteSize.
	transferBuffer := gpuDevice newUploadTransferBuffer: byteSize.

	"3. Upload"
	mappedAddress := gpuDevice mapGPUTransferBuffer: transferBuffer cycle: false.
	LibC memCopy: inputData getHandle to: mappedAddress size: byteSize.
	gpuDevice unmapGPUTransferBuffer: transferBuffer.

	commandBuffer := gpuDevice acquireGPUCommandBuffer.
	
	"A. Upload"
	commandBuffer beginGPUCopyPass
		uploadToGPUBufferSource: (SDL_GPUTransferBufferLocation new transferBuffer: transferBuffer; offset: 0; yourself)
		destination: (SDL_GPUBufferRegion new buffer: inputBuffer; offset: 0; size: byteSize; yourself)
		cycle: false;
		end.

	"B. Compute"
	computePipeline := SDL3TestComputeStructShaderSource
		newComputePipelineAmong: shaderFormats
		device: gpuDevice.

	rwBindings := FFIArray newType: SDL3GPUStorageBufferReadWriteBinding size: 1.
	rwBindings first buffer: resultBuffer; cycle: false.
	roBindings := FFIArray newType: ExternalAddress size: 1.
	roBindings at: 1 put: inputBuffer getHandle.

	computePass := commandBuffer beginGPUComputePassStorageTextureBindings: nil numStorageTextureBindings: 0 storageBufferBindings: rwBindings numStorageBufferBindings: 1.
	computePass bindGPUComputePipeline: computePipeline.
	computePass bindGPUComputeStorageBuffersFirstSlot: 0 storageBuffers: roBindings numBindings: 1.
	computePass dispatchWorkgroupCountX: (SDL3TestComputeStructShaderSource dispatchWorkgroupCountXFor: numElements) y: 1 z: 1.
	computePass end.
	
	sdl assertSuccess: commandBuffer submit.
	
	"4. Download results"
	gpuDevice releaseGPUTransferBuffer: transferBuffer.
	transferBuffer := gpuDevice newDownloadTransferBuffer: byteSize.
	commandBuffer := gpuDevice acquireGPUCommandBuffer.
	commandBuffer beginGPUCopyPass
		downloadFromGPUBufferSource: (SDL_GPUBufferRegion new buffer: resultBuffer; offset: 0; size: byteSize; yourself)
		destination: (SDL_GPUTransferBufferLocation new transferBuffer: transferBuffer; offset: 0; yourself);
		end.
	sdl assertSuccess: commandBuffer submit.

	gpuDevice waitForGPUIdle.

	"5. Assert"
	mappedAddress := gpuDevice mapGPUTransferBuffer: transferBuffer cycle: false.
	resultData := FFIArray fromHandle: mappedAddress type: SDL3TestComputeStruct size: numElements.
	1 to: numElements do: [ :i |
		| s |
		s := resultData at: i.
		self assert: s x equals: 11.0.
		self assert: s y equals: 22.0.
		self assert: s z equals: 33.0.
		self assert: s w equals: 44.0 ].
	gpuDevice unmapGPUTransferBuffer: transferBuffer.

	"Cleanup"
	gpuDevice releaseGPUComputePipeline: computePipeline.
	gpuDevice releaseGPUBuffer: inputBuffer.
	gpuDevice releaseGPUBuffer: resultBuffer.
	gpuDevice releaseGPUTransferBuffer: transferBuffer.
	inputData free
]

{ #category : 'tests' }
SDL3ComputePipelineTest >> test05LargeBufferIndexing [
	"Case 5: Large Buffer Indexing
	Demonstrates global indexing math in a flat buffer."

	| resultBuffer computePipeline commandBuffer computePass transferBuffer mappedAddress resultData numElements rwBindings byteSize |
	
	numElements := 1024.
	byteSize := numElements * FFIUInt32 externalTypeSize.

	"1. Create GPU result buffer"
	resultBuffer := gpuDevice
		newGPUBufferUsage: SDL_GPU_BUFFERUSAGE_COMPUTE_STORAGE_WRITE
		size: byteSize. "1024 uints"
	
	"2. Setup pipeline and dispatch"
	computePipeline := SDL3TestComputeIndexShaderSource
		newComputePipelineAmong: shaderFormats
		device: gpuDevice.

	commandBuffer := gpuDevice acquireGPUCommandBuffer.
	rwBindings := FFIArray newType: SDL3GPUStorageBufferReadWriteBinding size: 1.
	rwBindings first buffer: resultBuffer; cycle: false.

	computePass := commandBuffer beginGPUComputePassStorageTextureBindings: nil numStorageTextureBindings: 0 storageBufferBindings: rwBindings numStorageBufferBindings: 1.
	computePass bindGPUComputePipeline: computePipeline.
	computePass dispatchWorkgroupCountX: (SDL3TestComputeIndexShaderSource dispatchWorkgroupCountXFor: numElements) y: 1 z: 1.
	computePass end.
	sdl assertSuccess: commandBuffer submit.
	
	"3. Download results"
	transferBuffer := gpuDevice newDownloadTransferBuffer: byteSize.
	commandBuffer := gpuDevice acquireGPUCommandBuffer.
	commandBuffer beginGPUCopyPass
		downloadFromGPUBufferSource: (SDL_GPUBufferRegion new buffer: resultBuffer; offset: 0; size: byteSize; yourself)
		destination: (SDL_GPUTransferBufferLocation new transferBuffer: transferBuffer; offset: 0; yourself);
		end.
	sdl assertSuccess: commandBuffer submit.

	gpuDevice waitForGPUIdle.

	"4. Assert"
	mappedAddress := gpuDevice mapGPUTransferBuffer: transferBuffer cycle: false.
	resultData := FFIArray fromHandle: mappedAddress type: FFIUInt32 size: numElements.
	1 to: numElements do: [ :i |
		self assert: (resultData at: i) equals: i - 1 ].
	gpuDevice unmapGPUTransferBuffer: transferBuffer.

	"Cleanup"
	gpuDevice releaseGPUComputePipeline: computePipeline.
	gpuDevice releaseGPUBuffer: resultBuffer.
	gpuDevice releaseGPUTransferBuffer: transferBuffer
]

{ #category : 'tests' }
SDL3ComputePipelineTest >> test06StorageTextures [
	"Case 6: Storage Textures
	Writes colors to a ReadWrite texture from compute."

	| resultTexture computePipeline commandBuffer computePass transferBuffer mappedAddress resultData texWidth texHeight byteSize rwBindings |
	
	texWidth := 16.
	texHeight := 16.
	byteSize := texWidth * texHeight * FFIUInt32 externalTypeSize. "R8G8B8A8"

	"1. Create GPU result texture"
	resultTexture := gpuDevice
		new2DGPUTextureFormat: SDL_GPU_TEXTUREFORMAT_R8G8B8A8_UNORM
		usage: SDL_GPU_TEXTUREUSAGE_COMPUTE_STORAGE_WRITE | SDL_GPU_TEXTUREUSAGE_SAMPLER
		width: texWidth
		height: texHeight.
	
	"2. Setup pipeline and dispatch"
	computePipeline := SDL3TestComputeTextureShaderSource
		newComputePipelineAmong: shaderFormats
		device: gpuDevice.

	commandBuffer := gpuDevice acquireGPUCommandBuffer.
	rwBindings := FFIArray newType: SDL3GPUStorageTextureReadWriteBinding size: 1.
	rwBindings first texture: resultTexture; cycle: false.

	computePass := commandBuffer beginGPUComputePassStorageTextureBindings: rwBindings numStorageTextureBindings: 1 storageBufferBindings: nil numStorageBufferBindings: 0.
	computePass bindGPUComputePipeline: computePipeline.
	computePass dispatchWorkgroupCountX: 1 y: 1 z: 1.
	computePass end.
	sdl assertSuccess: commandBuffer submit.
	
	"3. Download results"
	transferBuffer := gpuDevice newDownloadTransferBuffer: byteSize.
	commandBuffer := gpuDevice acquireGPUCommandBuffer.
	commandBuffer beginGPUCopyPass
		downloadFromGPUTextureSource: (SDL3GPUTextureRegion new texture: resultTexture; w: texWidth; h: texHeight; d: 1; yourself)
		destination: (SDL3GPUTextureTransferInfo new transferBuffer: transferBuffer; offset: 0; yourself);
		end.
	sdl assertSuccess: commandBuffer submit.

	gpuDevice waitForGPUIdle.

	"4. Assert"
	mappedAddress := gpuDevice mapGPUTransferBuffer: transferBuffer cycle: false.
	resultData := FFIArray fromHandle: mappedAddress type: FFIUInt8 size: byteSize.
	
	self assert: (resultData at: 1) equals: 0. "R"
	self assert: (resultData at: 2) equals: 0. "G"
	self assert: (resultData at: 3) equals: 0. "B"
	self assert: (resultData at: 4) equals: 255. "A"

	self assert: (resultData at: byteSize - 3) equals: 239. "R (15/16 * 255 = 239.0625)"
	self assert: (resultData at: byteSize - 2) equals: 239. "G"
	self assert: (resultData at: byteSize - 1) equals: 0. "B"
	self assert: (resultData at: byteSize) equals: 255. "A"

	gpuDevice unmapGPUTransferBuffer: transferBuffer.

	"Cleanup"
	gpuDevice releaseGPUComputePipeline: computePipeline.
	gpuDevice releaseGPUTexture: resultTexture.
	gpuDevice releaseGPUTransferBuffer: transferBuffer
]

{ #category : 'tests' }
SDL3ComputePipelineTest >> test07SharedMemory [
	"Case 7: Shared Memory
	Demonstrates a parallel reduction within a workgroup."

	| inputData inputBuffer resultBuffer computePipeline commandBuffer computePass transferBuffer mappedAddress resultData numElements numWorkgroups byteSize rwBindings roBindings |
	
	numElements := 1024. "16 workgroups of 64 threads each"
	numWorkgroups := SDL3TestComputeSharedMemoryShaderSource dispatchWorkgroupCountXFor: numElements.
	byteSize := numElements * FFIFloat32 externalTypeSize.

	"1. Prepare data (all 1s, sum of 64 ones = 64)"
	inputData := FFIArray newType: FFIFloat32 size: numElements.
	1 to: numElements do: [ :i | inputData at: i put: 1.0 ].

	"2. Create GPU buffers"
	inputBuffer := gpuDevice
		newGPUBufferUsage: SDL_GPU_BUFFERUSAGE_COMPUTE_STORAGE_READ
		size: byteSize.
	"Output needs 1 float per workgroup"
	resultBuffer := gpuDevice
		newGPUBufferUsage: SDL_GPU_BUFFERUSAGE_COMPUTE_STORAGE_WRITE
		size: numWorkgroups * FFIFloat32 externalTypeSize.
	transferBuffer := gpuDevice newUploadTransferBuffer: byteSize.

	"3. Upload input data"
	mappedAddress := gpuDevice mapGPUTransferBuffer: transferBuffer cycle: false.
	LibC memCopy: inputData getHandle to: mappedAddress size: byteSize.
	gpuDevice unmapGPUTransferBuffer: transferBuffer.

	commandBuffer := gpuDevice acquireGPUCommandBuffer.
	
	"A. Upload"
	commandBuffer beginGPUCopyPass
		uploadToGPUBufferSource: (SDL_GPUTransferBufferLocation new transferBuffer: transferBuffer; offset: 0; yourself)
		destination: (SDL_GPUBufferRegion new buffer: inputBuffer; offset: 0; size: byteSize; yourself)
		cycle: false;
		end.

	"B. Compute"
	computePipeline := SDL3TestComputeSharedMemoryShaderSource newComputePipelineAmong: shaderFormats device: gpuDevice.

	rwBindings := FFIArray newType: SDL3GPUStorageBufferReadWriteBinding size: 1.
	rwBindings first buffer: resultBuffer; cycle: false.
	roBindings := FFIArray newType: ExternalAddress size: 1.
	roBindings at: 1 put: inputBuffer getHandle.

	computePass := commandBuffer beginGPUComputePassStorageTextureBindings: nil numStorageTextureBindings: 0 storageBufferBindings: rwBindings numStorageBufferBindings: 1.
	computePass bindGPUComputePipeline: computePipeline.
	computePass bindGPUComputeStorageBuffersFirstSlot: 0 storageBuffers: roBindings numBindings: 1.
	computePass dispatchWorkgroupCountX: numWorkgroups y: 1 z: 1.
	computePass end.
	
	sdl assertSuccess: commandBuffer submit.

	"4. Download results"
	gpuDevice releaseGPUTransferBuffer: transferBuffer.
	transferBuffer := gpuDevice newDownloadTransferBuffer: numWorkgroups * FFIFloat32 externalTypeSize.
	commandBuffer := gpuDevice acquireGPUCommandBuffer.
	commandBuffer beginGPUCopyPass
		downloadFromGPUBufferSource: (SDL_GPUBufferRegion new buffer: resultBuffer; offset: 0; size: numWorkgroups * FFIFloat32 externalTypeSize; yourself)
		destination: (SDL_GPUTransferBufferLocation new transferBuffer: transferBuffer; offset: 0; yourself);
		end.
	sdl assertSuccess: commandBuffer submit.

	gpuDevice waitForGPUIdle.

	"5. Assert"
	mappedAddress := gpuDevice mapGPUTransferBuffer: transferBuffer cycle: false.
	resultData := FFIArray fromHandle: mappedAddress type: FFIFloat32 size: numWorkgroups.
	
	"Every workgroup of 64 threads should produce the sum of 64 ones = 64.0"
	1 to: numWorkgroups do: [ :i |
		self assert: (resultData at: i) equals: 64.0 ].
	
	gpuDevice unmapGPUTransferBuffer: transferBuffer.

	"Cleanup"
	gpuDevice releaseGPUComputePipeline: computePipeline.
	gpuDevice releaseGPUBuffer: inputBuffer.
	gpuDevice releaseGPUBuffer: resultBuffer.
	gpuDevice releaseGPUTransferBuffer: transferBuffer
]

{ #category : 'tests' }
SDL3ComputePipelineTest >> test08IndirectDispatch [
	"Case 8: Indirect Dispatch
	Demonstrates reading workgroup counts from a GPU buffer."

	| indirectData indirectBuffer inputData inputBuffer resultBuffer computePipeline commandBuffer computePass transferBuffer mappedAddress resultData numElements byteSize rwBindings roBindings |
	
	numElements := 1024.
	byteSize := numElements * FFIFloat32 externalTypeSize.

	"1. Prepare indirect commands"
	indirectData := FFIArray newType: SDL3GPUIndirectDispatchCommand size: 1.
	indirectData first
		groupcountX: (SDL3TestComputeMathShaderSource dispatchWorkgroupCountXFor: numElements);
		groupcountY: 1;
		groupcountZ: 1.

	"2. Prepare math data"
	inputData := FFIArray newType: FFIFloat32 size: numElements.
	1 to: numElements do: [ :i | inputData at: i put: i asFloat ].

	"3. Create GPU buffers"
	indirectBuffer := gpuDevice
		newGPUBufferUsage: SDL_GPU_BUFFERUSAGE_INDIRECT
		size: SDL3GPUIndirectDispatchCommand structureSize.
	inputBuffer := gpuDevice
		newGPUBufferUsage: SDL_GPU_BUFFERUSAGE_COMPUTE_STORAGE_READ
		size: byteSize.
	resultBuffer := gpuDevice
		newGPUBufferUsage: SDL_GPU_BUFFERUSAGE_COMPUTE_STORAGE_WRITE
		size: byteSize.
	
	"4. Upload data"
	transferBuffer := gpuDevice newUploadTransferBuffer: SDL3GPUIndirectDispatchCommand structureSize + byteSize.
	mappedAddress := gpuDevice mapGPUTransferBuffer: transferBuffer cycle: false.
	
	"Upload indirect command at offset 0"
	LibC memCopy: indirectData getHandle to: mappedAddress size: SDL3GPUIndirectDispatchCommand structureSize.
	"Upload input data at offset after indirect struct"
	LibC memCopy: inputData getHandle to: mappedAddress + SDL3GPUIndirectDispatchCommand structureSize size: byteSize.
	
	gpuDevice unmapGPUTransferBuffer: transferBuffer.

	commandBuffer := gpuDevice acquireGPUCommandBuffer.
	commandBuffer beginGPUCopyPass
		uploadToGPUBufferSource: (SDL_GPUTransferBufferLocation new transferBuffer: transferBuffer; offset: 0; yourself)
		destination: (SDL_GPUBufferRegion new buffer: indirectBuffer; offset: 0; size: SDL3GPUIndirectDispatchCommand structureSize; yourself)
		cycle: false;
		uploadToGPUBufferSource: (SDL_GPUTransferBufferLocation new transferBuffer: transferBuffer; offset: SDL3GPUIndirectDispatchCommand structureSize; yourself)
		destination: (SDL_GPUBufferRegion new buffer: inputBuffer; offset: 0; size: byteSize; yourself)
		cycle: false;
		end.

	"5. Compute"
	computePipeline := SDL3TestComputeMathShaderSource newComputePipelineAmong: shaderFormats device: gpuDevice.

	rwBindings := FFIArray newType: SDL3GPUStorageBufferReadWriteBinding size: 1.
	rwBindings first buffer: resultBuffer; cycle: false.
	roBindings := FFIArray newType: ExternalAddress size: 1.
	roBindings at: 1 put: inputBuffer getHandle.

	computePass := commandBuffer beginGPUComputePassStorageTextureBindings: nil numStorageTextureBindings: 0 storageBufferBindings: rwBindings numStorageBufferBindings: 1.
	computePass bindGPUComputePipeline: computePipeline.
	computePass bindGPUComputeStorageBuffersFirstSlot: 0 storageBuffers: roBindings numBindings: 1.
	
	computePass dispatchGPUComputeIndirectBuffer: indirectBuffer offset: 0.
	computePass end.
	
	sdl assertSuccess: commandBuffer submit.

	"6. Download results"
	gpuDevice releaseGPUTransferBuffer: transferBuffer.
	transferBuffer := gpuDevice newDownloadTransferBuffer: byteSize.
	commandBuffer := gpuDevice acquireGPUCommandBuffer.
	commandBuffer beginGPUCopyPass
		downloadFromGPUBufferSource: (SDL_GPUBufferRegion new buffer: resultBuffer; offset: 0; size: byteSize; yourself)
		destination: (SDL_GPUTransferBufferLocation new transferBuffer: transferBuffer; offset: 0; yourself);
		end.
	sdl assertSuccess: commandBuffer submit.

	gpuDevice waitForGPUIdle.

	"7. Assert"
	mappedAddress := gpuDevice mapGPUTransferBuffer: transferBuffer cycle: false.
	resultData := FFIArray fromHandle: mappedAddress type: FFIFloat32 size: numElements.
	1 to: numElements do: [ :i |
		self assert: (resultData at: i) equals: (i * 2) asFloat ].
	
	gpuDevice unmapGPUTransferBuffer: transferBuffer.

	"Cleanup"
	gpuDevice releaseGPUComputePipeline: computePipeline.
	gpuDevice releaseGPUBuffer: indirectBuffer.
	gpuDevice releaseGPUBuffer: inputBuffer.
	gpuDevice releaseGPUBuffer: resultBuffer.
	gpuDevice releaseGPUTransferBuffer: transferBuffer
]
