"
I test the SDL3 GPU graphics pipeline in a headless environment.
I render to off-screen textures (Color Targets) and verify the results.
I also serve as a pedagogical reference for developers.
"
Class {
	#name : 'SDL3GraphicsPipelineTest',
	#superclass : 'SDL3GPUTest',
	#instVars : [
		'shaderFormats'
	],
	#pools : [
		'SDL3AllEnumerations',
		'SDL3ZConstants'
	],
	#category : 'SDL3-GPU-Tests-GraphicsPipeline',
	#package : 'SDL3-GPU-Tests',
	#tag : 'GraphicsPipeline'
}

{ #category : 'running' }
SDL3GraphicsPipelineTest >> setUp [

	super setUp.

	shaderFormats := gpuDevice gpuShaderFormatsAsArray
]

{ #category : 'tests' }
SDL3GraphicsPipelineTest >> test01ClearTarget [
	"Case 1: Clear Screen
	Begin a render pass on an off-screen texture with SDL_GPU_LOADOP_CLEAR and a specific clear color.
	Assert that the texture is correctly cleared."

	| colorTarget commandBuffer transferBuffer resultData texWidth texHeight byteSize colorTargetInfos |


	
	texWidth := 64.
	texHeight := 64.
	byteSize := texWidth * texHeight * FFIUInt32 externalTypeSize. "R8G8B8A8"

	"1. Create GPU result texture"
	colorTarget := gpuDevice
		new2DGPUTextureFormat: SDL_GPU_TEXTUREFORMAT_R8G8B8A8_UNORM
		usage: SDL_GPU_TEXTUREUSAGE_COLOR_TARGET
		width: texWidth
		height: texHeight.
	
	"2. Setup render pass and clear"
	commandBuffer := gpuDevice acquireGPUCommandBuffer.
	
	colorTargetInfos := FFIArray newType: SDL_GPUColorTargetInfo size: 1.
	colorTargetInfos first
		texture: colorTarget;
		storeOp: SDL_GPU_STOREOP_STORE;
		loadOp: SDL_GPU_LOADOP_CLEAR.
	colorTargetInfos first clearColor r: 1.0; g: 0.0; b: 0.0; a: 1.0. "Red"

	commandBuffer renderPassTargets: colorTargetInfos depthStencil: nil do: [ :renderPass | ].
		
	commandBuffer submit.
	
	"3. Download results"
	transferBuffer := gpuDevice newDownloadTransferBuffer: byteSize.
	commandBuffer := gpuDevice acquireGPUCommandBuffer.
	commandBuffer copyPassDo: [ :copyPass |
		copyPass
			downloadTexture: (SDL3GPUTextureRegion new texture: colorTarget; w: texWidth; h: texHeight; d: 1; yourself)
			destination: (SDL3GPUTextureTransferInfo new transferBuffer: transferBuffer; offset: 0; yourself) ].
	commandBuffer submit.

	gpuDevice waitForGPUIdle.

	"4. Assert"
	gpuDevice mapTransferBuffer: transferBuffer cycle: false do: [ :mappedAddress |
		resultData := FFIArray fromHandle: mappedAddress type: FFIUInt8 size: byteSize.
		
		"Check a few pixels (first, middle, last) - Should be solid Red (255, 0, 0, 255)"
		{ 1 . (byteSize // 2) + 1 . (byteSize - 3) } do: [ :baseIdx |
		self assert: (resultData at: baseIdx) equals: 255. "R"
		self assert: (resultData at: baseIdx + 1) equals: 0. "G"
		self assert: (resultData at: baseIdx + 2) equals: 0. "B"
		self assert: (resultData at: baseIdx + 3) equals: 255. "A" ]. ].

	"Cleanup"
	colorTarget release.
	transferBuffer release
]

{ #category : 'tests' }
SDL3GraphicsPipelineTest >> test02FullscreenQuad [
	"Case 2: Fullscreen Quad
	Draws a solid green quad covering the whole screen using explicit vertices."

	| colorTarget vertexBuffer graphicsPipeline commandBuffer transferBuffer resultData texWidth texHeight byteSize colorTargetInfos vertexData vertexBindings vertexAttributes colorTargetDescriptions vertexBufferBindings |


	
	texWidth := 64.
	texHeight := 64.
	byteSize := texWidth * texHeight * FFIUInt32 externalTypeSize.

	"1. Create GPU resources"
	colorTarget := gpuDevice
		new2DGPUTextureFormat: SDL_GPU_TEXTUREFORMAT_R8G8B8A8_UNORM
		usage: SDL_GPU_TEXTUREUSAGE_COLOR_TARGET
		width: texWidth
		height: texHeight.
	
	"6 vertices for 2 triangles forming a quad: (-1,-1) to (1,1)"
	vertexData := FFIArray newType: SDL3GPUQuadVertex size: 6.
	"Triangle 1"
	(vertexData at: 1) x: -1.0; y: -1.0; z: 0.0.
	(vertexData at: 2) x: 1.0; y: -1.0; z: 0.0.
	(vertexData at: 3) x: -1.0; y: 1.0; z: 0.0.
	"Triangle 2"
	(vertexData at: 4) x: -1.0; y: 1.0; z: 0.0.
	(vertexData at: 5) x: 1.0; y: -1.0; z: 0.0.
	(vertexData at: 6) x: 1.0; y: 1.0; z: 0.0.

	vertexBuffer := gpuDevice
		newGPUBufferUsage: SDL_GPU_BUFFERUSAGE_VERTEX
		size: 6 * SDL3GPUQuadVertex structureSize.
	
	"Upload vertex data"
	transferBuffer := gpuDevice newUploadTransferBuffer: 6 * SDL3GPUQuadVertex structureSize.
	gpuDevice mapTransferBuffer: transferBuffer cycle: false do: [ :mappedAddress |
		LibC memCopy: vertexData to: mappedAddress size: 6 * SDL3GPUQuadVertex structureSize. ].

	commandBuffer := gpuDevice acquireGPUCommandBuffer.
	commandBuffer copyPassDo: [ :copyPass |
		copyPass
			uploadBuffer: (SDL_GPUTransferBufferLocation new transferBuffer: transferBuffer; offset: 0; yourself)
			destination: (SDL_GPUBufferRegion new buffer: vertexBuffer; offset: 0; size: 6 * SDL3GPUQuadVertex structureSize; yourself)
			cycle: false ].

	"2. Create Pipeline"
	vertexBindings := FFIExternalArray externalNewType: SDL_GPUVertexBufferDescription size: 1.
	vertexBindings first
		slot: 0;
		inputRate: SDL_GPU_VERTEXINPUTRATE_VERTEX;
		instanceStepRate: 0;
		pitch: SDL3GPUQuadVertex structureSize.

	vertexAttributes := FFIExternalArray externalNewType: SDL_GPUVertexAttribute size: 1.
	vertexAttributes first
		bufferSlot: 0;
		format: SDL_GPU_VERTEXELEMENTFORMAT_FLOAT3;
		location: 0;
		offset: 0.

	colorTargetDescriptions := FFIExternalArray externalNewType: SDL_GPUColorTargetDescription size: 1.
	colorTargetDescriptions first 
		format: SDL_GPU_TEXTUREFORMAT_R8G8B8A8_UNORM;
		blendState: SDL_GPUColorTargetBlendState new.

	graphicsPipeline := gpuDevice newGraphicsPipeline: [ :info |
		info
		primitiveType: SDL_GPU_PRIMITIVETYPE_TRIANGLELIST;
		vertexShader: (SDL3TestGraphicsQuadVertexShaderSource newShaderAmong: shaderFormats device: gpuDevice);
		fragmentShader: (SDL3TestGraphicsQuadFragmentShaderSource newShaderAmong: shaderFormats device: gpuDevice).
		
		info vertexInputState
		vertexBufferDescriptions: vertexBindings;
		numVertexBuffers: 1;
		vertexAttributes: vertexAttributes;
		numVertexAttributes: 1.
		
		info targetInfo
		colorTargetDescriptions: colorTargetDescriptions;
		numColorTargets: 1.
		
	].

	"3. Render"
	colorTargetInfos := FFIArray newType: SDL_GPUColorTargetInfo size: 1.
	colorTargetInfos first
		texture: colorTarget;
		storeOp: SDL_GPU_STOREOP_STORE;
		loadOp: SDL_GPU_LOADOP_CLEAR.
	colorTargetInfos first clearColor r: 0.0; g: 0.0; b: 0.0; a: 1.0. "Initial black"

	vertexBufferBindings := FFIArray newType: SDL_GPUBufferBinding size: 1.
	vertexBufferBindings first buffer: vertexBuffer; offset: 0.
	
	commandBuffer renderPassTargets: colorTargetInfos depthStencil: nil do: [ :renderPass |
		renderPass
			pipeline: graphicsPipeline;
			vertexBuffers: vertexBufferBindings slot: 0;
			drawPrimitives: 6 instances: 1 firstVertex: 0 firstInstance: 0 ].
	
	commandBuffer submit.
	
	"4. Download results"
	transferBuffer release.
	transferBuffer := gpuDevice newDownloadTransferBuffer: byteSize.
	commandBuffer := gpuDevice acquireGPUCommandBuffer.
	commandBuffer copyPassDo: [ :copyPass |
		copyPass
			downloadTexture: (SDL3GPUTextureRegion new texture: colorTarget; w: texWidth; h: texHeight; d: 1; yourself)
			destination: (SDL3GPUTextureTransferInfo new transferBuffer: transferBuffer; offset: 0; yourself) ].
	commandBuffer submit.

	gpuDevice waitForGPUIdle.

	"5. Assert - Should be solid Green (0, 255, 0, 255)"
	gpuDevice mapTransferBuffer: transferBuffer cycle: false do: [ :mappedAddress |
		resultData := FFIArray fromHandle: mappedAddress type: FFIUInt8 size: byteSize.
		
		{ 1 . (byteSize // 2) + 1 . (byteSize - 3) } do: [ :baseIdx |
		self assert: (resultData at: baseIdx) equals: 0. "R"
		self assert: (resultData at: baseIdx + 1) equals: 255. "G"
		self assert: (resultData at: baseIdx + 2) equals: 0. "B"
		self assert: (resultData at: baseIdx + 3) equals: 255. "A" ]. ].

	"Cleanup"
	graphicsPipeline release.
	vertexBuffer release.
	colorTarget release.
	transferBuffer release
]

{ #category : 'tests' }
SDL3GraphicsPipelineTest >> test03VertexColors [
	"Case 3: Vertex Attributes & Interpolation
	Draws a triangle with Red, Green, Blue vertices and verifies interpolated colors."

	| colorTarget vertexBuffer graphicsPipeline commandBuffer transferBuffer resultData texWidth texHeight byteSize colorTargetInfos vertexData vertexBindings vertexAttributes colorTargetDescriptions vertexBufferBindings topIdx centerIdx |


	
	texWidth := 64.
	texHeight := 64.
	byteSize := texWidth * texHeight * FFIUInt32 externalTypeSize.

	"1. Create GPU resources"
	colorTarget := gpuDevice
		new2DGPUTextureFormat: SDL_GPU_TEXTUREFORMAT_R8G8B8A8_UNORM
		usage: SDL_GPU_TEXTUREUSAGE_COLOR_TARGET
		width: texWidth
		height: texHeight.
	
	"3 vertices for a large triangle"
	vertexData := FFIArray newType: SDL3TestGraphicsColorVertex size: 3.
	"Top: Red"
	(vertexData at: 1) x: 0.0; y: 1.0; z: 0.0; r: 1.0; g: 0.0; b: 0.0; a: 1.0.
	"Bottom-Right: Green"
	(vertexData at: 2) x: 1.0; y: -1.0; z: 0.0; r: 0.0; g: 1.0; b: 0.0; a: 1.0.
	"Bottom-Left: Blue"
	(vertexData at: 3) x: -1.0; y: -1.0; z: 0.0; r: 0.0; g: 0.0; b: 1.0; a: 1.0.

	vertexBuffer := gpuDevice
		newGPUBufferUsage: SDL_GPU_BUFFERUSAGE_VERTEX
		size: 3 * SDL3TestGraphicsColorVertex structureSize.
	
	"Upload vertex data"
	transferBuffer := gpuDevice newUploadTransferBuffer: 3 * SDL3TestGraphicsColorVertex structureSize.
	gpuDevice mapTransferBuffer: transferBuffer cycle: false do: [ :mappedAddress |
		LibC memCopy: vertexData to: mappedAddress size: 3 * SDL3TestGraphicsColorVertex structureSize. ].

	commandBuffer := gpuDevice acquireGPUCommandBuffer.
	commandBuffer copyPassDo: [ :copyPass |
		copyPass
			uploadBuffer: (SDL_GPUTransferBufferLocation new transferBuffer: transferBuffer; offset: 0; yourself)
			destination: (SDL_GPUBufferRegion new buffer: vertexBuffer; offset: 0; size: 3 * SDL3TestGraphicsColorVertex structureSize; yourself)
			cycle: false ].

	"2. Create Pipeline"
	vertexBindings := FFIExternalArray externalNewType: SDL_GPUVertexBufferDescription size: 1.
	vertexBindings first
		slot: 0;
		inputRate: SDL_GPU_VERTEXINPUTRATE_VERTEX;
		instanceStepRate: 0;
		pitch: SDL3TestGraphicsColorVertex structureSize.

	vertexAttributes := FFIExternalArray externalNewType: SDL_GPUVertexAttribute size: 2.
	"Position (Attribute 0)"
	vertexAttributes first
		bufferSlot: 0;
		format: SDL_GPU_VERTEXELEMENTFORMAT_FLOAT3;
		location: 0;
		offset: 0.
	"Color (Attribute 1)"
	(vertexAttributes at: 2)
		bufferSlot: 0;
		format: SDL_GPU_VERTEXELEMENTFORMAT_FLOAT4;
		location: 1;
		offset: 3 * FFIFloat32 externalTypeSize. "3 floats * 4 bytes"

	colorTargetDescriptions := FFIExternalArray externalNewType: SDL_GPUColorTargetDescription size: 1.
	colorTargetDescriptions first 
		format: SDL_GPU_TEXTUREFORMAT_R8G8B8A8_UNORM;
		blendState: SDL_GPUColorTargetBlendState new.

	graphicsPipeline := gpuDevice newGraphicsPipeline: [ :info |
		info
		primitiveType: SDL_GPU_PRIMITIVETYPE_TRIANGLELIST;
		vertexShader: (SDL3TestGraphicsColorVertexShaderSource newShaderAmong: shaderFormats device: gpuDevice);
		fragmentShader: (SDL3TestGraphicsColorFragmentShaderSource newShaderAmong: shaderFormats device: gpuDevice).
		
		info vertexInputState
		vertexBufferDescriptions: vertexBindings;
		numVertexBuffers: 1;
		vertexAttributes: vertexAttributes;
		numVertexAttributes: 2.
		
		info targetInfo
		colorTargetDescriptions: colorTargetDescriptions;
		numColorTargets: 1.
		
	].

	"3. Render"
	colorTargetInfos := FFIArray newType: SDL_GPUColorTargetInfo size: 1.
	colorTargetInfos first
		texture: colorTarget;
		storeOp: SDL_GPU_STOREOP_STORE;
		loadOp: SDL_GPU_LOADOP_CLEAR.
	colorTargetInfos first clearColor r: 0.0; g: 0.0; b: 0.0; a: 1.0. "Initial black"

	commandBuffer renderPassTargets: colorTargetInfos do: [ :renderPass |
		vertexBufferBindings := FFIArray newType: SDL_GPUBufferBinding size: 1.
		vertexBufferBindings first buffer: vertexBuffer; offset: 0.
		
		renderPass
			pipeline: graphicsPipeline;
			vertexBuffers: vertexBufferBindings slot: 0;
			drawPrimitives: 3 instances: 1 firstVertex: 0 firstInstance: 0 ].
	
	commandBuffer submit.
	
	"4. Download results"
	transferBuffer release.
	transferBuffer := gpuDevice newDownloadTransferBuffer: byteSize.
	commandBuffer := gpuDevice acquireGPUCommandBuffer.
	commandBuffer copyPassDo: [ :copyPass |
		copyPass
			downloadTexture: (SDL3GPUTextureRegion new texture: colorTarget; w: texWidth; h: texHeight; d: 1; yourself)
			destination: (SDL3GPUTextureTransferInfo new transferBuffer: transferBuffer; offset: 0; yourself) ].
	commandBuffer submit.

	gpuDevice waitForGPUIdle.

	"5. Assert interpolation"
	gpuDevice mapTransferBuffer: transferBuffer cycle: false do: [ :mappedAddress |
		resultData := FFIArray fromHandle: mappedAddress type: FFIUInt8 size: byteSize.
		
		"Top vertex is at (0, 1) in clip space -> (32, 0) in texture"
		"Check a pixel slightly below the top vertex (32, 4) -> Should be Red"
		topIdx := (4 * texWidth + 32) * FFIUInt32 externalTypeSize + 1.
		self assert: (resultData at: topIdx) > 200. "Red"
		
		"Center (32, 32) -> Should be a mix of all colors"
		centerIdx := (32 * texWidth + 32) * FFIUInt32 externalTypeSize + 1.
		self assert: (resultData at: centerIdx) > 0.
		self assert: (resultData at: centerIdx + 1) > 0.
		self assert: (resultData at: centerIdx + 2) > 0. ].

	"Cleanup"
	graphicsPipeline release.
	vertexBuffer release.
	colorTarget release.
	transferBuffer release
]

{ #category : 'tests' }
SDL3GraphicsPipelineTest >> test04GraphicsUniforms [
	"Case 4: Uniforms
	Draws a primitive offset by a vertex uniform with color from a fragment uniform."

	| colorTarget vertexBuffer graphicsPipeline commandBuffer transferBuffer resultData texWidth texHeight byteSize colorTargetInfos vertexData vertexBindings vertexAttributes colorTargetDescriptions vertUniforms fragUniforms vertexBufferBindings trIdx |


	
	texWidth := 64.
	texHeight := 64.
	byteSize := texWidth * texHeight * FFIUInt32 externalTypeSize.

	"1. Create GPU resources"
	colorTarget := gpuDevice
		new2DGPUTextureFormat: SDL_GPU_TEXTUREFORMAT_R8G8B8A8_UNORM
		usage: SDL_GPU_TEXTUREUSAGE_COLOR_TARGET
		width: texWidth
		height: texHeight.
	
	"3 vertices for a small triangle at center"
	vertexData := FFIArray newType: SDL3GPUQuadVertex size: 3.
	(vertexData at: 1) x: -0.1; y: -0.1; z: 0.0.
	(vertexData at: 2) x: 0.1; y: -0.1; z: 0.0.
	(vertexData at: 3) x: 0.0; y: 0.1; z: 0.0.

	vertexBuffer := gpuDevice
		newGPUBufferUsage: SDL_GPU_BUFFERUSAGE_VERTEX
		size: 3 * SDL3GPUQuadVertex structureSize.
	
	"Upload vertex data"
	transferBuffer := gpuDevice newUploadTransferBuffer: 3 * SDL3GPUQuadVertex structureSize.
	gpuDevice mapTransferBuffer: transferBuffer cycle: false do: [ :mappedAddress |
		LibC memCopy: vertexData to: mappedAddress size: 3 * SDL3GPUQuadVertex structureSize. ].

	commandBuffer := gpuDevice acquireGPUCommandBuffer.
	commandBuffer copyPassDo: [ :copyPass |
		copyPass uploadBuffer: (SDL_GPUTransferBufferLocation new transferBuffer: transferBuffer; offset: 0; yourself)
		destination: (SDL_GPUBufferRegion new buffer: vertexBuffer; offset: 0; size: 3 * SDL3GPUQuadVertex structureSize; yourself)
		cycle: false ].

	"2. Create Pipeline"
	vertexBindings := FFIExternalArray externalNewType: SDL_GPUVertexBufferDescription size: 1.
	vertexBindings first
		slot: 0;
		inputRate: SDL_GPU_VERTEXINPUTRATE_VERTEX;
		instanceStepRate: 0;
		pitch: SDL3GPUQuadVertex structureSize.

	vertexAttributes := FFIExternalArray externalNewType: SDL_GPUVertexAttribute size: 1.
	vertexAttributes first
		bufferSlot: 0;
		format: SDL_GPU_VERTEXELEMENTFORMAT_FLOAT3;
		location: 0;
		offset: 0.

	colorTargetDescriptions := FFIExternalArray externalNewType: SDL_GPUColorTargetDescription size: 1.
	colorTargetDescriptions first 
		format: SDL_GPU_TEXTUREFORMAT_R8G8B8A8_UNORM;
		blendState: SDL_GPUColorTargetBlendState new.

	graphicsPipeline := gpuDevice newGraphicsPipeline: [ :info |
		info
		primitiveType: SDL_GPU_PRIMITIVETYPE_TRIANGLELIST;
		vertexShader: (SDL3TestGraphicsUniformVertexShaderSource newShaderAmong: shaderFormats device: gpuDevice);
		fragmentShader: (SDL3TestGraphicsUniformFragmentShaderSource newShaderAmong: shaderFormats device: gpuDevice).
		
		info vertexInputState
		vertexBufferDescriptions: vertexBindings;
		numVertexBuffers: 1;
		vertexAttributes: vertexAttributes;
		numVertexAttributes: 1.
		
		info targetInfo
		colorTargetDescriptions: colorTargetDescriptions;
		numColorTargets: 1.
		
	].

	"3. Prepare Uniforms"
	vertUniforms := SDL3TestGraphicsVertUniform new.
	vertUniforms x: 0.5; y: 0.5; z: 0.0. "Offset to top-right"
	
	fragUniforms := SDL3TestGraphicsFragUniform new.
	fragUniforms r: 0.0; g: 1.0; b: 1.0; a: 1.0. "Cyan"

	"4. Render"
	colorTargetInfos := FFIArray newType: SDL_GPUColorTargetInfo size: 1.
	colorTargetInfos first
		texture: colorTarget;
		storeOp: SDL_GPU_STOREOP_STORE;
		loadOp: SDL_GPU_LOADOP_CLEAR.
	colorTargetInfos first clearColor r: 0.0; g: 0.0; b: 0.0; a: 1.0.

	commandBuffer renderPassTargets: colorTargetInfos do: [ :renderPass |
		vertexBufferBindings := FFIArray newType: SDL_GPUBufferBinding size: 1.
		vertexBufferBindings first buffer: vertexBuffer; offset: 0.
		
		renderPass pipeline: graphicsPipeline.
		renderPass vertexBuffers: vertexBufferBindings slot: 0.
		
		"Push uniforms"
		commandBuffer 
			pushVertexUniform: vertUniforms slot: 0;
			pushFragmentUniform: fragUniforms slot: 0.
		
		renderPass drawPrimitives: 3 instances: 1 firstVertex: 0 firstInstance: 0 ].
	
	commandBuffer submit.
	
	"5. Download results"
	transferBuffer release.
	transferBuffer := gpuDevice newDownloadTransferBuffer: byteSize.
	commandBuffer := gpuDevice acquireGPUCommandBuffer.
	commandBuffer copyPassDo: [ :copyPass |
		copyPass downloadTexture: (SDL3GPUTextureRegion new texture: colorTarget; w: texWidth; h: texHeight; d: 1; yourself)
		destination: (SDL3GPUTextureTransferInfo new transferBuffer: transferBuffer; offset: 0; yourself) ].
	commandBuffer submit.

	gpuDevice waitForGPUIdle.

	"6. Assert"
	gpuDevice mapTransferBuffer: transferBuffer cycle: false do: [ :mappedAddress |
		resultData := FFIArray fromHandle: mappedAddress type: FFIUInt8 size: byteSize.
		
		"Top-Right corner (approx 48, 16 in texture space) -> Should be Cyan (0, 255, 255, 255)"
		"Clip space (0.5, 0.5) is (0.75, 0.25) in normalized texture space -> (48, 16) pixels"
		trIdx := (16 * texWidth + 48) * FFIUInt32 externalTypeSize + 1.
		self assert: (resultData at: trIdx) equals: 0. "R"
		self assert: (resultData at: trIdx + 1) equals: 255. "G"
		self assert: (resultData at: trIdx + 2) equals: 255. "B"
		self assert: (resultData at: trIdx + 3) equals: 255. "A" ].

	"Cleanup"
	graphicsPipeline release.
	vertexBuffer release.
	colorTarget release.
	transferBuffer release
]

{ #category : 'tests' }
SDL3GraphicsPipelineTest >> test05Instancing [
	"Case 5: Instancing
	Draws 4 instances of a triangle using SV_InstanceID for positioning."

	| colorTarget vertexBuffer graphicsPipeline commandBuffer transferBuffer resultData texWidth texHeight byteSize colorTargetInfos vertexData vertexBindings vertexAttributes colorTargetDescriptions vertexBufferBindings |


	
	texWidth := 64.
	texHeight := 64.
	byteSize := texWidth * texHeight * FFIUInt32 externalTypeSize.

	"1. Create GPU resources"
	colorTarget := gpuDevice
		new2DGPUTextureFormat: SDL_GPU_TEXTUREFORMAT_R8G8B8A8_UNORM
		usage: SDL_GPU_TEXTUREUSAGE_COLOR_TARGET
		width: texWidth
		height: texHeight.
	
	"3 vertices for a small triangle at local origin"
	vertexData := FFIArray newType: SDL3GPUQuadVertex size: 3.
	(vertexData at: 1) x: -0.1; y: -0.1; z: 0.0.
	(vertexData at: 2) x: 0.1; y: -0.1; z: 0.0.
	(vertexData at: 3) x: 0.0; y: 0.1; z: 0.0.

	vertexBuffer := gpuDevice
		newGPUBufferUsage: SDL_GPU_BUFFERUSAGE_VERTEX
		size: 3 * SDL3GPUQuadVertex structureSize.
	
	"Upload vertex data"
	transferBuffer := gpuDevice newUploadTransferBuffer: 3 * SDL3GPUQuadVertex structureSize.
	gpuDevice mapTransferBuffer: transferBuffer cycle: false do: [ :mappedAddress |
		LibC memCopy: vertexData to: mappedAddress size: 3 * SDL3GPUQuadVertex structureSize. ].

	commandBuffer := gpuDevice acquireGPUCommandBuffer.
	commandBuffer copyPassDo: [ :copyPass |
		copyPass uploadBuffer: (SDL_GPUTransferBufferLocation new transferBuffer: transferBuffer; offset: 0; yourself)
		destination: (SDL_GPUBufferRegion new buffer: vertexBuffer; offset: 0; size: 3 * SDL3GPUQuadVertex structureSize; yourself)
		cycle: false ].

	"2. Create Pipeline"
	vertexBindings := FFIExternalArray externalNewType: SDL_GPUVertexBufferDescription size: 1.
	vertexBindings first
		slot: 0;
		inputRate: SDL_GPU_VERTEXINPUTRATE_VERTEX;
		instanceStepRate: 0;
		pitch: SDL3GPUQuadVertex structureSize.

	vertexAttributes := FFIExternalArray externalNewType: SDL_GPUVertexAttribute size: 1.
	vertexAttributes first
		bufferSlot: 0;
		format: SDL_GPU_VERTEXELEMENTFORMAT_FLOAT3;
		location: 0;
		offset: 0.

	colorTargetDescriptions := FFIExternalArray externalNewType: SDL_GPUColorTargetDescription size: 1.
	colorTargetDescriptions first 
		format: SDL_GPU_TEXTUREFORMAT_R8G8B8A8_UNORM;
		blendState: SDL_GPUColorTargetBlendState new.

	graphicsPipeline := gpuDevice newGraphicsPipeline: [ :info |
		info
		primitiveType: SDL_GPU_PRIMITIVETYPE_TRIANGLELIST;
		vertexShader: (SDL3TestGraphicsInstancedVertexShaderSource newShaderAmong: shaderFormats device: gpuDevice);
		fragmentShader: (SDL3TestGraphicsInstancedFragmentShaderSource newShaderAmong: shaderFormats device: gpuDevice).
		
		info vertexInputState
		vertexBufferDescriptions: vertexBindings;
		numVertexBuffers: 1;
		vertexAttributes: vertexAttributes;
		numVertexAttributes: 1.
		
		info targetInfo
		colorTargetDescriptions: colorTargetDescriptions;
		numColorTargets: 1.
		
	].

	"3. Render 4 instances"
	colorTargetInfos := FFIArray newType: SDL_GPUColorTargetInfo size: 1.
	colorTargetInfos first
		texture: colorTarget;
		storeOp: SDL_GPU_STOREOP_STORE;
		loadOp: SDL_GPU_LOADOP_CLEAR.
	colorTargetInfos first clearColor r: 0.0; g: 0.0; b: 0.0; a: 1.0.

	commandBuffer renderPassTargets: colorTargetInfos do: [ :renderPass |
		vertexBufferBindings := FFIArray newType: SDL_GPUBufferBinding size: 1.
		vertexBufferBindings first buffer: vertexBuffer; offset: 0.
		
		renderPass
			pipeline: graphicsPipeline;
			vertexBuffers: vertexBufferBindings slot: 0;
			drawPrimitives: 3 instances: 4 firstVertex: 0 firstInstance: 0 ].
	
	commandBuffer submit.
	
	"4. Download results"
	transferBuffer release.
	transferBuffer := gpuDevice newDownloadTransferBuffer: byteSize.
	commandBuffer := gpuDevice acquireGPUCommandBuffer.
	commandBuffer copyPassDo: [ :copyPass |
		copyPass
			downloadTexture: (SDL3GPUTextureRegion new texture: colorTarget; w: texWidth; h: texHeight; d: 1; yourself)
			destination: (SDL3GPUTextureTransferInfo new transferBuffer: transferBuffer; offset: 0; yourself) ].
	commandBuffer submit.

	gpuDevice waitForGPUIdle.

	"5. Assert multiple instances are drawn (White pixels in each quadrant)"
	gpuDevice mapTransferBuffer: transferBuffer cycle: false do: [ :mappedAddress |
		resultData := FFIArray fromHandle: mappedAddress type: FFIUInt8 size: byteSize.
		
		"Bottom-Left (approx 16, 48) - ID 0"
		self assert: (resultData at: (48 * texWidth + 16) * FFIUInt32 externalTypeSize + 1) equals: 255.
		"Bottom-Right (approx 48, 48) - ID 1"
		self assert: (resultData at: (48 * texWidth + 48) * FFIUInt32 externalTypeSize + 1) equals: 255.
		"Top-Left (approx 16, 16) - ID 2"
		self assert: (resultData at: (16 * texWidth + 16) * FFIUInt32 externalTypeSize + 1) equals: 255.
		"Top-Right (approx 48, 16) - ID 3"
		self assert: (resultData at: (16 * texWidth + 48) * FFIUInt32 externalTypeSize + 1) equals: 255. ].

	"Cleanup"
	graphicsPipeline release.
	vertexBuffer release.
	colorTarget release.
	transferBuffer release
]

{ #category : 'tests' }
SDL3GraphicsPipelineTest >> test06DepthTesting [
	"Case 6: Depth Buffer
	Draws a near Blue quad first, then a far Red quad.
	With depth testing enabled (LESS), the Red quad should be rejected."

	| colorTarget depthTarget vertexBuffer graphicsPipeline commandBuffer transferBuffer resultData texWidth texHeight byteSize colorTargetInfos vertexData vertexBindings vertexAttributes colorTargetDescriptions blueUniforms redUniforms depthStencilTargetInfo vertexBufferBindings |


	
	texWidth := 64.
	texHeight := 64.
	byteSize := texWidth * texHeight * FFIUInt32 externalTypeSize.

	"1. Create GPU resources"
	colorTarget := gpuDevice
		new2DGPUTextureFormat: SDL_GPU_TEXTUREFORMAT_R8G8B8A8_UNORM
		usage: SDL_GPU_TEXTUREUSAGE_COLOR_TARGET
		width: texWidth
		height: texHeight.
	
	depthTarget := gpuDevice
		new2DGPUTextureFormat: SDL_GPU_TEXTUREFORMAT_D16_UNORM
		usage: SDL_GPU_TEXTUREUSAGE_DEPTH_STENCIL_TARGET
		width: texWidth
		height: texHeight.

	"Full screen quad vertices"
	vertexData := FFIArray newType: SDL3GPUQuadVertex size: 6.
	(vertexData at: 1) x: -1.0; y: -1.0; z: 0.0.
	(vertexData at: 2) x: 1.0; y: -1.0; z: 0.0.
	(vertexData at: 3) x: -1.0; y: 1.0; z: 0.0.
	(vertexData at: 4) x: -1.0; y: 1.0; z: 0.0.
	(vertexData at: 5) x: 1.0; y: -1.0; z: 0.0.
	(vertexData at: 6) x: 1.0; y: 1.0; z: 0.0.

	vertexBuffer := gpuDevice
		newGPUBufferUsage: SDL_GPU_BUFFERUSAGE_VERTEX
		size: 6 * SDL3GPUQuadVertex structureSize.
	
	"Upload vertex data"
	transferBuffer := gpuDevice newUploadTransferBuffer: 6 * SDL3GPUQuadVertex structureSize.
	gpuDevice mapTransferBuffer: transferBuffer cycle: false do: [ :mappedAddress |
		LibC memCopy: vertexData to: mappedAddress size: 6 * SDL3GPUQuadVertex structureSize. ].

	commandBuffer := gpuDevice acquireGPUCommandBuffer.
	commandBuffer copyPassDo: [ :copyPass |
		copyPass
			uploadBuffer: (SDL_GPUTransferBufferLocation new transferBuffer: transferBuffer; offset: 0; yourself)
			destination: (SDL_GPUBufferRegion new buffer: vertexBuffer; offset: 0; size: 6 * SDL3GPUQuadVertex structureSize; yourself)
			cycle: false ].

	"2. Create Pipeline with Depth Testing"
	vertexBindings := FFIExternalArray externalNewType: SDL_GPUVertexBufferDescription size: 1.
	vertexBindings first
		slot: 0;
		inputRate: SDL_GPU_VERTEXINPUTRATE_VERTEX;
		instanceStepRate: 0;
		pitch: SDL3GPUQuadVertex structureSize.

	vertexAttributes := FFIExternalArray externalNewType: SDL_GPUVertexAttribute size: 1.
	vertexAttributes first
		bufferSlot: 0;
		format: SDL_GPU_VERTEXELEMENTFORMAT_FLOAT3;
		location: 0;
		offset: 0.

	colorTargetDescriptions := FFIExternalArray externalNewType: SDL_GPUColorTargetDescription size: 1.
	colorTargetDescriptions first 
		format: SDL_GPU_TEXTUREFORMAT_R8G8B8A8_UNORM;
		blendState: SDL_GPUColorTargetBlendState new.

	graphicsPipeline := gpuDevice newGraphicsPipeline: [ :info |
		info
		primitiveType: SDL_GPU_PRIMITIVETYPE_TRIANGLELIST;
		vertexShader: (SDL3TestGraphicsDepthVertexShaderSource newShaderAmong: shaderFormats device: gpuDevice);
		fragmentShader: (SDL3TestGraphicsDepthFragmentShaderSource newShaderAmong: shaderFormats device: gpuDevice).
		
		info vertexInputState
		vertexBufferDescriptions: vertexBindings;
		numVertexBuffers: 1;
		vertexAttributes: vertexAttributes;
		numVertexAttributes: 1.
		
		info targetInfo
		colorTargetDescriptions: colorTargetDescriptions;
		numColorTargets: 1;
		depthStencilFormat: SDL_GPU_TEXTUREFORMAT_D16_UNORM;
		hasDepthStencilTarget: true.
		
		info depthStencilState: (SDL_GPUDepthStencilState new 
			enableDepthTest: true;
			enableDepthWrite: true;
			compareOp: SDL_GPU_COMPAREOP_LESS;
			yourself).
		
	].

	"3. Prepare Uniforms"
	blueUniforms := SDL3TestGraphicsFragUniform new r: 0.0; g: 0.0; b: 1.0; a: 1.0. "Near Blue"
	redUniforms := SDL3TestGraphicsFragUniform new r: 1.0; g: 0.0; b: 0.0; a: 1.0. "Far Red"

	"4. Render"
	colorTargetInfos := FFIArray newType: SDL_GPUColorTargetInfo size: 1.
	colorTargetInfos first
		texture: colorTarget;
		storeOp: SDL_GPU_STOREOP_STORE;
		loadOp: SDL_GPU_LOADOP_CLEAR.
	colorTargetInfos first clearColor r: 0.0; g: 0.0; b: 0.0; a: 1.0.

	depthStencilTargetInfo := SDL_GPUDepthStencilTargetInfo new.
	depthStencilTargetInfo
		texture: depthTarget;
		loadOp: SDL_GPU_LOADOP_CLEAR;
		storeOp: SDL_GPU_STOREOP_DONT_CARE;
		cycle: false.
	depthStencilTargetInfo clearDepth: 1.0.

	commandBuffer renderPassTargets: colorTargetInfos depthStencil: depthStencilTargetInfo do: [ :renderPass |
		vertexBufferBindings := FFIArray newType: SDL_GPUBufferBinding size: 1.
		vertexBufferBindings first buffer: vertexBuffer; offset: 0.
		
		renderPass pipeline: graphicsPipeline.
		renderPass vertexBuffers: vertexBufferBindings slot: 0.
		
		"A. Draw Blue at z=0.0"
		commandBuffer pushVertexUniform: (SDL3TestGraphicsVertUniform new x: 0.0; y: 0.0; z: 0.0) slot: 0.
		commandBuffer pushFragmentUniform: blueUniforms slot: 0.
		renderPass drawPrimitives: 6 instances: 1 firstVertex: 0 firstInstance: 0.
		
		"B. Draw Red at z=1.0"
		commandBuffer pushVertexUniform: (SDL3TestGraphicsVertUniform new x: 0.0; y: 0.0; z: 1.0) slot: 0.
		commandBuffer pushFragmentUniform: redUniforms slot: 0.
		renderPass drawPrimitives: 6 instances: 1 firstVertex: 0 firstInstance: 0 ].
	
	commandBuffer submit.
	
	"5. Download results"
	transferBuffer release.
	transferBuffer := gpuDevice newDownloadTransferBuffer: byteSize.
	commandBuffer := gpuDevice acquireGPUCommandBuffer.
	commandBuffer copyPassDo: [ :copyPass |
		copyPass downloadTexture: (SDL3GPUTextureRegion new texture: colorTarget; w: texWidth; h: texHeight; d: 1; yourself)
		destination: (SDL3GPUTextureTransferInfo new transferBuffer: transferBuffer; offset: 0; yourself) ].
	commandBuffer submit.

	gpuDevice waitForGPUIdle.

	"6. Assert result is Blue (0, 0, 255, 255) because Red was rejected"
	gpuDevice mapTransferBuffer: transferBuffer cycle: false do: [ :mappedAddress |
		resultData := FFIArray fromHandle: mappedAddress type: FFIUInt8 size: byteSize.
		
		{ 1 . (byteSize // 2) + 1 . (byteSize - 3) } do: [ :baseIdx |
		self assert: (resultData at: baseIdx) equals: 0. "R"
		self assert: (resultData at: baseIdx + 1) equals: 0. "G"
		self assert: (resultData at: baseIdx + 2) equals: 255. "B"
		self assert: (resultData at: baseIdx + 3) equals: 255. "A" ]. ].

	"Cleanup"
	graphicsPipeline release.
	vertexBuffer release.
	colorTarget release.
	depthTarget release.
	transferBuffer release
]
