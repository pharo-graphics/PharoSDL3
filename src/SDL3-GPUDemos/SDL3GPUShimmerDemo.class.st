"
I demonstrate a mock UI with a Shimmer Loading Effect.
"
Class {
	#name : 'SDL3GPUShimmerDemo',
	#superclass : 'SDL3GPUDemoApp',
	#instVars : [
		'gpuPipeline',
		'vertexBuffer',
		'instanceBuffer',
		'indexBuffer',
		'vertexBufferBindings',
		'instanceBufferBinding',
		'indexBufferBinding',
		'colorTargetInfos',
		'uniforms',
		'numberOfInstances',
		'effectType'
	],
	#pools : [
		'SDL3AllEnumerations'
	],
	#category : 'SDL3-GPUDemos-Shimmer',
	#package : 'SDL3-GPUDemos',
	#tag : 'Shimmer'
}

{ #category : 'lifecycle' }
SDL3GPUShimmerDemo >> close [

	gpuPipeline ifNotNil: [
		gpuDevice releaseGPUGraphicsPipeline: gpuPipeline.
		gpuPipeline := nil ].

	vertexBuffer ifNotNil: [
		gpuDevice releaseGPUBuffer: vertexBuffer.
		vertexBuffer := nil ].
		
	instanceBuffer ifNotNil: [
		gpuDevice releaseGPUBuffer: instanceBuffer.
		instanceBuffer := nil ].

	indexBuffer ifNotNil: [
		gpuDevice releaseGPUBuffer: indexBuffer.
		indexBuffer := nil ].

	super close
]

{ #category : 'rendering' }
SDL3GPUShimmerDemo >> doRenderPassesOn: swapchainTexture with: commandBuffer [

	| renderPass |
	colorTargetInfos first texture: swapchainTextureHolder value.

	renderPass := commandBuffer
					 beginGPURenderPassColorTargetInfos: colorTargetInfos
					 depthStencilTargetInfo: nil.

	renderPass bindGPUGraphicsPipeline: gpuPipeline.
	renderPass bindGPUVertexBuffersFirstSlot: 0 bindings: vertexBufferBindings.
	renderPass bindGPUIndexBufferBinding: indexBufferBinding indexElementSize: SDL_GPU_INDEXELEMENTSIZE_16BIT.
	
	"Push Fragment Uniforms (space3 corresponds to Fragment stage per ground truth)"
	commandBuffer 
		pushGPUFragmentUniformDataSlotIndex: 0 
		data: uniforms
		length: SDL3GPUShimmerUniforms structureSize.

	"Push Vertex Uniforms (space1 corresponds to Vertex stage)"
	commandBuffer 
		pushGPUVertexUniformDataSlotIndex: 0 
		data: uniforms
		length: SDL3GPUShimmerUniforms structureSize.

	"Draw 1 quad (6 indices) per instance"
	renderPass drawGPUIndexedPrimitivesNumIndices: 6 numInstances: numberOfInstances firstIndex: 0 vertexOffset: 0 firstInstance: 0.

	renderPass end
]

{ #category : 'initialization' }
SDL3GPUShimmerDemo >> initialize [

	super initialize.

	effectType := 0.

	vertexBufferBindings := FFIArray newType: SDL_GPUBufferBinding size: 2.

	instanceBufferBinding := FFIExternalArray externalNewType: SDL_GPUBufferBinding size: 1.
	instanceBufferBinding autoRelease.

	colorTargetInfos := FFIArray newType: SDL_GPUColorTargetInfo size: 1.
	colorTargetInfos first
		storeOp: SDL_GPU_STOREOP_STORE;
		loadOp: SDL_GPU_LOADOP_CLEAR.
	colorTargetInfos first clearColor updateFrom: (Color r: 0.05 g: 0.05 b: 0.1). "Dark theme"

	uniforms := SDL3GPUShimmerUniforms externalNew.
	uniforms autoRelease.
	uniforms
		effectType: effectType;
		time: 0.0;
		cornerRadius: 0.0; "Overridden by instance data"
		baseColor: (SDL3FColor r: 0.2 g: 0.2 b: 0.25 a: 1.0);
		highlightColor: (SDL3FColor r: 0.3 g: 0.3 b: 0.35 a: 1.0)
]

{ #category : 'initialization' }
SDL3GPUShimmerDemo >> initializeGeometry [

	| instances |
	instances := self mockUIPanels.
	numberOfInstances := instances size.
	self uploadGeometry: instances
]

{ #category : 'initialization' }
SDL3GPUShimmerDemo >> initializePipeline [

	| vertexShader fragmentShader shaderFormats vertexAttributes vertexBindings pipelineCreateInfo colorTargets |
	shaderFormats := gpuDevice gpuShaderFormatsAsArray.

	vertexShader := SDL3GPUShimmerVertexShaderSource newShaderAmong: shaderFormats device: gpuDevice.
	fragmentShader := SDL3GPUShimmerFragmentShaderSource newShaderAmong: shaderFormats device: gpuDevice.

	vertexBindings := FFIExternalArray externalNewType: SDL_GPUVertexBufferDescription size: 2.
	vertexBindings autoRelease.
	
	"Binding 0: Quad vertices (per vertex)"
	(vertexBindings at: 1)
		slot: 0;
		pitch: SDL3GPUQuadVertex structureSize;
		inputRate: SDL_GPU_VERTEXINPUTRATE_VERTEX;
		instanceStepRate: 0.
		
	"Binding 1: Instance Data (per instance)"
	(vertexBindings at: 2)
		slot: 1;
		pitch: SDL3GPUShimmerInstance structureSize;
		inputRate: SDL_GPU_VERTEXINPUTRATE_INSTANCE;
		instanceStepRate: 0.

	vertexAttributes := FFIExternalArray externalNewType: SDL_GPUVertexAttribute size: 4.
	vertexAttributes autoRelease.

	"Quad Position (Attribute 0)"
	(vertexAttributes at: 1)
		bufferSlot: 0;
		format: SDL_GPU_VERTEXELEMENTFORMAT_FLOAT3;
		location: 0;
		offset: 0.
		
	"Quad TexCoord (Attribute 1)"
	(vertexAttributes at: 2)
		bufferSlot: 0;
		format: SDL_GPU_VERTEXELEMENTFORMAT_FLOAT2;
		location: 1;
		offset: 3 * FFIFloat32 externalTypeSize.
		
	"Instance Bounds (Attribute 2)"
	(vertexAttributes at: 3)
		bufferSlot: 1;
		format: SDL_GPU_VERTEXELEMENTFORMAT_FLOAT4;
		location: 2;
		offset: 0.

	"Instance Extra/Radius (Attribute 3)"
	(vertexAttributes at: 4)
		bufferSlot: 1;
		format: SDL_GPU_VERTEXELEMENTFORMAT_FLOAT4;
		location: 3;
		offset: 16.

	colorTargets := FFIExternalArray externalNewType: SDL_GPUColorTargetDescription size: 1.
	colorTargets autoRelease.
	colorTargets first 
		format: (gpuDevice getGPUSwapchainTextureFormatIntoWindow: window);
		blendState: (SDL_GPUColorTargetBlendState new
			enableBlend: true;
			srcColorBlendfactor: SDL_GPU_BLENDFACTOR_SRC_ALPHA;
			dstColorBlendfactor: SDL_GPU_BLENDFACTOR_ONE_MINUS_SRC_ALPHA;
			colorBlendOp: SDL_GPU_BLENDOP_ADD;
			srcAlphaBlendfactor: SDL_GPU_BLENDFACTOR_ONE_MINUS_SRC_ALPHA;
			dstAlphaBlendfactor: SDL_GPU_BLENDFACTOR_ZERO;
			alphaBlendOp: SDL_GPU_BLENDOP_ADD;
			yourself).

	pipelineCreateInfo := SDL3GPUGraphicsPipelineCreateInfo externalNew.
	pipelineCreateInfo autoRelease.
	pipelineCreateInfo
		primitiveType: SDL_GPU_PRIMITIVETYPE_TRIANGLELIST;
		vertexShader: vertexShader;
		fragmentShader: fragmentShader.
	pipelineCreateInfo targetInfo
		colorTargetDescriptions: colorTargets;
		numColorTargets: 1;
		hasDepthStencilTarget: false.
	pipelineCreateInfo vertexInputState
		vertexAttributes: vertexAttributes;
		numVertexAttributes: 4;
		vertexBufferDescriptions: vertexBindings;
		numVertexBuffers: 2.

	gpuPipeline := gpuDevice newGPUGraphicsPipelineCreateinfo: pipelineCreateInfo.

	gpuDevice releaseGPUShader: vertexShader.
	gpuDevice releaseGPUShader: fragmentShader.
]

{ #category : 'initialization' }
SDL3GPUShimmerDemo >> mockUIPanels [
	"Create a social network feed loading state."
	| panels |
	panels := OrderedCollection new.
	
	"Post 1"
	"Avatar (Circle)"
	panels add: (SDL3GPUShimmerInstance new x: 40/1280.0; y: 40/720.0; w: 60/1280.0; h: 60/720.0; radius: 30.0).
	"Name & Info"
	panels add: (SDL3GPUShimmerInstance new x: 120/1280.0; y: 45/720.0; w: 300/1280.0; h: 20/720.0; radius: 8.0).
	panels add: (SDL3GPUShimmerInstance new x: 120/1280.0; y: 75/720.0; w: 200/1280.0; h: 15/720.0; radius: 8.0).
	"Main Content"
	panels add: (SDL3GPUShimmerInstance new x: 40/1280.0; y: 120/720.0; w: 1200/1280.0; h: 400/720.0; radius: 16.0).
	"Actions"
	panels add: (SDL3GPUShimmerInstance new x: 40/1280.0; y: 540/720.0; w: 80/1280.0; h: 30/720.0; radius: 10.0).
	panels add: (SDL3GPUShimmerInstance new x: 140/1280.0; y: 540/720.0; w: 80/1280.0; h: 30/720.0; radius: 10.0).
	panels add: (SDL3GPUShimmerInstance new x: 240/1280.0; y: 540/720.0; w: 80/1280.0; h: 30/720.0; radius: 10.0).

	^ panels
]

{ #category : 'lifecycle' }
SDL3GPUShimmerDemo >> open [

	super open.
	self initializeGeometry.
	self initializePipeline
]

{ #category : 'hooks' }
SDL3GPUShimmerDemo >> step [

	uniforms 
		time: Time millisecondClockValue / 1000.0;
		resolutionX: (window extent x max: 1) asFloat;
		resolutionY: (window extent y max: 1) asFloat.

	self render
]

{ #category : 'accessing' }
SDL3GPUShimmerDemo >> updatedTitle [

	| effectName |
	effectType = 0 ifTrue: [ effectName := 'Linear Sweep' ].
	effectType = 1 ifTrue: [ effectName := 'Pulsate' ].
	effectType = 2 ifTrue: [ effectName := 'Angled Sweep' ].

	^ super updatedTitle, (' - Effect: {1} (LEFT/RIGHT to change)' format: { effectName })
]

{ #category : 'initialization' }
SDL3GPUShimmerDemo >> uploadGeometry: instances [
	"Upload quad vertices, indices, and instance data (panels)."

	| vertices indices vTransfer iTransfer instTransfer mappedAddress vSize iSize instSize copyCommandBuffer mappedInstances |

	"1. Quad Vertices (Standard 1x1 quad)"
	vSize := 4 * SDL3GPUQuadVertex structureSize.
	vertexBuffer := gpuDevice newGPUBufferUsage: SDL_GPU_BUFFERUSAGE_VERTEX size: vSize.
	vTransfer := gpuDevice newUploadTransferBuffer: vSize.
	mappedAddress := gpuDevice mapGPUTransferBuffer: vTransfer cycle: false.
	
	vertices := FFIArray fromHandle: mappedAddress type: SDL3GPUQuadVertex size: 4.
	(vertices at: 1) x: 0.0; y: 0.0; z: 0.0; u: 0.0; v: 0.0.
	(vertices at: 2) x: 1.0; y: 0.0; z: 0.0; u: 1.0; v: 0.0.
	(vertices at: 3) x: 1.0; y: 1.0; z: 0.0; u: 1.0; v: 1.0.
	(vertices at: 4) x: 0.0; y: 1.0; z: 0.0; u: 0.0; v: 1.0.
	
	gpuDevice unmapGPUTransferBuffer: vTransfer.

	"2. Quad Indices"
	iSize := 6 * 2. "16-bit indices"
	indexBuffer := gpuDevice newGPUBufferUsage: SDL_GPU_BUFFERUSAGE_INDEX size: iSize.
	iTransfer := gpuDevice newUploadTransferBuffer: iSize.
	mappedAddress := gpuDevice mapGPUTransferBuffer: iTransfer cycle: false.
	
	indices := FFIArray fromHandle: mappedAddress type: FFIUInt16 size: 6.
	indices at: 1 put: 0. indices at: 2 put: 1. indices at: 3 put: 2.
	indices at: 4 put: 0. indices at: 5 put: 2. indices at: 6 put: 3.
	
	gpuDevice unmapGPUTransferBuffer: iTransfer.

	"3. Instance Data (Social Network Layout)"
	instSize := instances size * SDL3GPUShimmerInstance structureSize.
	instanceBuffer := gpuDevice newGPUBufferUsage: SDL_GPU_BUFFERUSAGE_VERTEX size: instSize.
	instTransfer := gpuDevice newUploadTransferBuffer: instSize.
	mappedAddress := gpuDevice mapGPUTransferBuffer: instTransfer cycle: false.
	
	mappedInstances := FFIArray fromHandle: mappedAddress type: SDL3GPUShimmerInstance size: instances size.
	instances withIndexDo: [ :inst :idx |
		(mappedInstances at: idx)
			x: inst x;
			y: inst y;
			w: inst w;
			h: inst h;
			radius: inst radius.
	].
	gpuDevice unmapGPUTransferBuffer: instTransfer.

	"Upload"
	copyCommandBuffer := gpuDevice acquireGPUCommandBuffer.
	[ :copyPass |
		copyPass
			uploadToGPUBufferSource: (SDL_GPUTransferBufferLocation new
					transferBuffer: vTransfer;
					offset: 0;
					yourself)
			destination: (SDL_GPUBufferRegion new
					buffer: vertexBuffer;
					offset: 0;
					size: vSize;
					yourself)
			cycle: false.
		copyPass
			uploadToGPUBufferSource: (SDL_GPUTransferBufferLocation new
					transferBuffer: iTransfer;
					offset: 0;
					yourself)
			destination: (SDL_GPUBufferRegion new
					buffer: indexBuffer;
					offset: 0;
					size: iSize;
					yourself)
			cycle: false.
		copyPass
			uploadToGPUBufferSource: (SDL_GPUTransferBufferLocation new
					transferBuffer: instTransfer;
					offset: 0;
					yourself)
			destination: (SDL_GPUBufferRegion new
					buffer: instanceBuffer;
					offset: 0;
					size: instSize;
					yourself)
			cycle: false.
		copyPass end ] value: copyCommandBuffer beginGPUCopyPass.
	copyCommandBuffer submit.

	gpuDevice releaseGPUTransferBuffer: vTransfer.
	gpuDevice releaseGPUTransferBuffer: iTransfer.
	gpuDevice releaseGPUTransferBuffer: instTransfer.

	vertexBufferBindings first buffer: vertexBuffer; offset: 0.
	vertexBufferBindings second buffer: instanceBuffer; offset: 0.
	
	indexBufferBinding := SDL_GPUBufferBinding externalNew buffer: indexBuffer; offset: 0; yourself.
	indexBufferBinding autoRelease.
]

{ #category : 'hooks' }
SDL3GPUShimmerDemo >> visitKeyboardDownEvent: aKeyboardDownEvent [

	super visitKeyboardDownEvent: aKeyboardDownEvent.
	
	aKeyboardDownEvent key = SDLK_RIGHT asInteger ifTrue: [
		effectType := (effectType + 1) \\ 3.
		uniforms effectType: effectType ].
	aKeyboardDownEvent key = SDLK_LEFT asInteger ifTrue: [
		effectType := effectType - 1.
		effectType < 0 ifTrue: [ effectType := 2 ].
		uniforms effectType: effectType ].

	self updateTitle
]
