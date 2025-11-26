Class {
	#name : 'SDL3ShaderDemo',
	#superclass : 'SDL3Demo',
	#instVars : [
		'device',
		'targetTexture'
	],
	#category : 'SDL3-Tests-Shaders',
	#package : 'SDL3-Tests',
	#tag : 'Shaders'
}

{ #category : 'initialization' }
SDL3ShaderDemo >> initializeGPURenderState [

	| formatsBitFlags shaderInfo renderStateInfo effect uniforms detectedShaderSource |
	targetTexture :=
		renderer
			newTextureFormat: SDL3PixelFormat argb8888
			access: SDL3TextureAccess target
			w: self initialExtent x
			h: self initialExtent y.


	device := renderer gpuDevice.
	self ensureNoErrorIfNull: device.

	formatsBitFlags := device gpuShaderFormats.
	self assert: (formatsBitFlags ~= SDL3GPUShaderFormat invalid asInteger).

"	SDL3GPUShaderFormat allValues select: [ :each | formatsBitFlags & each value > 0 ]."

	effect := SDL3ShaderDemoEffect crt.

	shaderInfo := SDL3GPUShaderCreateInfo new.
	shaderInfo
		stage: SDL3GPUShaderStage fragment;
		numSamplers: effect numberOfSamplers;
		numUniformBuffers: effect numberOfUniformBuffers.
	"ToDo: Generalize for other formats"
	self assert: formatsBitFlags & SDL3GPUShaderFormat msl asInteger > 0.
	detectedShaderSource := effect shaderSources first.
	shaderInfo
		code: detectedShaderSource source;
		codeSize: detectedShaderSource source size;
		format: detectedShaderSource format asInteger.
	effect shader: (device newGPUShaderCreateinfo: shaderInfo).
	self ensureNoErrorIfNull: effect shader.

	renderStateInfo := SDL3GPURenderStateCreateInfo new.
	renderStateInfo fragmentShader: effect shader.
	effect state: (renderer newGPURenderStateCreateinfo: renderStateInfo).
	self ensureNoErrorIfNull: effect state.

	"Set the CRT shader parameters"
	uniforms := FFIExternalArray newType: 'float' size: 2.
	uniforms
		at: 1 put: self initialExtent x;
		at: 2 put: self initialExtent y.
	self ensureNoErrorIfFalse:
		(effect state
			 gpuRenderFragmentUniformsSlotIndex: 0
			 data: uniforms
			 length: uniforms typeSize * uniforms size)
]

{ #category : 'lifecycle' }
SDL3ShaderDemo >> open [
	<script: 'self new open inspect'>

	window :=
		lib
			newWindowTitle: self className
			w: self initialExtent x
			h: self initialExtent y
			flags: 0.
	self ensureNoErrorIfNull: window.

	renderer := window newGPURenderer.
	self ensureNoErrorIfNull: window.
	
	self initializeGPURenderState
]
