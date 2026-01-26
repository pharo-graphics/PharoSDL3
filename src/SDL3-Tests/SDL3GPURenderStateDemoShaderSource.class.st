Class {
	#name : 'SDL3GPURenderStateDemoShaderSource',
	#superclass : 'SDL3ShaderSource',
	#category : 'SDL3-Tests-Shaders',
	#package : 'SDL3-Tests',
	#tag : 'Shaders'
}

{ #category : 'instance creation' }
SDL3GPURenderStateDemoShaderSource class >> newShaderAmong: supportedShaderFormats device: aSDL3GPUDevice [

	| createInfo |
	createInfo :=
		SDL3GPUShaderCreateInfo new
			stage: SDL3GPUShaderStage fragment;
			numSamplers: self numberOfSamplers;
			numUniformBuffers: self numberOfUniformBuffers;
			yourself.

	"TODO: Either write a builder that stores the selector or fill create info in a double-dispatch"
	(supportedShaderFormats includes: SDL3GPUShaderFormat dxil) ifTrue: [
		createInfo
			format: SDL3GPUShaderFormat dxil asInteger;
			base64Source: self sourceCompiledAsDXIL ].
	(supportedShaderFormats includes: SDL3GPUShaderFormat msl) ifTrue: [
		createInfo
			format: SDL3GPUShaderFormat msl asInteger;
			base64Source: self sourceCompiledAsMSL ].
	(supportedShaderFormats includes: SDL3GPUShaderFormat spirv) ifTrue: [
		createInfo
			format: SDL3GPUShaderFormat spirv asInteger;
			base64Source: self sourceCompiledAsSPV ].
	createInfo format = 0 ifTrue: [ NotFound signal ].

	^ aSDL3GPUDevice newGPUShaderCreateinfo: createInfo
]

{ #category : 'accessing' }
SDL3GPURenderStateDemoShaderSource class >> numberOfSamplers [

	^ 1
]

{ #category : 'accessing' }
SDL3GPURenderStateDemoShaderSource class >> numberOfUniformBuffers [

	^ 1
]
