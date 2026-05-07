Class {
	#name : 'SDL3GraphicsShaderSource',
	#superclass : 'SDL3ShaderSource',
	#category : 'SDL3-Own',
	#package : 'SDL3-Own'
}

{ #category : 'testing' }
SDL3GraphicsShaderSource class >> isAbstract [

	^ self == SDL3GraphicsShaderSource
]

{ #category : 'instance creation' }
SDL3GraphicsShaderSource class >> newShaderAmong: supportedShaderFormats device: aSDL3GPUDevice [

	| createInfo |
	createInfo :=
		SDL3GPUShaderCreateInfo new
			numSamplers: self numberOfSamplers;
			numUniformBuffers: self numberOfUniformBuffers;
			stage: self shaderStage;
			yourself.

	"TODO: Either write a builder that stores the selector or fill create info in a double-dispatch"

	(supportedShaderFormats includes: SDL_GPU_SHADERFORMAT_DXIL) ifTrue: [
		createInfo
			format: SDL_GPU_SHADERFORMAT_DXIL asInteger;
			base64Source: self sourceCompiledAsDXIL ].

	(supportedShaderFormats includes: SDL_GPU_SHADERFORMAT_MSL) ifTrue: [
		createInfo
			format: SDL_GPU_SHADERFORMAT_MSL asInteger;
			base64Source: self sourceCompiledAsMSL ].

	(supportedShaderFormats includes: SDL_GPU_SHADERFORMAT_SPIRV) ifTrue: [
		createInfo
			format: SDL_GPU_SHADERFORMAT_SPIRV asInteger;
			base64Source: self sourceCompiledAsSPV ].

	createInfo format = 0 ifTrue: [ NotFound signal ].

	^ aSDL3GPUDevice newGPUShaderCreateinfo: createInfo
]

{ #category : 'accessing' }
SDL3GraphicsShaderSource class >> shaderStage [

	^ SDL3GPUShaderStage fragment
]

{ #category : 'code generation' }
SDL3GraphicsShaderSource class >> stageFileExtension [

	self shaderStage = SDL3GPUShaderStage vertex ifTrue: [ ^ 'vert' ].
	self shaderStage = SDL3GPUShaderStage fragment ifTrue: [ ^ 'frag' ].
	self error
]
