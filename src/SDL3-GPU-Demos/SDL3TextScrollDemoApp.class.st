"
This demo shows text scrolling of a large text file using a texture atlas and instanced quad rendering.
Scroll the mouse wheel to move through the text.
"
Class {
	#name : 'SDL3TextScrollDemoApp',
	#superclass : 'SDL3GPUDemoApp',
	#instVars : [
		'text',
		'atlas',
		'layoutEngine',
		'scrollPosition',
		'targetScrollY',
		'instanceBufferSize',
		'uniforms',
		'lastVisibleLineRange',
		'lastVisibleGlyphCount',
		'pipeline',
		'baseQuadBuffer',
		'instanceBuffer',
		'instanceTransferBuffer',
		'indexBuffer',
		'sampler',
		'atlasTexture',
		'colorTargetInfos',
		'indexBinding',
		'vertexBufferBindings',
		'textureSamplerBindings'
	],
	#category : 'SDL3-GPU-Demos-TextScroll',
	#package : 'SDL3-GPU-Demos',
	#tag : 'TextScroll'
}

{ #category : 'private' }
SDL3TextScrollDemoApp >> applyAtlas: aTextAtlas [

	| previousLineHeight newLineHeight |
	previousLineHeight := layoutEngine ifNil: [ 0 ] ifNotNil: [ layoutEngine lineHeight ].
	atlas := aTextAtlas.
	layoutEngine ifNil: [ layoutEngine := SDL3TextLayoutEngine new ].
	layoutEngine atlas: aTextAtlas.
	newLineHeight := layoutEngine lineHeight.
	(previousLineHeight > 0 and: [ newLineHeight > 0 ]) ifTrue: [
		| scaleRatio |
		scaleRatio := newLineHeight asFloat / previousLineHeight asFloat.
		targetScrollY := targetScrollY * scaleRatio.
		scrollPosition := (scrollPosition x * scaleRatio) @ (scrollPosition y * scaleRatio) ].
	lastVisibleLineRange := nil
]

{ #category : 'accessing' }
SDL3TextScrollDemoApp >> atlas [

	^ atlas
]

{ #category : 'private' }
SDL3TextScrollDemoApp >> atlasCharacters [

	^ ((32 to: 126) collect: [ :code | Character value: code ])
		reject: [ :character | character isSeparator ]
]

{ #category : 'private' }
SDL3TextScrollDemoApp >> clampScrollToViewport [

	| viewportHeight maxScrollY |
	(window isNil or: [ layoutEngine isNil ]) ifTrue: [ ^ self ].
	viewportHeight := window pixelExtent y.
	maxScrollY := (layoutEngine totalHeight - viewportHeight max: 0) asFloat.
	targetScrollY := (targetScrollY max: 0.0) min: maxScrollY.
	scrollPosition := scrollPosition x @ ((scrollPosition y max: 0.0) min: maxScrollY)
]

{ #category : 'private' }
SDL3TextScrollDemoApp >> currentDeviceScale [

	| density |
	density := window ifNil: [ 1.0 ] ifNotNil: [ window pixelDensity ].
	^ density @ density
]

{ #category : 'rendering' }
SDL3TextScrollDemoApp >> doRenderPassesOn: swapchainTexture with: commandBuffer [

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
SDL3TextScrollDemoApp >> executeTextRenderPassOn: swapchainTexture with: commandBuffer glyphCount: visibleGlyphCount [

	| pixelExtent |
	pixelExtent := window pixelExtent.
	colorTargetInfos first texture: swapchainTexture.
	commandBuffer renderPassTargets: colorTargetInfos do: [ :renderPass |
		vertexBufferBindings first buffer: baseQuadBuffer.
		vertexBufferBindings second buffer: instanceBuffer.

		renderPass
			pipeline: pipeline;
			vertexBuffers: vertexBufferBindings slot: 0;
			indexBuffer16Bit: indexBinding;
			fragmentSamplers: textureSamplerBindings slot: 0.

		uniforms
			scrollOffsetX: scrollPosition x;
			scrollOffsetY: scrollPosition y;
			viewportWidth: pixelExtent x asFloat;
			viewportHeight: pixelExtent y asFloat.

		commandBuffer pushVertexUniform: uniforms slot: 0.

		renderPass
			drawIndexedPrimitives: 6
			instances: visibleGlyphCount
			firstIndex: 0
			vertexOffset: 0
			firstInstance: 0 ]
]

{ #category : 'initialization' }
SDL3TextScrollDemoApp >> initialize [

	super initialize.

	text := 'Loading text...'.
	scrollPosition := 0 @ 0.
	targetScrollY := 0.0.
	instanceBufferSize := 0.

	uniforms := SDL3TextScrollUniforms new.

	"Initialize Palette: 16 RGBA floats directly in uniforms"
	"0: Black (Standard FG)"
	uniforms
		setColorAt: 1
		r: 0.0
		g: 0.0
		b: 0.0
		a: 1.0.
	"1: Green (Comment FG)"
	uniforms
		setColorAt: 2
		r: 0.0
		g: 0.6
		b: 0.0
		a: 1.0.
	"2: Blue (Keyword FG)"
	uniforms
		setColorAt: 3
		r: 0.0
		g: 0.0
		b: 0.8
		a: 1.0.
	"3: Red (Separator FG)"
	uniforms
		setColorAt: 4
		r: 0.8
		g: 0.0
		b: 0.0
		a: 1.0.
	"4: Transparent (Standard BG)"
	uniforms
		setColorAt: 5
		r: 0.0
		g: 0.0
		b: 0.0
		a: 0.0.
	"5: Light Gray (Header BG)"
	uniforms
		setColorAt: 6
		r: 0.9
		g: 0.9
		b: 0.9
		a: 1.0
]

{ #category : 'initialization' }
SDL3TextScrollDemoApp >> initializeAtlas [

	| initialAtlas |
	initialAtlas :=
		SDL3TextAtlasGenerator new
			generateAtlasFor: self atlasCharacters
			deviceScale: self currentDeviceScale.
	atlas := initialAtlas.
	layoutEngine :=
		SDL3TextLayoutEngine new
			atlas: initialAtlas;
			yourself.
	layoutEngine layoutString: text.
	lastVisibleLineRange := nil
]

{ #category : 'initialization' }
SDL3TextScrollDemoApp >> initializeBaseQuadBuffer [

	DiScope own:
		(baseQuadBuffer := gpuDevice
			                  unownedNewGPUBufferUsage: SDL_GPU_BUFFERUSAGE_VERTEX
			                  size: SDL3GPUQuadVertex structureSize * 4).
	vertexBufferBindings first buffer: baseQuadBuffer.

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
SDL3TextScrollDemoApp >> initializeGPUResources [

	self initializeTexture.
	self initializeSampler.
	self initializeBaseQuadBuffer.
	self initializeIndexBuffer.
	self initializePipeline
]

{ #category : 'initialization' }
SDL3TextScrollDemoApp >> initializeIndexBuffer [

	DiScope own: (indexBuffer := gpuDevice unownedNewGPUBufferUsage: SDL_GPU_BUFFERUSAGE_INDEX size: 6 * 2).
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
SDL3TextScrollDemoApp >> initializePipeline [

	pipeline := gpuDevice newGraphicsPipelineBuilder
		vertexShader: SDL3TextScrollVertexShaderSource;
		fragmentShader: SDL3TextScrollFragmentShaderSource;
		addVertexBufferFor: SDL3GPUQuadVertex;
		addVertexBufferFor: SDL3TextScrollInstance
			slot: 1
			inputRate: SDL3GPUVertexInputRate instance;
		targetWindow: window;
		enableAlphaBlending;
		unownedNewPipeline.
	DiScope own: pipeline
]

{ #category : 'initialization' }
SDL3TextScrollDemoApp >> initializeSampler [

	DiScope own: (sampler := gpuDevice unownedNewGPUSampler: [ :info |
		info
			minFilter: SDL_GPU_FILTER_NEAREST;
			magFilter: SDL_GPU_FILTER_NEAREST;
			mipmapMode: SDL_GPU_SAMPLERMIPMAPMODE_NEAREST;
			addressModeU: SDL_GPU_SAMPLERADDRESSMODE_CLAMP_TO_EDGE;
			addressModeV: SDL_GPU_SAMPLERADDRESSMODE_CLAMP_TO_EDGE;
			addressModeW: SDL_GPU_SAMPLERADDRESSMODE_CLAMP_TO_EDGE ]).

	textureSamplerBindings first sampler: sampler
]

{ #category : 'initialization' }
SDL3TextScrollDemoApp >> initializeTexture [

	atlasTexture := DiScope
		dispose: atlasTexture
		andOwn: (gpuDevice
			unownedNew2DGPUTextureFormat: SDL_GPU_TEXTUREFORMAT_R8_UNORM
			usage: SDL_GPU_TEXTUREUSAGE_SAMPLER
			width: atlas width
			height: atlas height).

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
SDL3TextScrollDemoApp >> instanceStride [
	"Pos (2) + Ext (2) + UV (4) + colorIndices (1 uint32) = 9 units = 36 bytes"

	^ 36
]

{ #category : 'accessing' }
SDL3TextScrollDemoApp >> layoutEngine [

	^ layoutEngine
]

{ #category : 'private' }
SDL3TextScrollDemoApp >> prepareInstanceBufferWith: commandBuffer [

	| pixelExtent visibleLineRange firstLine lastLine visibleGlyphCount |
	pixelExtent := window pixelExtent.
	visibleLineRange := layoutEngine visibleLineRangeIn: (scrollPosition extent: pixelExtent).

	"Optimization: Skip layout and upload if the visible range is the same"
	visibleLineRange = lastVisibleLineRange ifTrue: [ ^ lastVisibleGlyphCount ].

	firstLine := visibleLineRange x.
	lastLine := visibleLineRange y.

	"Exact character count for visible lines to prevent overflow"
	visibleGlyphCount := (layoutEngine characterCountFromLine: firstLine to: lastLine) + 100.

	"Recycle or resize GPU buffers"
	(instanceBuffer isNil or: [ instanceBufferSize < (visibleGlyphCount * SDL3TextScrollInstance structureSize) ]) ifTrue: [
		instanceBufferSize := (visibleGlyphCount * SDL3TextScrollInstance structureSize * 1.5) ceiling.
		instanceBuffer := DiScope
			dispose: instanceBuffer
			andOwn: (gpuDevice unownedNewGPUBufferUsage: SDL_GPU_BUFFERUSAGE_VERTEX size: instanceBufferSize).
		instanceTransferBuffer := DiScope
			dispose: instanceTransferBuffer
			andOwn: (gpuDevice unownedNewGPUUploadTransferBuffer: instanceBufferSize) ].

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
					in: (scrollPosition extent: pixelExtent)
					into: mappedInstances ] ].

	visibleGlyphCount = 0 ifTrue: [
		lastVisibleLineRange := visibleLineRange.
		lastVisibleGlyphCount := 0.
		^ 0 ].

	lastVisibleLineRange := visibleLineRange.
	lastVisibleGlyphCount := visibleGlyphCount.

	^ visibleGlyphCount
]

{ #category : 'private' }
SDL3TextScrollDemoApp >> refreshDisplayScale [

	| targetScale newAtlas |
	(window isNil or: [ atlas isNil ]) ifTrue: [ ^ self ].
	targetScale := self currentDeviceScale.
	atlas deviceScale = targetScale ifTrue: [ ^ self ].

	newAtlas :=
		SDL3TextAtlasGenerator new
			generateAtlasFor: self atlasCharacters
			deviceScale: targetScale.
	self applyAtlas: newAtlas.
	self clampScrollToViewport.
	gpuDevice ifNotNil: [ self initializeTexture ]
]

{ #category : 'accessing' }
SDL3TextScrollDemoApp >> scrollPosition [

	^ scrollPosition
]

{ #category : 'accessing' }
SDL3TextScrollDemoApp >> scrollPosition: aPoint [

	scrollPosition := aPoint
]

{ #category : 'lifecycle' }
SDL3TextScrollDemoApp >> setUp [
	"Load the large text file"

	[ text := FileLocator changes readStream next: 10e6 ]
		on: Error
		do: [ :ex | text := 'Error loading changes file: ', ex messageText ].

	super setUp.
	DiScope own: (colorTargetInfos := SDL3Array unownedNewType: SDL_GPUColorTargetInfo size: 1).
	colorTargetInfos first beClear: Color white.
	DiScope own: (indexBinding := SDL_GPUBufferBinding unownedNew
		beOffset: 0;
		yourself).
	DiScope own: (vertexBufferBindings := SDL3Array unownedNewType: SDL_GPUBufferBinding size: 2).
	DiScope own: (textureSamplerBindings := SDL3Array unownedNewType: SDL_GPUTextureSamplerBinding size: 1).

	self initializeAtlas.
	self initializeGPUResources
]

{ #category : 'hooks' }
SDL3TextScrollDemoApp >> step: deltaSeconds [

	| lerpFactor |
	"Smoothly interpolate current scroll position towards target"
	lerpFactor := 1.0 - (0.7 raisedTo: deltaSeconds * 60.0).
	scrollPosition := scrollPosition x @ (scrollPosition y + ((targetScrollY - scrollPosition y) * lerpFactor)).

	"Avoid endless micro-steps"
	(targetScrollY - scrollPosition y) abs < 0.1 ifTrue: [
		scrollPosition := scrollPosition x @ targetScrollY ].

	self render
]

{ #category : 'accessing' }
SDL3TextScrollDemoApp >> targetScrollY [

	^ targetScrollY
]

{ #category : 'accessing' }
SDL3TextScrollDemoApp >> targetScrollY: aFloat [

	targetScrollY := aFloat
]

{ #category : 'accessing' }
SDL3TextScrollDemoApp >> text [

	^ text
]

{ #category : 'visiting - concrete' }
SDL3TextScrollDemoApp >> visitMouseWheelEvent: aMouseWheelEvent [

	| scrollSpeed maxScrollY |
	super visitMouseWheelEvent: aMouseWheelEvent.

	scrollSpeed := 30.0 * window pixelDensity.
	targetScrollY := targetScrollY - (aMouseWheelEvent y * scrollSpeed).
	maxScrollY := (layoutEngine totalHeight - window pixelExtent y max: 0) asFloat.
	targetScrollY := (targetScrollY max: 0.0) min: maxScrollY
]

{ #category : 'visiting - concrete' }
SDL3TextScrollDemoApp >> visitWindowDisplayScaleChangedEvent: aWindowDisplayScaleChangedEvent [

	aWindowDisplayScaleChangedEvent windowID = window id ifTrue: [
		self refreshDisplayScale ].

	^ super visitWindowDisplayScaleChangedEvent: aWindowDisplayScaleChangedEvent
]

{ #category : 'hooks' }
SDL3TextScrollDemoApp >> windowPixelSizeChanged: aPixelExtent [

	self refreshDisplayScale.
	self clampScrollToViewport.
	lastVisibleLineRange := nil
]
