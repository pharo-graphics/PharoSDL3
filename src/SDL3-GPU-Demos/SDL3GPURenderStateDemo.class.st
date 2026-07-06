"
I'm a demo of SDL3 GPU renderer API introduced in SDL 3.4.0, that applies a fragment shader post-processing effect on a Pharo Morphic World screenshot, and paints a Pharo logo on top of it, to constrast and emulate a dialog box somehow.
"
Class {
	#name : 'SDL3GPURenderStateDemo',
	#superclass : 'SDL3ConsoleDemoApp',
	#instVars : [
		'backgroundTexture',
		'foregroundTexture',
		'backgroundForm',
		'shaders',
		'renderStates',
		'renderStateIndex',
		'uniformBuffer',
		'shaderSources',
		'gpuDevice'
	],
	#category : 'SDL3-GPU-Demos-RenderState',
	#package : 'SDL3-GPU-Demos',
	#tag : 'RenderState'
}

{ #category : 'lifecycle' }
SDL3GPURenderStateDemo >> close [

	renderStates do: [ :each | each destroy ].
	shaders do: [ :each | each release ].

	foregroundTexture destroy.
	backgroundTexture destroy.

	super close
]

{ #category : 'initialization' }
SDL3GPURenderStateDemo >> initialize [

	super initialize.

	shaders := OrderedCollection new.
	renderStates := OrderedCollection new.

	"shaderSources := SDL3GPURenderStateDemoShaderSource allSubclasses."
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

	renderStateIndex := 1
]

{ #category : 'initialization' }
SDL3GPURenderStateDemo >> initializeGPURenderStates [

	| supportedShaderFormats |
	supportedShaderFormats := gpuDevice gpuShaderFormatsAsArray.

	shaderSources do: [ :eachSources |
		| aShader aRenderState |
		aShader := eachSources newShaderAmong: supportedShaderFormats device: gpuDevice.

		aRenderState := renderer newRenderState: [ :info |
			info fragmentShader: aShader ].

		shaders add: aShader. "Keep a reference to destroy on close"
		renderStates add: aRenderState "These will be switched with arrow keys" ].

	"We'll update these input before each render to produce an animation"
	uniformBuffer := SDL3GPURenderStateDemoUniformBuffer new
]

{ #category : 'lifecycle' }
SDL3GPURenderStateDemo >> initializeRenderer [

	renderer := window newGPURenderer
]

{ #category : 'initialization' }
SDL3GPURenderStateDemo >> initializeTextures [

	| browserMorph |
	foregroundTexture := renderer newTextureFromForm: (self iconNamed: #pharoBig).

	"Take a snapshot of a browser to be used as background"
	browserMorph :=(Object >> #at:put:) browse owner.
	backgroundForm := browserMorph extent: window extent; asForm.
	browserMorph delete.
	backgroundTexture := renderer newTextureFromForm: backgroundForm
]

{ #category : 'lifecycle' }
SDL3GPURenderStateDemo >> open [

	window :=
		sdl
			newWindowTitle: self updatedTitle
			w: self initialExtent x
			h: self initialExtent y
			flags: self initialWindowFlags.

	renderer := window newGPURenderer.

	window startTextInput.

	gpuDevice := renderer gpuDevice.

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
		dstrect: (SDL_FRect origin: 0@0 extent: backgroundTexture extent).

	"We're done with that shader"
	renderer gpuRenderStateClear.

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

{ #category : 'hooks' }
SDL3GPURenderStateDemo >> step [

	self render
]

{ #category : 'initialization' }
SDL3GPURenderStateDemo >> updateRenderState: renderState [
	"Set updated parameters to shader"

	"See the class-comment of `SDL3GPURenderStateDemoUniformBuffer`"
	uniformBuffer
		time: Time millisecondClockValue / 1000.0;
		resolutionX: backgroundTexture w;
		resolutionY: backgroundTexture h.

	renderState
		pushFragmentUniform: uniformBuffer
		slot: 0.

	renderer gpuRenderState: renderState
]

{ #category : 'accessing' }
SDL3GPURenderStateDemo >> updatedTitle [

	^ super updatedTitle,
		' - Shader: ',
		(shaderSources at: renderStateIndex) name,
		' (LEFT/RIGHT to change)'
]

{ #category : 'hooks' }
SDL3GPURenderStateDemo >> visitKeyboardDownEvent: aKeyboardDownEvent [

	super visitKeyboardDownEvent: aKeyboardDownEvent.

	aKeyboardDownEvent key = SDLK_RIGHT asInteger ifTrue: [
		renderStateIndex := renderStateIndex + 1.
		renderStateIndex > renderStates size ifTrue: [
			renderStateIndex := 1 ] ].

	aKeyboardDownEvent key = SDLK_LEFT asInteger ifTrue: [
		renderStateIndex := renderStateIndex - 1.
		renderStateIndex < 1 ifTrue: [
			renderStateIndex := renderStates size ] ].

	self updateTitle
]
