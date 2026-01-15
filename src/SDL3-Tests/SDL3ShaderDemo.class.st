Class {
	#name : 'SDL3ShaderDemo',
	#superclass : 'SDL3Demo',
	#instVars : [
		'device',
		'mainLoopProcess',
		'effectEnabled',
		'backgroundTexture',
		'foregroundTexture',
		'crtEffectShader',
		'crtEffectState',
		'backgroundForm',
		'crtEffectInputUniforms'
	],
	#category : 'SDL3-Tests-Shaders',
	#package : 'SDL3-Tests',
	#tag : 'Shaders'
}

{ #category : 'lifecycle' }
SDL3ShaderDemo >> close [

	crtEffectState destroy.
	device releaseGPUShader: crtEffectShader.

	foregroundTexture destroy.
	backgroundTexture destroy.

	super close.
	
	UIManager default class = NonInteractiveUIManager ifTrue: [ 
		self ensureQuitVideo.
		Smalltalk snapshot: false andQuit: true ].
	
	(mainLoopProcess isNotNil and: [ mainLoopProcess isTerminated not ])
		ifTrue: [ mainLoopProcess terminate ]
]

{ #category : 'initialization' }
SDL3ShaderDemo >> initialize [

	super initialize.
	
	"We take a snapshot of the current world to use a background"
	backgroundForm := self currentWorld asForm
]

{ #category : 'initialization' }
SDL3ShaderDemo >> initializeCRTEffectAmong: supportedShaderFormats [

	| shaderSource |
	shaderSource := SDL3CRTEffectShaderSource newAmong: supportedShaderFormats.

	crtEffectShader := device newGPUShaderCreateinfo: shaderSource newShaderCreateInfo.
	lib assertSuccess: crtEffectShader.

	"We'll update these input before each render to produce an animation"
	crtEffectInputUniforms := shaderSource newInputUniforms
]

{ #category : 'initialization' }
SDL3ShaderDemo >> initializeGPURenderStates [

	| supportedShaderFormats renderStateInfo |
	supportedShaderFormats := device gpuShaderFormatsAsArray.

	self initializeCRTEffectAmong: supportedShaderFormats.

	renderStateInfo := SDL3GPURenderStateCreateInfo new.
	renderStateInfo fragmentShader: crtEffectShader.
	crtEffectState := renderer newGPURenderStateCreateinfo: renderStateInfo.
	lib assertSuccess: crtEffectState
]

{ #category : 'initialization' }
SDL3ShaderDemo >> initializeTextures [

	| aForm surface |
	aForm := self iconNamed: #pharoBig.
	surface := aForm asUnownedNewSDL3Surface.
	foregroundTexture := renderer newTextureFromSurface: surface.
	lib assertSuccess: foregroundTexture.
	surface destroy.

	surface := backgroundForm asUnownedNewSDL3Surface.
	backgroundTexture := renderer newTextureFromSurface: surface.
	lib assertSuccess: backgroundTexture.
	surface destroy
]

{ #category : 'lifecycle' }
SDL3ShaderDemo >> open [

	self ensureInitVideo.

	window :=
		lib
			newWindowTitle: self className, ' - Press SPACE to disable/enable shader - Press ESC to quit'
			w: backgroundForm width
			h: backgroundForm height
			flags: 0.
	lib assertSuccess: window.

	renderer := window newGPURenderer.
	lib assertSuccess: window.
	
	device := renderer gpuDevice.
	lib assertSuccess: device.

	self
		initializeTextures;
		initializeGPURenderStates
]

{ #category : 'lifecycle' }
SDL3ShaderDemo >> render [

	self clearColor: Color blue.

	effectEnabled ifTrue: [
		| extraHeightNow |
		extraHeightNow := (Time millisecondClockValue / 200) \\ 20.
		self
			updateCrtEffectWidth: foregroundTexture w
			height: (foregroundTexture h / 4) + extraHeightNow.

		renderer gpuRenderState: crtEffectState ].

	renderer
		 renderTexture: backgroundTexture
		 srcrect: nil
		 dstrect: (SDL3FRect origin: 0@0 extent: backgroundTexture extent).

	renderer gpuRenderStateClear.

	renderer
		 renderTexture: foregroundTexture
		 srcrect: nil
		 dstrect:
			(SDL3FRect
				origin: (backgroundTexture extent - foregroundTexture extent / 2)
				extent: foregroundTexture extent).
	
	self present
]

{ #category : 'running' }
SDL3ShaderDemo >> run [
	"Run headless with:
	./pharo Pharo.image eval --no-quit 'SDL3ShaderDemo new run' "
	<script: 'self new run'>

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
			16.6 milliSeconds wait ].
	
		"Tear down"
		self close.

		] fork
]

{ #category : 'initialization' }
SDL3ShaderDemo >> updateCrtEffectWidth: effectWidth height: effectHeight [
	"Set the CRT shader parameters"

	crtEffectInputUniforms
		resolutionX: effectWidth;
		resolutionY: effectHeight.

	lib assertSuccess:
		(crtEffectState
			 gpuRenderFragmentUniformsSlotIndex: 0
			 data: crtEffectInputUniforms
			 length: crtEffectInputUniforms byteSize)
]
