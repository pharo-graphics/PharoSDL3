Class {
	#name : 'SDL3ShaderDemo',
	#superclass : 'SDL3Demo',
	#instVars : [
		'device',
		'crtEffect',
		'mainLoopProcess',
		'effectEnabled',
		'backgroundTexture',
		'foregroundTexture'
	],
	#category : 'SDL3-Tests-Shaders',
	#package : 'SDL3-Tests',
	#tag : 'Shaders'
}

{ #category : 'lifecycle' }
SDL3ShaderDemo >> close [

	crtEffect state destroy.
	device releaseGPUShader: crtEffect shader.

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
SDL3ShaderDemo >> initializeCRTEffect [

	| availableShaderFormats shaderInfo shaderSource renderStateInfo |

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

	self updateCrtEffectWidth: foregroundTexture w height: foregroundTexture h
]

{ #category : 'initialization' }
SDL3ShaderDemo >> initializeTextures [

	| aForm surface |
	aForm := self iconNamed: #pharoBig.
	surface := aForm asUnownedNewSDL3Surface.
	foregroundTexture := renderer newTextureFromSurface: surface.
	surface destroy.

	aForm := World asForm.
	surface := aForm asUnownedNewSDL3Surface.
	backgroundTexture := renderer newTextureFromSurface: surface.
	surface destroy.

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
		
		self
			updateCrtEffectWidth: foregroundTexture w
			height: (foregroundTexture h / 5) + ((Time millisecondClockValue / 300) \\ 10).

		renderer gpuRenderState: crtEffect state ].

	renderer
		 renderTexture: backgroundTexture
		 srcrect: nil
		 dstrect: (SDL3FRect origin: 0@0 extent: backgroundTexture extent).

	renderer gpuRenderStateClear.

	renderer
		 renderTexture: foregroundTexture
		 srcrect: nil
		 dstrect: (SDL3FRect newFrom: ((0@0 extent: self initialExtent) insetBy: 200)).
	
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
			16.6 milliSeconds wait ].
	
		"Tear down"
		self close.

		] fork
]

{ #category : 'initialization' }
SDL3ShaderDemo >> updateCrtEffectWidth: effectWidth height: effectHeight [
	"Set the CRT shader parameters"

	| uniforms |
	uniforms := FFIExternalArray newType: 'float' size: 2.
	uniforms
		at: 1 put: effectWidth;
		at: 2 put: effectHeight.
	self ensureNoErrorIfFalse:
		(crtEffect state
			 gpuRenderFragmentUniformsSlotIndex: 0
			 data: uniforms
			 length: uniforms typeSize * uniforms size)
]
