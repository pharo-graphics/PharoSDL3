Class {
	#name : 'SDL3ShaderDemo',
	#superclass : 'SDL3Demo',
	#instVars : [
		'device',
		'pharoLogoTexture',
		'crtEffect',
		'mainLoopProcess',
		'pharoLogoTexture2',
		'effectEnabled'
	],
	#category : 'SDL3-Tests-Shaders',
	#package : 'SDL3-Tests',
	#tag : 'Shaders'
}

{ #category : 'lifecycle' }
SDL3ShaderDemo >> close [

	crtEffect state destroy.
	device releaseGPUShader: crtEffect shader.

	pharoLogoTexture destroy.
	pharoLogoTexture2 destroy.

	super close.
	
	UIManager default class = NonInteractiveUIManager ifTrue: [ 
		self ensureQuitVideo.
		Smalltalk snapshot: false andQuit: true ].
	
	(mainLoopProcess isNotNil and: [ mainLoopProcess isTerminated not ])
		ifTrue: [ mainLoopProcess terminate ]
]

{ #category : 'initialization' }
SDL3ShaderDemo >> initializeCRTEffect [

	| availableShaderFormats shaderInfo shaderSource renderStateInfo uniforms  |

	availableShaderFormats := device gpuShaderFormatsAsArray.

	crtEffect := SDL3ShaderDemoEffect crt.

	shaderInfo := SDL3GPUShaderCreateInfo new.
	shaderInfo
		stage: SDL3GPUShaderStage fragment;
		numSamplers: crtEffect numberOfSamplers;
		numUniformBuffers: crtEffect numberOfUniformBuffers.
	shaderSource := crtEffect shaderSources
		detect: [ :each | availableShaderFormats includes: each format ].

	shaderInfo
		code: shaderSource source;
		codeSize: shaderSource source size;
		format: shaderSource format asInteger.
	crtEffect shader: (device newGPUShaderCreateinfo: shaderInfo).
	self ensureNoErrorIfNull: crtEffect shader.

	renderStateInfo := SDL3GPURenderStateCreateInfo new.
	renderStateInfo fragmentShader: crtEffect shader.
	crtEffect state: (renderer newGPURenderStateCreateinfo: renderStateInfo).
	self ensureNoErrorIfNull: crtEffect state.

	"Set the CRT shader parameters"
	uniforms := FFIExternalArray newType: 'float' size: 2.
	uniforms
		at: 1 put: pharoLogoTexture w;
		at: 2 put: pharoLogoTexture h.
	self ensureNoErrorIfFalse:
		(crtEffect state
			 gpuRenderFragmentUniformsSlotIndex: 0
			 data: uniforms
			 length: uniforms typeSize * uniforms size)
]

{ #category : 'initialization' }
SDL3ShaderDemo >> initializeTextures [

	| shapeForm surface |
	shapeForm := self iconNamed: #pharoBig.
	surface := shapeForm asUnownedNewSDL3Surface.
	pharoLogoTexture := renderer newTextureFromSurface: surface.
	pharoLogoTexture2 := renderer newTextureFromSurface: surface.
	surface destroy
]

{ #category : 'lifecycle' }
SDL3ShaderDemo >> open [

	self ensureInitVideo.

	window :=
		lib
			newWindowTitle: self className, ' - Press SPACE to disable/enable shader - Press ESC to quit'
			w: self initialExtent x
			h: self initialExtent y
			flags: 0.
	self ensureNoErrorIfNull: window.

	renderer := window newGPURenderer.
	self ensureNoErrorIfNull: window.
	
	device := renderer gpuDevice.
	self ensureNoErrorIfNull: device.

	self
		initializeTextures;
		initializeCRTEffect
]

{ #category : 'running' }
SDL3ShaderDemo >> render [

	self clearColor: Color blue.

	effectEnabled ifTrue: [
		renderer gpuRenderState: crtEffect state ].

	renderer
		 renderTexture: pharoLogoTexture2
		 srcrect: nil
		 dstrect: (SDL3FRect origin: 0@0 extent: pharoLogoTexture2 extent * 3).

	renderer gpuRenderStateClear.

	renderer
		 renderTexture: pharoLogoTexture
		 srcrect: nil
		 dstrect: (SDL3FRect origin: pharoLogoTexture extent x * 1.5 @ 0 extent: pharoLogoTexture extent * 3).
	
	self present.
	
"	self ensureNoError"
]

{ #category : 'running' }
SDL3ShaderDemo >> run [
	"Run headless with:
	./pharo Pharo.image eval --no-quit 'SDL3ShaderDemo new run' "
	<script: 'self new run inspect'>

	self open.
	effectEnabled := true.

	mainLoopProcess :=
		[	| quit |
		quit := false.

		"main loop"
		[ quit ] whileFalse: [

			"Process all pending events"
			self pollEventsDo: [ :evt |
				evt type = SDL3EventType quit ifTrue: [ quit := true ].

				evt type = SDL3EventType keyDown ifTrue: [
					evt key = SDL3Keycode escape asInteger ifTrue: [ quit := true ].
					evt key = SDL3Keycode space asInteger ifTrue: [ effectEnabled := effectEnabled not ] ]
					].

			self render.
			
			"Do a little wait before next frame"
			15 milliSeconds wait ].
	
		"Tear down"
		self close.

		] fork
]
