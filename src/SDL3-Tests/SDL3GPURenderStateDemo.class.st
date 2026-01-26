"
I'm a demo of SDL3 GPU renderer API introduced in SDL 3.4.0, that applies a fragment shader post-processing effect on a Pharo Morphic World screenshot, and paints a Pharo logo on top of it, to constrast and emulate a dialog box somehow.
"
Class {
	#name : 'SDL3GPURenderStateDemo',
	#superclass : 'SDL3Demo',
	#instVars : [
		'device',
		'mainLoopProcess',
		'backgroundTexture',
		'foregroundTexture',
		'backgroundForm',
		'shaders',
		'renderStates',
		'renderStateIndex',
		'uniformBuffer',
		'shaderSources'
	],
	#category : 'SDL3-Tests-Shaders',
	#package : 'SDL3-Tests',
	#tag : 'Shaders'
}

{ #category : 'lifecycle' }
SDL3GPURenderStateDemo >> close [

	renderStates do: [ :each | each destroy ].
	shaders do: [ :each | device releaseGPUShader: each ].

	foregroundTexture destroy.
	backgroundTexture destroy.

	super close.

	(mainLoopProcess isNotNil and: [ mainLoopProcess isTerminated not ])
		ifTrue: [ mainLoopProcess terminate ].

	self ensureQuitVideo.
	Smalltalk snapshot: false andQuit: true
]

{ #category : 'initialization' }
SDL3GPURenderStateDemo >> initialize [

	super initialize.
	
	"We take a snapshot of the current world to use a background"
	backgroundForm := self currentWorld asForm
]

{ #category : 'initialization' }
SDL3GPURenderStateDemo >> initializeGPURenderStates [

	| supportedShaderFormats |
	supportedShaderFormats := device gpuShaderFormatsAsArray.

	shaders := OrderedCollection new.
	renderStates := OrderedCollection new.
	shaderSources := {
		SDL3RainShaderSource.
		SDL3BumpedSinusoidalWrapShaderSource.
		SDL3WaterShaderSource.
		SDL3NoiseShaderSource.
		SDL3WigglesShaderSource.
		SDL3CloudsShaderSource.
		SDL3VortexShaderSource.
		SDL3CRTEffectShaderSource.
		SDL3DotsHalftoneShaderSource.
		SDL3HighlightShaderSource.
		SDL3MoireShaderSource 
		}.

	shaderSources do: [ :eachSources |
		| aShader renderStateInfo aRenderState |
		aShader := eachSources newShaderAmong: supportedShaderFormats device: device.
		lib assertSuccess: aShader.

		renderStateInfo := SDL3GPURenderStateCreateInfo new.
		renderStateInfo fragmentShader: aShader.
		aRenderState := renderer newGPURenderStateCreateinfo: renderStateInfo.
		lib assertSuccess: aRenderState.

		shaders add: aShader. "Keep a referente to destroy on close"
		renderStates add: aRenderState "These will be switched with arrow keys" ].

	renderStateIndex := 1.
	
	"We'll update these input before each render to produce an animation"
	uniformBuffer := SDL3GPURenderStateDemoUniformBuffer new
]

{ #category : 'initialization' }
SDL3GPURenderStateDemo >> initializeTextures [

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
SDL3GPURenderStateDemo >> open [

	self ensureInitVideo.

	window :=
		lib
			newWindowTitle: self className, ' - Press LEFT/RIGHT to switch current shader - Press ESC to quit'
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
SDL3GPURenderStateDemo >> render [

	"Clear window"
	self clearColor: Color blue.

	"Set the selected shader and render the background"
	self updateRenderState: (renderStates at: renderStateIndex).
	renderer
		 renderTexture: backgroundTexture
		 srcrect: nil "<-- meaning: take the full texture as source"
		 dstrect: (SDL3FRect origin: 0@0 extent: backgroundTexture extent).

	"We're done with that shader"
	renderer gpuRenderStateClear.

	"Draw the shader name"
	self
		showText: (shaderSources at: renderStateIndex) name
		x: 10 y: 20 color: self currentWorld theme caretColor.

	"Finally, render the Pharo logo"
	renderer
		 renderTexture: foregroundTexture
		 srcrect: nil
		 dstrect:
			(SDL3FRect
				origin: (backgroundTexture extent - foregroundTexture extent / 2)
				extent: foregroundTexture extent).

	"We're done with rendering this frame, so let's present it on the window"	
	self present
]

{ #category : 'running' }
SDL3GPURenderStateDemo >> run [
	"Run headless with:
	./pharo Pharo.image eval --no-quit 'SDL3GPURenderStateDemo new run' "

	self open.
	self runUntilQuit.
	self close
]

{ #category : 'running' }
SDL3GPURenderStateDemo >> runUntilQuit [

	| quit |
	quit := false.

	"main loop"
	[ quit ] whileFalse: [

		"Process all pending events"
		self pollEventsDo: [ :evt |
			evt type = SDL3EventType quit ifTrue: [ quit := true ].

			evt type = SDL3EventType keyDown ifTrue: [
				evt key = SDL3Keycode escape asInteger ifTrue: [ quit := true ].
				evt key = SDL3Keycode right asInteger ifTrue: [
					renderStateIndex := renderStateIndex + 1.
					renderStateIndex > renderStates size ifTrue: [
						renderStateIndex := 1 ] ].
				evt key = SDL3Keycode left asInteger ifTrue: [
					renderStateIndex := renderStateIndex - 1.
					renderStateIndex < 1 ifTrue: [
						renderStateIndex := renderStates size ] ]
				]
			].

		self render.
		
		"Do a little wait before next frame"
		16.6 milliSeconds wait ]
]

{ #category : 'initialization' }
SDL3GPURenderStateDemo >> updateRenderState: renderState [
	"Set updated parameters to shader"

	"See the class-comment of `SDL3GPURenderStateDemoUniformBuffer`"
	uniformBuffer
		time: Time millisecondClockValue / 1000.0;
		resolutionX: backgroundTexture w;
		resolutionY: backgroundTexture h.

	lib assertSuccess:
		(renderState
			 gpuRenderFragmentUniformsSlotIndex: 0
			 data: uniformBuffer
			 length: uniformBuffer byteSize).

	lib assertSuccess: (renderer gpuRenderState: renderState)
]
