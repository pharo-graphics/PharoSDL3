"
I test the SDL3 GPU graphics pipeline in a headless environment.
I render to off-screen textures (Color Targets) and verify the results.
I also serve as a pedagogical reference for developers.
"
Class {
	#name : 'SDL3GraphicsPipelineTest',
	#superclass : 'SDL3GPUTest',
	#pools : [
		'SDL3AllEnumerations',
		'SDL3Constants'
	],
	#category : 'SDL3-GPU-Tests-GraphicsPipeline',
	#package : 'SDL3-GPU-Tests',
	#tag : 'GraphicsPipeline'
}

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
		unownedNew2DGPUTextureFormat: SDL_GPU_TEXTUREFORMAT_R8G8B8A8_UNORM
		usage: SDL_GPU_TEXTUREUSAGE_COLOR_TARGET
		width: texWidth
		height: texHeight.
	DiScope own: colorTarget.

	"2. Setup render pass and clear"
	commandBuffer := gpuDevice acquireGPUCommandBuffer.

	colorTargetInfos := SDL3Array newType: SDL_GPUColorTargetInfo size: 1.
	colorTargetInfos first
		texture: colorTarget;
		storeOp: SDL_GPU_STOREOP_STORE;
		loadOp: SDL_GPU_LOADOP_CLEAR.
	colorTargetInfos first updateClearColorFrom: Color red.

	commandBuffer renderPassTargets: colorTargetInfos depthStencil: nil do: [ :renderPass |  ].

	commandBuffer submit.

	"3. Download results"
	DiScope own: (transferBuffer := gpuDevice unownedNewGPUDownloadTransferBuffer: byteSize).
	commandBuffer := gpuDevice acquireGPUCommandBuffer.
	commandBuffer copyPassDo: [ :copyPass |
		copyPass
			downloadTexture: (SDL3GPUTextureRegion new
				texture: colorTarget;
				w: texWidth;
				h: texHeight;
				d: 1;
				yourself)
			destination: (SDL3GPUTextureTransferInfo new
				transferBuffer: transferBuffer;
				offset: 0;
				yourself) ].
	commandBuffer submit.

	gpuDevice waitForGPUIdle.

	"4. Assert"
	gpuDevice mapTransferBuffer: transferBuffer cycle: false do: [ :mappedAddress |
		resultData := FFIArray fromHandle: mappedAddress type: FFIUInt8 size: byteSize.

		"Check a few pixels (first, middle, last) - Should be solid Red (255, 0, 0, 255)"
		{ 1. (byteSize // 2 + 1). (byteSize - 3) } do: [ :baseIdx |
			self assert: (resultData at: baseIdx) equals: 255. "R"
			self assert: (resultData at: baseIdx + 1) equals: 0. "G"
			self assert: (resultData at: baseIdx + 2) equals: 0. "B"
			self assert: (resultData at: baseIdx + 3) equals: 255 ] ]
]

{ #category : 'tests' }
SDL3GraphicsPipelineTest >> test02FullscreenQuad [
	"Case 2: Fullscreen Quad
	Draws a solid green quad covering the whole screen using explicit vertices."

	| colorTarget vertexBuffer graphicsPipeline commandBuffer transferBuffer resultData texWidth texHeight byteSize colorTargetInfos vertexData vertexBufferBindings |
	texWidth := 64.
	texHeight := 64.
	byteSize := texWidth * texHeight * FFIUInt32 externalTypeSize.

	"1. Create GPU resources"
	colorTarget := gpuDevice
		unownedNew2DGPUTextureFormat: SDL_GPU_TEXTUREFORMAT_R8G8B8A8_UNORM
		usage: SDL_GPU_TEXTUREUSAGE_COLOR_TARGET
		width: texWidth
		height: texHeight.
	DiScope own: colorTarget.

	"6 vertices for 2 triangles forming a quad: (-1,-1) to (1,1)"
	vertexData := SDL3Array newType: SDL3GPUQuadVertex size: 6.
	"Triangle 1"
	vertexData first
		x: -1.0;
		y: -1.0;
		z: 0.0.
	vertexData second
		x: 1.0;
		y: -1.0;
		z: 0.0.
	vertexData third
		x: -1.0;
		y: 1.0;
		z: 0.0.
	"Triangle 2"
	vertexData fourth
		x: -1.0;
		y: 1.0;
		z: 0.0.
	vertexData fifth
		x: 1.0;
		y: -1.0;
		z: 0.0.
	vertexData sixth
		x: 1.0;
		y: 1.0;
		z: 0.0.

	vertexBuffer := gpuDevice unownedNewGPUBufferUsage: SDL_GPU_BUFFERUSAGE_VERTEX size: 6 * SDL3GPUQuadVertex structureSize.
	DiScope own: vertexBuffer.

	"Upload vertex data"
	transferBuffer := gpuDevice unownedNewGPUUploadTransferBuffer: 6 * SDL3GPUQuadVertex structureSize.
	DiScope own: transferBuffer.
	gpuDevice
		mapTransferBuffer: transferBuffer
		cycle: false
		do: [ :mappedAddress | sdl memcpyDst: mappedAddress src: vertexData len: 6 * SDL3GPUQuadVertex structureSize ].

	commandBuffer := gpuDevice acquireGPUCommandBuffer.
	commandBuffer copyPassDo: [ :copyPass |
		copyPass
			uploadBuffer: (SDL_GPUTransferBufferLocation new
				transferBuffer: transferBuffer;
				offset: 0;
				yourself)
			destination: (SDL_GPUBufferRegion new
				buffer: vertexBuffer;
				offset: 0;
				size: 6 * SDL3GPUQuadVertex structureSize;
				yourself)
			cycle: false ].

	"2. Create Pipeline"
	graphicsPipeline := gpuDevice newGraphicsPipelineBuilder
		vertexShader: SDL3TestGraphicsQuadVertexShaderSource;
		fragmentShader: SDL3TestGraphicsQuadFragmentShaderSource;
		addVertexBufferDescription: (SDL3GPUVertexBufferDescription new
			slot: 0;
			inputRate: SDL3GPUVertexInputRate vertex;
			instanceStepRate: 0;
			pitch: SDL3GPUQuadVertex structureSize;
			yourself);
		addVertexAttribute: (SDL3GPUVertexAttribute new
			bufferSlot: 0;
			format: SDL3GPUVertexElementFormat float3;
			location: 0;
			offset: 0;
			yourself);
		targetFormat: SDL_GPU_TEXTUREFORMAT_R8G8B8A8_UNORM;
		unownedNewPipeline.
	DiScope own: graphicsPipeline.

	"3. Render"
	colorTargetInfos := SDL3Array newType: SDL_GPUColorTargetInfo size: 1.
	colorTargetInfos first
		texture: colorTarget;
		storeOp: SDL_GPU_STOREOP_STORE;
		loadOp: SDL_GPU_LOADOP_CLEAR.
	colorTargetInfos first clearColor
		r: 0.0;
		g: 0.0;
		b: 0.0;
		a: 1.0. "Initial black"

	vertexBufferBindings := SDL3Array newType: SDL_GPUBufferBinding size: 1.
	vertexBufferBindings first
		buffer: vertexBuffer;
		offset: 0.

	commandBuffer renderPassTargets: colorTargetInfos depthStencil: nil do: [ :renderPass |
		renderPass
			pipeline: graphicsPipeline;
			vertexBuffers: vertexBufferBindings slot: 0;
			drawPrimitives: 6
			instances: 1
			firstVertex: 0
			firstInstance: 0 ].

	commandBuffer submit.

	"4. Download results"
	DiScope own: (transferBuffer := gpuDevice unownedNewGPUDownloadTransferBuffer: byteSize).
	commandBuffer := gpuDevice acquireGPUCommandBuffer.
	commandBuffer copyPassDo: [ :copyPass |
		copyPass
			downloadTexture: (SDL3GPUTextureRegion new
				texture: colorTarget;
				w: texWidth;
				h: texHeight;
				d: 1;
				yourself)
			destination: (SDL3GPUTextureTransferInfo new
				transferBuffer: transferBuffer;
				offset: 0;
				yourself) ].
	commandBuffer submit.

	gpuDevice waitForGPUIdle.

	"5. Assert - Should be solid Green (0, 255, 0, 255)"
	gpuDevice mapTransferBuffer: transferBuffer cycle: false do: [ :mappedAddress |
		resultData := FFIArray fromHandle: mappedAddress type: FFIUInt8 size: byteSize.

		{ 1. (byteSize // 2 + 1). (byteSize - 3) } do: [ :baseIdx |
			self assert: (resultData at: baseIdx) equals: 0. "R"
			self assert: (resultData at: baseIdx + 1) equals: 255. "G"
			self assert: (resultData at: baseIdx + 2) equals: 0. "B"
			self assert: (resultData at: baseIdx + 3) equals: 255 ] ]
]

{ #category : 'tests' }
SDL3GraphicsPipelineTest >> test03VertexColors [
	"Draw a triangle with per-vertex colors and verify downloaded output.
	Draws a triangle with Red, Green, Blue vertices and verifies interpolated colors."

	| colorTarget vertexBuffer graphicsPipeline commandBuffer transferBuffer resultData texWidth texHeight byteSize colorTargetInfos vertexData vertexBufferBindings topIdx centerIdx |
	texWidth := 64.
	texHeight := 64.
	byteSize := texWidth * texHeight * FFIUInt32 externalTypeSize.

	"1. Create GPU resources"
	colorTarget := gpuDevice
		unownedNew2DGPUTextureFormat: SDL_GPU_TEXTUREFORMAT_R8G8B8A8_UNORM
		usage: SDL_GPU_TEXTUREUSAGE_COLOR_TARGET
		width: texWidth
		height: texHeight.
	DiScope own: colorTarget.

	"3 vertices for a large triangle"
	vertexData := SDL3Array newType: SDL3TestGraphicsColorVertex size: 3.
	"Top: Red"
	vertexData first
		x: 0.0;
		y: 1.0;
		z: 0.0;
		r: 1.0;
		g: 0.0;
		b: 0.0;
		a: 1.0.
	"Bottom-Right: Green"
	vertexData second
		x: 1.0;
		y: -1.0;
		z: 0.0;
		r: 0.0;
		g: 1.0;
		b: 0.0;
		a: 1.0.
	"Bottom-Left: Blue"
	vertexData third
		x: -1.0;
		y: -1.0;
		z: 0.0;
		r: 0.0;
		g: 0.0;
		b: 1.0;
		a: 1.0.

	vertexBuffer := gpuDevice
		unownedNewGPUBufferUsage: SDL_GPU_BUFFERUSAGE_VERTEX
		size: 3 * SDL3TestGraphicsColorVertex structureSize.
	DiScope own: vertexBuffer.

	"Upload vertex data"
	transferBuffer := gpuDevice unownedNewGPUUploadTransferBuffer: 3 * SDL3TestGraphicsColorVertex structureSize.
	DiScope own: transferBuffer.
	gpuDevice
		mapTransferBuffer: transferBuffer
		cycle: false
		do: [ :mappedAddress | sdl memcpyDst: mappedAddress src: vertexData len: 3 * SDL3TestGraphicsColorVertex structureSize ].

	commandBuffer := gpuDevice acquireGPUCommandBuffer.
	commandBuffer copyPassDo: [ :copyPass |
		copyPass
			uploadBuffer: (SDL_GPUTransferBufferLocation new
				transferBuffer: transferBuffer;
				offset: 0;
				yourself)
			destination: (SDL_GPUBufferRegion new
				buffer: vertexBuffer;
				offset: 0;
				size: 3 * SDL3TestGraphicsColorVertex structureSize;
				yourself)
			cycle: false ].

	"2. Create Pipeline"
	graphicsPipeline := gpuDevice newGraphicsPipelineBuilder
		vertexShader: SDL3TestGraphicsColorVertexShaderSource;
		fragmentShader: SDL3TestGraphicsColorFragmentShaderSource;
		addVertexBufferFor: SDL3TestGraphicsColorVertex;
		targetFormat: SDL_GPU_TEXTUREFORMAT_R8G8B8A8_UNORM;
		unownedNewPipeline.
	DiScope own: graphicsPipeline.

	"3. Render"
	colorTargetInfos := SDL3Array newType: SDL_GPUColorTargetInfo size: 1.
	colorTargetInfos first
		texture: colorTarget;
		storeOp: SDL_GPU_STOREOP_STORE;
		loadOp: SDL_GPU_LOADOP_CLEAR.
	colorTargetInfos first clearColor
		r: 0.0;
		g: 0.0;
		b: 0.0;
		a: 1.0.

	vertexBufferBindings := SDL3Array newType: SDL_GPUBufferBinding size: 1.
	vertexBufferBindings first
		buffer: vertexBuffer;
		offset: 0.

	commandBuffer renderPassTargets: colorTargetInfos do: [ :renderPass |
		renderPass
			pipeline: graphicsPipeline;
			vertexBuffers: vertexBufferBindings slot: 0;
			drawPrimitives: 3
			instances: 1
			firstVertex: 0
			firstInstance: 0 ].
	commandBuffer submit.

	"4. Download results"
	DiScope own: (transferBuffer := gpuDevice unownedNewGPUDownloadTransferBuffer: byteSize).
	commandBuffer := gpuDevice acquireGPUCommandBuffer.
	commandBuffer copyPassDo: [ :copyPass |
		copyPass
			downloadTexture: (SDL3GPUTextureRegion new
				texture: colorTarget;
				w: texWidth;
				h: texHeight;
				d: 1;
				yourself)
			destination: (SDL3GPUTextureTransferInfo new
				transferBuffer: transferBuffer;
				offset: 0;
				yourself) ].
	commandBuffer submit.

	gpuDevice waitForGPUIdle.

	"5. Assert"
	gpuDevice mapTransferBuffer: transferBuffer cycle: false do: [ :mappedAddress |
		resultData := FFIArray fromHandle: mappedAddress type: FFIUInt8 size: byteSize.

		"Center pixel should be interpolated (mixed color, definitely not pure black)"
		centerIdx := (texHeight // 2 * texWidth + (texWidth // 2)) * 4 + 1.
		self assert: (resultData at: centerIdx) > 0.

		"Near top vertex should be predominantly RED"
		topIdx := (5 * texWidth + (texWidth // 2)) * 4 + 1.
		self assert: (resultData at: topIdx) > 100.
		self assert: (resultData at: topIdx + 3) equals: 255 ]
]

{ #category : 'tests' }
SDL3GraphicsPipelineTest >> test04GraphicsUniforms [
	"Case 4: Uniform Buffers
	Draws a triangle shifted by a vertex uniform and colored by a fragment uniform."

	| colorTarget vertexBuffer graphicsPipeline commandBuffer transferBuffer resultData texWidth texHeight byteSize colorTargetInfos vertexData vertUniforms fragUniforms trIdx vertexBufferBindings |
	texWidth := 64.
	texHeight := 64.
	byteSize := texWidth * texHeight * FFIUInt32 externalTypeSize.

	"1. Create GPU resources"
	colorTarget := gpuDevice
		unownedNew2DGPUTextureFormat: SDL_GPU_TEXTUREFORMAT_R8G8B8A8_UNORM
		usage: SDL_GPU_TEXTUREUSAGE_COLOR_TARGET
		width: texWidth
		height: texHeight.
	DiScope own: colorTarget.

	"3 vertices for a small triangle at center"
	vertexData := SDL3Array newType: SDL3GPUQuadVertex size: 3.
	vertexData first
		x: -0.1;
		y: -0.1;
		z: 0.0.
	vertexData second
		x: 0.1;
		y: -0.1;
		z: 0.0.
	vertexData third
		x: 0.0;
		y: 0.1;
		z: 0.0.

	vertexBuffer := gpuDevice unownedNewGPUBufferUsage: SDL_GPU_BUFFERUSAGE_VERTEX size: 3 * SDL3GPUQuadVertex structureSize.
	DiScope own: vertexBuffer.

	"Upload vertex data"
	transferBuffer := gpuDevice unownedNewGPUUploadTransferBuffer: 3 * SDL3GPUQuadVertex structureSize.
	DiScope own: transferBuffer.
	gpuDevice
		mapTransferBuffer: transferBuffer
		cycle: false
		do: [ :mappedAddress | sdl memcpyDst: mappedAddress src: vertexData len: 3 * SDL3GPUQuadVertex structureSize ].

	commandBuffer := gpuDevice acquireGPUCommandBuffer.
	commandBuffer copyPassDo: [ :copyPass |
		copyPass
			uploadBuffer: (SDL_GPUTransferBufferLocation new
				transferBuffer: transferBuffer;
				offset: 0;
				yourself)
			destination: (SDL_GPUBufferRegion new
				buffer: vertexBuffer;
				offset: 0;
				size: 3 * SDL3GPUQuadVertex structureSize;
				yourself)
			cycle: false ].

	"2. Create Pipeline"
	graphicsPipeline := gpuDevice newGraphicsPipelineBuilder
		vertexShader: SDL3TestGraphicsUniformVertexShaderSource;
		fragmentShader: SDL3TestGraphicsUniformFragmentShaderSource;
		addVertexBufferDescription: (SDL3GPUVertexBufferDescription new
			slot: 0;
			pitch: SDL3GPUQuadVertex structureSize;
			inputRate: SDL3GPUVertexInputRate vertex;
			yourself);
		addVertexAttribute: (SDL3GPUVertexAttribute new
			bufferSlot: 0;
			format: SDL3GPUVertexElementFormat float3;
			location: 0;
			offset: 0;
			yourself);
		targetFormat: SDL_GPU_TEXTUREFORMAT_R8G8B8A8_UNORM;
		unownedNewPipeline.
	DiScope own: graphicsPipeline.

	"3. Prepare Uniforms"
	vertUniforms := SDL3TestGraphicsVertUniform new.
	vertUniforms
		x: 0.5;
		y: 0.5;
		z: 0.0. "Offset to top-right"

	fragUniforms := SDL3TestGraphicsFragUniform new.
	fragUniforms
		r: 0.0;
		g: 1.0;
		b: 1.0;
		a: 1.0. "Cyan"

	"4. Render"
	colorTargetInfos := SDL3Array newType: SDL_GPUColorTargetInfo size: 1.
	colorTargetInfos first
		texture: colorTarget;
		storeOp: SDL_GPU_STOREOP_STORE;
		loadOp: SDL_GPU_LOADOP_CLEAR.
	colorTargetInfos first clearColor
		r: 0.0;
		g: 0.0;
		b: 0.0;
		a: 1.0.

	commandBuffer renderPassTargets: colorTargetInfos do: [ :renderPass |
		vertexBufferBindings := SDL3Array newType: SDL_GPUBufferBinding size: 1.
		vertexBufferBindings first
			buffer: vertexBuffer;
			offset: 0.

		renderPass pipeline: graphicsPipeline.
		renderPass vertexBuffers: vertexBufferBindings slot: 0.

		"Push uniforms"
		commandBuffer
			pushVertexUniform: vertUniforms slot: 0;
			pushFragmentUniform: fragUniforms slot: 0.

		renderPass
			drawPrimitives: 3
			instances: 1
			firstVertex: 0
			firstInstance: 0 ].

	commandBuffer submit.

	"5. Download results"
	DiScope own: (transferBuffer := gpuDevice unownedNewGPUDownloadTransferBuffer: byteSize).
	commandBuffer := gpuDevice acquireGPUCommandBuffer.
	commandBuffer copyPassDo: [ :copyPass |
		copyPass
			downloadTexture: (SDL3GPUTextureRegion new
				texture: colorTarget;
				w: texWidth;
				h: texHeight;
				d: 1;
				yourself)
			destination: (SDL3GPUTextureTransferInfo new
				transferBuffer: transferBuffer;
				offset: 0;
				yourself) ].
	commandBuffer submit.

	gpuDevice waitForGPUIdle.

	"6. Assert"
	gpuDevice mapTransferBuffer: transferBuffer cycle: false do: [ :mappedAddress |
		resultData := FFIArray fromHandle: mappedAddress type: FFIUInt8 size: byteSize.

		"Top-Right corner (approx 48, 16 in texture space) -> Should be Cyan (0, 255, 255, 255)"
		"Clip space (0.5, 0.5) is (0.75, 0.25) in normalized texture space -> (48, 16) pixels"
		trIdx := 16 * texWidth + 48 * FFIUInt32 externalTypeSize + 1.
		self assert: (resultData at: trIdx) equals: 0. "R"
		self assert: (resultData at: trIdx + 1) equals: 255. "G"
		self assert: (resultData at: trIdx + 2) equals: 255. "B"
		self assert: (resultData at: trIdx + 3) equals: 255 ]
]

{ #category : 'tests' }
SDL3GraphicsPipelineTest >> test05Instancing [
	"Case 5: Instancing
	Draws 4 instances of a small triangle using SV_InstanceID."

	| colorTarget vertexBuffer graphicsPipeline commandBuffer transferBuffer resultData texWidth texHeight byteSize colorTargetInfos vertexData vertexBufferBindings |
	texWidth := 64.
	texHeight := 64.
	byteSize := texWidth * texHeight * FFIUInt32 externalTypeSize.

	"1. Create GPU resources"
	colorTarget := gpuDevice
		unownedNew2DGPUTextureFormat: SDL_GPU_TEXTUREFORMAT_R8G8B8A8_UNORM
		usage: SDL_GPU_TEXTUREUSAGE_COLOR_TARGET
		width: texWidth
		height: texHeight.
	DiScope own: colorTarget.

	"3 vertices for a small triangle at local origin"
	vertexData := SDL3Array newType: SDL3GPUQuadVertex size: 3.
	vertexData first
		x: -0.1;
		y: -0.1;
		z: 0.0.
	vertexData second
		x: 0.1;
		y: -0.1;
		z: 0.0.
	vertexData third
		x: 0.0;
		y: 0.1;
		z: 0.0.

	vertexBuffer := gpuDevice unownedNewGPUBufferUsage: SDL_GPU_BUFFERUSAGE_VERTEX size: 3 * SDL3GPUQuadVertex structureSize.
	DiScope own: vertexBuffer.

	"Upload vertex data"
	transferBuffer := gpuDevice unownedNewGPUUploadTransferBuffer: 3 * SDL3GPUQuadVertex structureSize.
	DiScope own: transferBuffer.
	gpuDevice
		mapTransferBuffer: transferBuffer
		cycle: false
		do: [ :mappedAddress | sdl memcpyDst: mappedAddress src: vertexData len: 3 * SDL3GPUQuadVertex structureSize ].

	commandBuffer := gpuDevice acquireGPUCommandBuffer.
	commandBuffer copyPassDo: [ :copyPass |
		copyPass
			uploadBuffer: (SDL_GPUTransferBufferLocation new
				transferBuffer: transferBuffer;
				offset: 0;
				yourself)
			destination: (SDL_GPUBufferRegion new
				buffer: vertexBuffer;
				offset: 0;
				size: 3 * SDL3GPUQuadVertex structureSize;
				yourself)
			cycle: false ].

	"2. Create Pipeline"
	graphicsPipeline := gpuDevice newGraphicsPipelineBuilder
		vertexShader: SDL3TestGraphicsInstancedVertexShaderSource;
		fragmentShader: SDL3TestGraphicsInstancedFragmentShaderSource;
		addVertexBufferDescription: (SDL3GPUVertexBufferDescription new
			slot: 0;
			pitch: SDL3GPUQuadVertex structureSize;
			inputRate: SDL3GPUVertexInputRate vertex;
			yourself);
		addVertexAttribute: (SDL3GPUVertexAttribute new
			bufferSlot: 0;
			format: SDL3GPUVertexElementFormat float3;
			location: 0;
			offset: 0;
			yourself);
		targetFormat: SDL_GPU_TEXTUREFORMAT_R8G8B8A8_UNORM;
		unownedNewPipeline.
	DiScope own: graphicsPipeline.

	"3. Render 4 instances"
	colorTargetInfos := SDL3Array newType: SDL_GPUColorTargetInfo size: 1.
	colorTargetInfos first
		texture: colorTarget;
		storeOp: SDL_GPU_STOREOP_STORE;
		loadOp: SDL_GPU_LOADOP_CLEAR.
	colorTargetInfos first updateClearColorFrom: Color black.

	commandBuffer renderPassTargets: colorTargetInfos do: [ :renderPass |
		vertexBufferBindings := SDL3Array newType: SDL_GPUBufferBinding size: 1.
		vertexBufferBindings first
			buffer: vertexBuffer;
			offset: 0.

		renderPass
			pipeline: graphicsPipeline;
			vertexBuffers: vertexBufferBindings slot: 0;
			drawPrimitives: 3
			instances: 4
			firstVertex: 0
			firstInstance: 0 ].

	commandBuffer submit.

	"4. Download results"
	DiScope own: (transferBuffer := gpuDevice unownedNewGPUDownloadTransferBuffer: byteSize).
	commandBuffer := gpuDevice acquireGPUCommandBuffer.
	commandBuffer copyPassDo: [ :copyPass |
		copyPass
			downloadTexture: (SDL3GPUTextureRegion new
				texture: colorTarget;
				w: texWidth;
				h: texHeight;
				d: 1;
				yourself)
			destination: (SDL3GPUTextureTransferInfo new
				transferBuffer: transferBuffer;
				offset: 0;
				yourself) ].
	commandBuffer submit.

	gpuDevice waitForGPUIdle.

	"5. Assert multiple instances are drawn (White pixels in each quadrant)"
	gpuDevice mapTransferBuffer: transferBuffer cycle: false do: [ :mappedAddress |
		resultData := FFIArray fromHandle: mappedAddress type: FFIUInt8 size: byteSize.

		"Bottom-Left (approx 16, 48) - ID 0"
		self assert: (resultData at: 48 * texWidth + 16 * FFIUInt32 externalTypeSize + 1) equals: 255.
		"Bottom-Right (approx 48, 48) - ID 1"
		self assert: (resultData at: 48 * texWidth + 48 * FFIUInt32 externalTypeSize + 1) equals: 255.
		"Top-Left (approx 16, 16) - ID 2"
		self assert: (resultData at: 16 * texWidth + 16 * FFIUInt32 externalTypeSize + 1) equals: 255.
		"Top-Right (approx 48, 16) - ID 3"
		self assert: (resultData at: 16 * texWidth + 48 * FFIUInt32 externalTypeSize + 1) equals: 255 ]
]

{ #category : 'tests' }
SDL3GraphicsPipelineTest >> test06DepthTesting [
	"Case 6: Depth Buffer
	Draws a near Blue quad first, then a far Red quad.
	With depth testing enabled (LESS), the Red quad should be rejected."

	| colorTarget depthTarget vertexBuffer graphicsPipeline commandBuffer transferBuffer resultData texWidth texHeight byteSize colorTargetInfos vertexData blueUniforms redUniforms depthStencilTargetInfo vertexBufferBindings |
	texWidth := 64.
	texHeight := 64.
	byteSize := texWidth * texHeight * FFIUInt32 externalTypeSize.

	"1. Create GPU resources"
	colorTarget := gpuDevice
		unownedNew2DGPUTextureFormat: SDL_GPU_TEXTUREFORMAT_R8G8B8A8_UNORM
		usage: SDL_GPU_TEXTUREUSAGE_COLOR_TARGET
		width: texWidth
		height: texHeight.
	DiScope own: colorTarget.

	depthTarget := gpuDevice
		unownedNew2DGPUTextureFormat: SDL_GPU_TEXTUREFORMAT_D16_UNORM
		usage: SDL_GPU_TEXTUREUSAGE_DEPTH_STENCIL_TARGET
		width: texWidth
		height: texHeight.
	DiScope own: depthTarget.

	"Full screen quad vertices"
	vertexData := SDL3Array newType: SDL3GPUQuadVertex size: 6.
	vertexData first
		x: -1.0;
		y: -1.0;
		z: 0.0.
	vertexData second
		x: 1.0;
		y: -1.0;
		z: 0.0.
	vertexData third
		x: -1.0;
		y: 1.0;
		z: 0.0.
	vertexData fourth
		x: -1.0;
		y: 1.0;
		z: 0.0.
	vertexData fifth
		x: 1.0;
		y: -1.0;
		z: 0.0.
	vertexData sixth
		x: 1.0;
		y: 1.0;
		z: 0.0.

	vertexBuffer := gpuDevice unownedNewGPUBufferUsage: SDL_GPU_BUFFERUSAGE_VERTEX size: 6 * SDL3GPUQuadVertex structureSize.
	DiScope own: vertexBuffer.

	"Upload vertex data"
	transferBuffer := gpuDevice unownedNewGPUUploadTransferBuffer: 6 * SDL3GPUQuadVertex structureSize.
	DiScope own: transferBuffer.
	gpuDevice
		mapTransferBuffer: transferBuffer
		cycle: false
		do: [ :mappedAddress | sdl memcpyDst: mappedAddress src: vertexData len: 6 * SDL3GPUQuadVertex structureSize ].

	commandBuffer := gpuDevice acquireGPUCommandBuffer.
	commandBuffer copyPassDo: [ :copyPass |
		copyPass
			uploadBuffer: (SDL_GPUTransferBufferLocation new
				transferBuffer: transferBuffer;
				offset: 0;
				yourself)
			destination: (SDL_GPUBufferRegion new
				buffer: vertexBuffer;
				offset: 0;
				size: 6 * SDL3GPUQuadVertex structureSize;
				yourself)
			cycle: false ].

	"2. Create Pipeline with Depth Testing"
	graphicsPipeline := gpuDevice newGraphicsPipelineBuilder
		vertexShader: SDL3TestGraphicsDepthVertexShaderSource;
		fragmentShader: SDL3TestGraphicsDepthFragmentShaderSource;
		addVertexBufferDescription: (SDL3GPUVertexBufferDescription new
			slot: 0;
			pitch: SDL3GPUQuadVertex structureSize;
			inputRate: SDL3GPUVertexInputRate vertex;
			yourself);
		addVertexAttribute: (SDL3GPUVertexAttribute new
			bufferSlot: 0;
			format: SDL3GPUVertexElementFormat float3;
			location: 0;
			offset: 0;
			yourself);
		targetFormat: SDL_GPU_TEXTUREFORMAT_R8G8B8A8_UNORM;
		depthStencilFormat: SDL_GPU_TEXTUREFORMAT_D16_UNORM;
		enableDepthTest;
		unownedNewPipeline.
	DiScope own: graphicsPipeline.

	"3. Prepare Uniforms"
	blueUniforms := SDL3TestGraphicsFragUniform new
		r: 0.0;
		g: 0.0;
		b: 1.0;
		a: 1.0. "Near Blue"
	redUniforms := SDL3TestGraphicsFragUniform new
		r: 1.0;
		g: 0.0;
		b: 0.0;
		a: 1.0. "Far Red"

	"4. Render"
	colorTargetInfos := SDL3Array newType: SDL_GPUColorTargetInfo size: 1.
	colorTargetInfos first
		texture: colorTarget;
		storeOp: SDL_GPU_STOREOP_STORE;
		loadOp: SDL_GPU_LOADOP_CLEAR.
	colorTargetInfos first clearColor
		r: 0.0;
		g: 0.0;
		b: 0.0;
		a: 1.0.

	depthStencilTargetInfo := SDL_GPUDepthStencilTargetInfo new.
	depthStencilTargetInfo
		texture: depthTarget;
		loadOp: SDL_GPU_LOADOP_CLEAR;
		storeOp: SDL_GPU_STOREOP_DONT_CARE;
		cycle: false.
	depthStencilTargetInfo clearDepth: 1.0.

	commandBuffer renderPassTargets: colorTargetInfos depthStencil: depthStencilTargetInfo do: [ :renderPass |
		vertexBufferBindings := SDL3Array newType: SDL_GPUBufferBinding size: 1.
		vertexBufferBindings first
			buffer: vertexBuffer;
			offset: 0.

		renderPass pipeline: graphicsPipeline.
		renderPass vertexBuffers: vertexBufferBindings slot: 0.

		"A. Draw Blue at z=0.0"
		commandBuffer
			pushVertexUniform: (SDL3TestGraphicsVertUniform new
				x: 0.0;
				y: 0.0;
				z: 0.0)
			slot: 0.
		commandBuffer pushFragmentUniform: blueUniforms slot: 0.
		renderPass
			drawPrimitives: 6
			instances: 1
			firstVertex: 0
			firstInstance: 0.

		"B. Draw Red at z=1.0"
		commandBuffer
			pushVertexUniform: (SDL3TestGraphicsVertUniform new
				x: 0.0;
				y: 0.0;
				z: 1.0)
			slot: 0.
		commandBuffer pushFragmentUniform: redUniforms slot: 0.
		renderPass
			drawPrimitives: 6
			instances: 1
			firstVertex: 0
			firstInstance: 0 ].

	commandBuffer submit.

	"5. Download results"
	DiScope own: (transferBuffer := gpuDevice unownedNewGPUDownloadTransferBuffer: byteSize).
	commandBuffer := gpuDevice acquireGPUCommandBuffer.
	commandBuffer copyPassDo: [ :copyPass |
		copyPass
			downloadTexture: (SDL3GPUTextureRegion new
				texture: colorTarget;
				w: texWidth;
				h: texHeight;
				d: 1;
				yourself)
			destination: (SDL3GPUTextureTransferInfo new
				transferBuffer: transferBuffer;
				offset: 0;
				yourself) ].
	commandBuffer submit.

	gpuDevice waitForGPUIdle.

	"6. Assert result is Blue (0, 0, 255, 255) because Red was rejected"
	gpuDevice mapTransferBuffer: transferBuffer cycle: false do: [ :mappedAddress |
		resultData := FFIArray fromHandle: mappedAddress type: FFIUInt8 size: byteSize.

		{ 1. (byteSize // 2 + 1). (byteSize - 3) } do: [ :baseIdx |
			self assert: (resultData at: baseIdx) equals: 0. "R"
			self assert: (resultData at: baseIdx + 1) equals: 0. "G"
			self assert: (resultData at: baseIdx + 2) equals: 255. "B"
			self assert: (resultData at: baseIdx + 3) equals: 255 ] ]
]

{ #category : 'tests' }
SDL3GraphicsPipelineTest >> test07ShaderWithFormats [

	| vertexShader |
	DiScope own: (vertexShader := SDL3TestGraphicsQuadVertexShaderSource
		unownedNewShaderForDevice: gpuDevice
		formatFlags: gpuDevice gpuShaderFormatFlags).

	self deny: vertexShader isNil.
	self deny: vertexShader isNull
]

{ #category : 'tests' }
SDL3GraphicsPipelineTest >> test08GraphicsPipelineBuilder [
	"Test creating a pipeline using SDL3GPUGraphicsPipelineBuilder"

	| colorTarget graphicsPipeline texWidth texHeight |
	texWidth := 64.
	texHeight := 64.

	colorTarget := gpuDevice
		unownedNew2DGPUTextureFormat: SDL_GPU_TEXTUREFORMAT_R8G8B8A8_UNORM
		usage: SDL_GPU_TEXTUREUSAGE_COLOR_TARGET
		width: texWidth
		height: texHeight.
	DiScope own: colorTarget.

	graphicsPipeline := gpuDevice newGraphicsPipelineBuilder
		vertexShader: SDL3TestGraphicsColorVertexShaderSource;
		fragmentShader: SDL3TestGraphicsColorFragmentShaderSource;
		addVertexBufferFor: SDL3TestGraphicsColorVertex;
		targetFormat: SDL_GPU_TEXTUREFORMAT_R8G8B8A8_UNORM;
		unownedNewPipeline.
	DiScope own: graphicsPipeline.

	self deny: graphicsPipeline isNull.
	self assert: graphicsPipeline vertexMetadata notNil.
	self assert: graphicsPipeline fragmentMetadata notNil
]
