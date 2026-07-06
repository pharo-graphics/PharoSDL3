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
			| shader m |
			m := self metadata.
			createInfo 
				stage: self shaderStage;
				numStorageBuffers: m storageBuffers size;
				numStorageTextures: m storageTextures size.

			shader := (aSDL3GPUDevice ffiLibrary
				newGPUShaderDevice: aSDL3GPUDevice
				createinfo: createInfo)
					assertNotNullReturn;
					device: aSDL3GPUDevice;
					yourself.
			shader metadata: m.
			^ shader ]
]

{ #category : 'accessing' }
SDL3GraphicsShaderSource class >> shaderStage [

	^ self subclassResponsibility
]
