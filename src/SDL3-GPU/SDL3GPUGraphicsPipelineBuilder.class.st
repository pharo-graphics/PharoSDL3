"
I am a builder for configuring and creating SDL3 GPU graphics pipelines with  pre-flight layout validation, and vertex struct reflection.
"
Class {
	#name : 'SDL3GPUGraphicsPipelineBuilder',
	#superclass : 'Object',
	#instVars : [
		'device',
		'primitiveType',
		'vertexShader',
		'fragmentShader',
		'vertexBindings',
		'vertexAttributes',
		'colorTargets',
		'targetFormat',
		'targetWindow',
		'blendState',
		'depthStencilState',
		'hasDepthStencil',
		'depthStencilFormat',
		'rasterizerState',
		'multisampleState'
	],
	#category : 'SDL3-GPU-Pipeline',
	#package : 'SDL3-GPU',
	#tag : 'Pipeline'
}

{ #category : 'instance creation' }
SDL3GPUGraphicsPipelineBuilder class >> new [

	self error: 'Create instance with a device with #on:'
]

{ #category : 'instance creation' }
SDL3GPUGraphicsPipelineBuilder class >> on: aGPUDevice [

	^ self basicNew
		initializeOn: aGPUDevice;
		yourself
]

{ #category : 'configuring' }
SDL3GPUGraphicsPipelineBuilder >> addColorTarget: aColorTargetDescription [

	colorTargets add: aColorTargetDescription
]

{ #category : 'configuring' }
SDL3GPUGraphicsPipelineBuilder >> addVertexAttribute: aVertexAttribute [

	vertexAttributes add: aVertexAttribute
]

{ #category : 'configuring' }
SDL3GPUGraphicsPipelineBuilder >> addVertexBufferDescription: aVertexBufferDescription [

	vertexBindings add: aVertexBufferDescription
]

{ #category : 'configuring' }
SDL3GPUGraphicsPipelineBuilder >> addVertexBufferFor: aVertexClass [

	self
		addVertexBufferFor: aVertexClass
		slot: vertexBindings size
		inputRate: SDL3GPUVertexInputRate vertex
]

{ #category : 'configuring' }
SDL3GPUGraphicsPipelineBuilder >> addVertexBufferFor: aVertexClass slot: aSlot inputRate: anInputRate [

	| bufferDescription elements |
	bufferDescription :=
		aVertexClass
			asVertexBufferDescriptionForSlot: aSlot
			inputRate: anInputRate.
	vertexBindings add: bufferDescription.

	elements := aVertexClass gpuVertexElementsDescription.
	elements do: [ :each |
		vertexAttributes add: (each asVertexAttributeForSlot: aSlot) ]
]

{ #category : 'private - building' }
SDL3GPUGraphicsPipelineBuilder >> basicUnownedNewPipeline [

	| formatFlags actualVertexShader actualFragmentShader |
	formatFlags := device gpuShaderFormatFlags.

	actualVertexShader := DiScope own:
		(vertexShader unownedNewShaderForDevice: device formatFlags: formatFlags).
	actualFragmentShader := DiScope own:
		(fragmentShader unownedNewShaderForDevice: device formatFlags: formatFlags).

	^ device unownedNewGPUGraphicsPipeline: [ :info |
		info
			primitiveType: primitiveType;
			vertexShader: actualVertexShader;
			fragmentShader: actualFragmentShader;
			vertexMetadata: actualVertexShader metadata;
			fragmentMetadata: actualFragmentShader metadata.

		self buildColorTargetsInto: info.
		self buildVertexBindingsInto: info.
		self buildVertexAttributesInto: info.

		hasDepthStencil ifTrue: [
			info targetInfo
				hasDepthStencilTarget: true;
				depthStencilFormat: depthStencilFormat ].

		depthStencilState ifNotNil: [ info depthStencilState: depthStencilState ].
		rasterizerState ifNotNil: [ info rasterizerState: rasterizerState ].
		multisampleState ifNotNil: [ info multisampleState: multisampleState ] ]
]

{ #category : 'configuring' }
SDL3GPUGraphicsPipelineBuilder >> blendState: aBlendState [

	blendState := aBlendState
]

{ #category : 'private - building' }
SDL3GPUGraphicsPipelineBuilder >> buildColorTargetsInto: aPipelineCreateInfo [

	colorTargets notEmpty ifTrue: [
		| array |
		array := DiScope own: (SDL3Array unownedNewType: SDL3GPUColorTargetDescription size: colorTargets size).
		colorTargets withIndexDo: [ :src :index |
			| dst |
			dst := array at: index.
			dst
				format: src format;
				blendState: src blendState ].
		aPipelineCreateInfo targetInfo
			colorTargetDescriptions: array;
			numColorTargets: array size.
		^ self ].

	targetFormat ifNotNil: [
		| array |
		array := DiScope own: (SDL3Array unownedNewType: SDL3GPUColorTargetDescription size: 1).
		array first format: targetFormat.
		blendState ifNotNil: [ array first blendState: blendState ].
		aPipelineCreateInfo targetInfo
			colorTargetDescriptions: array;
			numColorTargets: array size ]
]

{ #category : 'private - building' }
SDL3GPUGraphicsPipelineBuilder >> buildVertexAttributesInto: aPipelineCreateInfo [

	| array |
	vertexAttributes ifEmpty: [ ^ self ].
	array := DiScope own: (SDL3Array unownedNewType: SDL3GPUVertexAttribute size: vertexAttributes size).
	vertexAttributes withIndexDo: [ :src :index |
		| dst |
		dst := array at: index.
		dst
			bufferSlot: src bufferSlot;
			format: src format;
			location: src location;
			offset: src offset ].
	aPipelineCreateInfo vertexInputState
		vertexAttributes: array;
		numVertexAttributes: array size
]

{ #category : 'private - building' }
SDL3GPUGraphicsPipelineBuilder >> buildVertexBindingsInto: aPipelineCreateInfo [

	| array |
	vertexBindings ifEmpty: [ ^ self ].
	array := DiScope own: (SDL3Array unownedNewType: SDL3GPUVertexBufferDescription size: vertexBindings size).
	vertexBindings withIndexDo: [ :src :index |
		| dst |
		dst := array at: index.
		dst
			slot: src slot;
			pitch: src pitch;
			inputRate: src inputRate;
			instanceStepRate: src instanceStepRate ].
	aPipelineCreateInfo vertexInputState
		vertexBufferDescriptions: array;
		numVertexBuffers: array size
]

{ #category : 'configuring' }
SDL3GPUGraphicsPipelineBuilder >> depthStencilFormat: aFormat [

	depthStencilFormat := aFormat.
	hasDepthStencil := true
]

{ #category : 'configuring' }
SDL3GPUGraphicsPipelineBuilder >> depthStencilState: aState [

	depthStencilState := aState
]

{ #category : 'configuring' }
SDL3GPUGraphicsPipelineBuilder >> enableAlphaBlending [

	blendState := SDL3GPUColorTargetBlendState newAlphaBlend
]

{ #category : 'configuring' }
SDL3GPUGraphicsPipelineBuilder >> enableDepthTest [

	depthStencilState := SDL3GPUDepthStencilState new
		enableDepthTest: true;
		enableDepthWrite: true;
		compareOp: SDL3GPUCompareOp less;
		yourself
]

{ #category : 'accessing' }
SDL3GPUGraphicsPipelineBuilder >> fragmentShader: aFragmentShaderSource [

	fragmentShader := aFragmentShaderSource
]

{ #category : 'initialization' }
SDL3GPUGraphicsPipelineBuilder >> initializeOn: aSDL3GPUDevice [

	self initialize.
	
	device := aSDL3GPUDevice.
	
	primitiveType := SDL3GPUPrimitiveType triangleList.
	vertexBindings := OrderedCollection new.
	vertexAttributes := OrderedCollection new.
	colorTargets := OrderedCollection new.
	hasDepthStencil := false
]

{ #category : 'configuring' }
SDL3GPUGraphicsPipelineBuilder >> multisampleState: aState [

	multisampleState := aState
]

{ #category : 'copying' }
SDL3GPUGraphicsPipelineBuilder >> postCopy [

	super postCopy.
	vertexBindings := vertexBindings collect: #copy.
	vertexAttributes := vertexAttributes collect: #copy.
	colorTargets := colorTargets collect: #copy
]

{ #category : 'accessing' }
SDL3GPUGraphicsPipelineBuilder >> primitiveType: aPrimitiveType [

	primitiveType := aPrimitiveType
]

{ #category : 'configuring' }
SDL3GPUGraphicsPipelineBuilder >> rasterizerState: aState [

	rasterizerState := aState
]

{ #category : 'configuring' }
SDL3GPUGraphicsPipelineBuilder >> targetFormat: aFormat [

	targetFormat := aFormat
]

{ #category : 'configuring' }
SDL3GPUGraphicsPipelineBuilder >> targetWindow: aWindow [

	targetWindow := aWindow.
	targetFormat := device getGPUSwapchainTextureFormatIntoWindow: aWindow
]

{ #category : 'building' }
SDL3GPUGraphicsPipelineBuilder >> unownedNewPipeline [

	self validate.
	^ DiScope during: [ self basicUnownedNewPipeline ]
]

{ #category : 'validating' }
SDL3GPUGraphicsPipelineBuilder >> validate [

	self validateVertexAttributesAgainstMetadata.
	self validateMetadataSpaces
]

{ #category : 'validating' }
SDL3GPUGraphicsPipelineBuilder >> validateMetadataSpaces [

	vertexShader metadata validateGroundTruth.
	fragmentShader metadata validateGroundTruth
]

{ #category : 'validating' }
SDL3GPUGraphicsPipelineBuilder >> validateVertexAttributesAgainstMetadata [

	vertexShader metadata inputAttributes do: [ :expected |
		(vertexAttributes anySatisfy: [ :actual |
			actual location = expected location ]) ifFalse: [

			SDL3GPUShaderLayoutMismatch signal:
				('Vertex shader expects attribute "{1}" at location {2}, but no matching attribute was configured in the pipeline builder.'
					format: {
						expected name.
						expected location }) ] ]
]

{ #category : 'accessing' }
SDL3GPUGraphicsPipelineBuilder >> vertexShader: aVertexShaderSource [

	vertexShader := aVertexShaderSource
]
