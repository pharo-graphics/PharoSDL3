"
I demonstrate smooth text scrolling of a large text file using a texture atlas and instanced quad rendering.
"
Class {
	#name : 'SDL3TextScrollDemo',
	#superclass : 'SDL3GPUDemoApp',
	#instVars : [
		'text',
		'atlas',
		'layoutEngine',
		'scrollPosition',
		'targetScrollY',
		'gpuPipeline',
		'baseQuadBuffer',
		'instanceBuffer',
		'instanceBufferSize',
		'sampler',
		'atlasTexture',
		'colorTargetInfos',
		'vertexBufferBindings',
		'textureSamplerBindings',
		'indexBinding',
		'indexBuffer',
		'uniforms',
		'instanceTransferBuffer',
		'lastVisibleLineRange',
		'lastVisibleGlyphCount'
	],
	#category : 'SDL3-GPUDemos-TextScroll',
	#package : 'SDL3-GPUDemos',
	#tag : 'TextScroll'
}

{ #category : 'accessing' }
SDL3TextScrollDemo >> atlas [
	^ atlas
]

{ #category : 'lifecycle' }
SDL3TextScrollDemo >> close [

	gpuPipeline ifNotNil: [
		gpuPipeline release.
		gpuPipeline := nil ].

	baseQuadBuffer ifNotNil: [
		baseQuadBuffer release.
		baseQuadBuffer := nil ].

	instanceBuffer ifNotNil: [
		instanceBuffer release.
		instanceBuffer := nil ].

	instanceTransferBuffer ifNotNil: [
		instanceTransferBuffer release.
		instanceTransferBuffer := nil ].

	indexBuffer ifNotNil: [
		indexBuffer release.
		indexBuffer := nil ].

	sampler ifNotNil: [
		sampler release.
		sampler := nil ].

	atlasTexture ifNotNil: [
		atlasTexture release.
		atlasTexture := nil ].

	super close
]

{ #category : 'rendering' }
SDL3TextScrollDemo >> doRenderPassesOn: swapchainTexture with: commandBuffer [

	| visibleGlyphCount |
	"1. Prepare instance data"
	visibleGlyphCount := self prepareInstanceBufferWith: commandBuffer.
	visibleGlyphCount = 0 ifTrue: [ ^ self ].

	"2. Execute Render Pass"
	self
		executeTextRenderPassOn: swapchainTexture
		with: commandBuffer
		glyphCount: visibleGlyphCount
]

{ #category : 'private' }
SDL3TextScrollDemo >> executeTextRenderPassOn: swapchainTexture with: commandBuffer glyphCount: visibleGlyphCount [

	colorTargetInfos first texture: swapchainTexture.
	commandBuffer renderPassTargets: colorTargetInfos do: [ :renderPass |
		vertexBufferBindings first buffer: baseQuadBuffer.
		vertexBufferBindings second buffer: instanceBuffer.

		renderPass
			pipeline: gpuPipeline;
			vertexBuffers: vertexBufferBindings slot: 2;
			indexBuffer16Bit: indexBinding;
			fragmentSamplers: textureSamplerBindings slot: 0.

		uniforms
			scrollOffsetX: scrollPosition x;
			scrollOffsetY: scrollPosition y;
			viewportWidth: window pixelExtent x asFloat;
			viewportHeight: window pixelExtent y asFloat.

		commandBuffer
			pushVertexUniform: uniforms slot: 0.

		renderPass
			drawIndexedPrimitives: 6
			instances: visibleGlyphCount
			firstIndex: 0
			vertexOffset: 0
			firstInstance: 0 ]
]

{ #category : 'initialization' }
SDL3TextScrollDemo >> initialize [

	super initialize.

	text := 'Loading text...'.
	scrollPosition := 0 @ 0.
	targetScrollY := 0.0.
	instanceBufferSize := 0.

	colorTargetInfos := SDL_GPUColorTargetInfo safeNewArray: 1.
	colorTargetInfos first
		beClear: Color white.

	vertexBufferBindings := FFIArray newType: SDL_GPUBufferBinding size: 2.
	textureSamplerBindings := FFIArray
								  newType: SDL_GPUTextureSamplerBinding
								  size: 1.
	indexBinding := SDL_GPUBufferBinding offset: 0.

	uniforms := SDL3TextScrollUniforms new.

	"Initialize Palette: 16 RGBA floats directly in uniforms"
	"0: Black (Standard FG)"
	uniforms setColorAt: 1 r: 0.0 g: 0.0 b: 0.0 a: 1.0.
	"1: Green (Comment FG)"
	uniforms setColorAt: 2 r: 0.0 g: 0.6 b: 0.0 a: 1.0.
	"2: Blue (Keyword FG)"
	uniforms setColorAt: 3 r: 0.0 g: 0.0 b: 0.8 a: 1.0.
	"3: Red (Separator FG)"
	uniforms setColorAt: 4 r: 0.8 g: 0.0 b: 0.0 a: 1.0.
	"4: Transparent (Standard BG)"
	uniforms setColorAt: 5 r: 0.0 g: 0.0 b: 0.0 a: 0.0.
	"5: Light Gray (Header BG)"
	uniforms setColorAt: 6 r: 0.9 g: 0.9 b: 0.9 a: 1.0
]

{ #category : 'initialization' }
SDL3TextScrollDemo >> initializeAtlas [

	| generator scale chars |
	generator := SDL3TextAtlasGenerator new.
	scale := window pixelDensity @ window pixelDensity.

	"Efficient character set: Standard ASCII 32-126 + any other char found in the first 1MB of text"
	chars := ((32 to: 126) collect: [ :i | i asCharacter ]) asSet.
	1 to: (text size min: 1e6) do: [ :i | chars add: (text at: i) ].
	chars := (chars reject: [ :c | c isSeparator or: [ c asciiValue < 32 ] ]) asSortedCollection.

	atlas := generator generateAtlasFor: chars deviceScale: scale.
	layoutEngine := SDL3TextLayoutEngine new atlas: atlas.
	layoutEngine layoutString: text
]

{ #category : 'initialization' }
SDL3TextScrollDemo >> initializeBaseQuadBuffer [

	baseQuadBuffer := gpuDevice
		                  newGPUBufferUsage: SDL_GPU_BUFFERUSAGE_VERTEX
		                  size: SDL3GPUQuadVertex structureSize * 4.

	gpuDevice uploadToGPUDo: [ :uploader |
		uploader
			uploadTo: baseQuadBuffer
			type: SDL3GPUQuadVertex
			count: 4
			cycle: true
			fillWith: [ :vertices |
				"Base quad: 0..1 in x, 0..-1 in y"
				vertices first  x: 0; y:  0; z: 0; u: 0; v: 0.
				vertices second x: 1; y:  0; z: 0; u: 1; v: 0.
				vertices third  x: 1; y: -1; z: 0; u: 1; v: 1.
				vertices fourth x: 0; y: -1; z: 0; u: 0; v: 1 ] ]
]

{ #category : 'initialization' }
SDL3TextScrollDemo >> initializeGPUResources [

	self initializeTexture.
	self initializeSampler.
	self initializeBaseQuadBuffer.
	self initializeIndexBuffer.
	self initializePipeline
]

{ #category : 'initialization' }
SDL3TextScrollDemo >> initializeIndexBuffer [

	indexBuffer := gpuDevice
		               newGPUBufferUsage: SDL_GPU_BUFFERUSAGE_INDEX
		               size: 6 * 2.
	indexBinding buffer: indexBuffer.

	gpuDevice uploadToGPUDo: [ :uploader |
		uploader
			uploadTo: indexBuffer
			type: FFIUInt16
			count: 6
			cycle: true
			fillWith: [ :indices |
				indices
					at: 1 put: 0;
					at: 2 put: 1;
					at: 3 put: 2;
					at: 4 put: 0;
					at: 5 put: 2;
					at: 6 put: 3 ] ]
]

{ #category : 'initialization' }
SDL3TextScrollDemo >> initializePipeline [

	| vertexShader fragmentShader vertexBindings vertexAttributes colorTargets |

	vertexShader := SDL3TextScrollVertexShaderSource newShaderAmong: shaderFormats device: gpuDevice.
	fragmentShader := SDL3TextScrollFragmentShaderSource newShaderAmong: shaderFormats device: gpuDevice.

	vertexBindings := SDL_GPUVertexBufferDescription safeNewArray: 2.
	vertexBindings first
		slot: 2;
		inputRate: SDL_GPU_VERTEXINPUTRATE_VERTEX;
		instanceStepRate: 0;
		pitch: SDL3GPUQuadVertex structureSize.
	vertexBindings second
		slot: 3;
		inputRate: SDL_GPU_VERTEXINPUTRATE_INSTANCE;
		instanceStepRate: 0;
		pitch: SDL3TextScrollInstance structureSize.

	vertexAttributes := SDL_GPUVertexAttribute safeNewArray: 6.
	vertexAttributes first
		bufferSlot: 2;
		format: SDL_GPU_VERTEXELEMENTFORMAT_FLOAT3;
		location: 0;
		offset: 0.
	vertexAttributes second
		bufferSlot: 2;
		format: SDL_GPU_VERTEXELEMENTFORMAT_FLOAT2;
		location: 1;
		offset: 12.
	vertexAttributes third
		bufferSlot: 3;
		format: SDL_GPU_VERTEXELEMENTFORMAT_FLOAT2;
		location: 2;
		offset: 0.
	vertexAttributes fourth
		bufferSlot: 3;
		format: SDL_GPU_VERTEXELEMENTFORMAT_FLOAT2;
		location: 3;
		offset: 8.
	vertexAttributes fifth
		bufferSlot: 3;
		format: SDL_GPU_VERTEXELEMENTFORMAT_FLOAT4;
		location: 4;
		offset: 16.
	vertexAttributes sixth
		bufferSlot: 3;
		format: SDL_GPU_VERTEXELEMENTFORMAT_UINT;
		location: 5;
		offset: 32.

	colorTargets := SDL_GPUColorTargetDescription safeNewArray: 1.
	colorTargets first
		format: (gpuDevice getGPUSwapchainTextureFormatIntoWindow: window);
		blendState: SDL_GPUColorTargetBlendState newAlphaBlend.

	gpuPipeline := gpuDevice newGraphicsPipeline: [ :info |
		info
			vertex: vertexShader
			fragment: fragmentShader
			targets: colorTargets.
		info vertexInputState
			attributes: vertexAttributes
			bindings: vertexBindings ].

	vertexShader release.
	fragmentShader release
]

{ #category : 'initialization' }
SDL3TextScrollDemo >> initializeSampler [

	sampler := gpuDevice newSampler: [ :info |
		info
			minFilter: SDL_GPU_FILTER_NEAREST;
			magFilter: SDL_GPU_FILTER_NEAREST;
			mipmapMode: SDL_GPU_SAMPLERMIPMAPMODE_NEAREST;
			addressModeU: SDL_GPU_SAMPLERADDRESSMODE_CLAMP_TO_EDGE;
			addressModeV: SDL_GPU_SAMPLERADDRESSMODE_CLAMP_TO_EDGE;
			addressModeW: SDL_GPU_SAMPLERADDRESSMODE_CLAMP_TO_EDGE ].

	textureSamplerBindings first sampler: sampler
]

{ #category : 'initialization' }
SDL3TextScrollDemo >> initializeTexture [

	atlasTexture := gpuDevice
		                new2DGPUTextureFormat: SDL_GPU_TEXTUREFORMAT_R8_UNORM
		                usage: SDL_GPU_TEXTUREUSAGE_SAMPLER
		                width: atlas width
		                height: atlas height.

	"Cairo A8 surfaces may have padding (stride). We forced width to be a multiple of 4, so stride == width."
	gpuDevice uploadToGPUDo: [ :uploader |
		uploader
			uploadTexture: atlasTexture
			fromPointer: atlas dataPtr
			byteSize: atlas width * atlas height
			w: atlas width
			h: atlas height
			cycle: true ].

	textureSamplerBindings first texture: atlasTexture
]

{ #category : 'accessing' }
SDL3TextScrollDemo >> instanceStride [
	"Pos (2) + Ext (2) + UV (4) + colorIndices (1 uint32) = 9 units = 36 bytes"

	^ 36
]

{ #category : 'lifecycle' }
SDL3TextScrollDemo >> open [

	"Load the large text file"
	[ text := FileLocator changes readStream next: 10e6 ] on: Error do: [ :ex |
		text := 'Error loading changes file: ', ex messageText ].

	super open.
	self initializeAtlas.
	self initializeGPUResources
]

{ #category : 'private' }
SDL3TextScrollDemo >> prepareInstanceBufferWith: commandBuffer [

	| visibleLineRange firstLine lastLine visibleGlyphCount |

	visibleLineRange := layoutEngine visibleLineRangeIn:
							(scrollPosition extent: window pixelExtent).

	"Optimization: Skip layout and upload if the visible range is the same"
	visibleLineRange = lastVisibleLineRange ifTrue: [
		^ lastVisibleGlyphCount ].

	firstLine := visibleLineRange x.
	lastLine := visibleLineRange y.

	"Exact character count for visible lines to prevent overflow"
	visibleGlyphCount := (layoutEngine
							 characterCountFromLine: firstLine
							 to: lastLine) + 100.

	"Recycle or resize GPU buffers"
	(instanceBuffer isNil or: [ instanceBufferSize < (visibleGlyphCount * SDL3TextScrollInstance structureSize) ])
		ifTrue: [
			instanceBuffer ifNotNil: [
				instanceBuffer release ].
			instanceTransferBuffer ifNotNil: [
				instanceTransferBuffer release ].
			instanceBufferSize := (visibleGlyphCount * SDL3TextScrollInstance structureSize * 1.5) ceiling.
			instanceBuffer := gpuDevice
								 newGPUBufferUsage: SDL_GPU_BUFFERUSAGE_VERTEX
								 size: instanceBufferSize.
			instanceTransferBuffer := gpuDevice newUploadTransferBuffer:
										 instanceBufferSize ].

	commandBuffer uploadToGPUDo: [ :uploader |
		uploader
			transferBuffer: instanceTransferBuffer
			uploadTo: instanceBuffer
			type: SDL3TextScrollInstance
			count: visibleGlyphCount
			cycle: true
			fillWith: [ :mappedInstances |
				"Lazy Layout into the buffer"
				visibleGlyphCount := layoutEngine
										layoutVisibleLinesOf: text
										in: (scrollPosition extent: window pixelExtent)
										into: mappedInstances ] ].

	visibleGlyphCount = 0 ifTrue: [
		lastVisibleLineRange := visibleLineRange.
		lastVisibleGlyphCount := 0.
		^ 0 ].

	lastVisibleLineRange := visibleLineRange.
	lastVisibleGlyphCount := visibleGlyphCount.

	^ visibleGlyphCount
]

{ #category : 'hooks' }
SDL3TextScrollDemo >> step [

	| lerpFactor |
	"Smoothly interpolate current scroll position towards target"
	lerpFactor := 0.3.
	scrollPosition := scrollPosition x @ (scrollPosition y + ((targetScrollY - scrollPosition y) * lerpFactor)).

	"Avoid endless micro-steps"
	(targetScrollY - scrollPosition y) abs < 0.1 ifTrue: [
		scrollPosition := scrollPosition x @ targetScrollY ].

	self render
]

{ #category : 'accessing' }
SDL3TextScrollDemo >> text [

	^ text
]

{ #category : 'visiting - concrete' }
SDL3TextScrollDemo >> visitMouseWheelEvent: aMouseWheelEvent [

	| scrollSpeed maxScrollY |
	super visitMouseWheelEvent: aMouseWheelEvent.

	scrollSpeed := 30.0. "Increased for better feel with interpolation"

	"Update targetScrollY"
	targetScrollY := targetScrollY - (aMouseWheelEvent y * scrollSpeed).

	"Clamp to boundaries"
	targetScrollY := targetScrollY max: 0.0.
	maxScrollY := (layoutEngine totalHeight - window pixelExtent y max: 0) asFloat.
	targetScrollY := targetScrollY min: maxScrollY
]
