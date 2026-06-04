"
Abstract superclass for shaders that participate in the graphics rendering pipeline.

Provides shared protocol for graphics-specific concerns:
- Input/output variable metadata (vertex attributes, varying data)
- Graphics resource bindings (samplers, uniform buffers)
- Creation of graphics pipeline components

Subclasses represent specific stages of the graphics pipeline.
"
Class {
	#name : 'SDL3GraphicsShaderSource',
	#superclass : 'SDL3ShaderSource',
	#category : 'SDL3-Own-Shaders',
	#package : 'SDL3-Own',
	#tag : 'Shaders'
}

{ #category : 'testing' }
SDL3GraphicsShaderSource class >> isAbstract [

	^ self == SDL3GraphicsShaderSource
]

{ #category : 'building' }
SDL3GraphicsShaderSource class >> newShaderAmong: supportedShaderFormats device: aSDL3GPUDevice [
	"Create a new shader given the available formats."

	self
		withNew: SDL3GPUShaderCreateInfo
		formats: supportedShaderFormats
		do: [ :createInfo |
			| shader |
			createInfo 
				stage: self shaderStage;
				numStorageBuffers: self numberOfReadOnlyStorageBuffers + self numberOfReadWriteStorageBuffers;
				numStorageTextures: self numberOfReadOnlyStorageTextures + self numberOfReadWriteStorageTextures.

			shader := aSDL3GPUDevice newGPUShaderCreateinfo: createInfo.
			^ shader ]
]

{ #category : 'accessing' }
SDL3GraphicsShaderSource class >> shaderStage [

	^ self subclassResponsibility
]
