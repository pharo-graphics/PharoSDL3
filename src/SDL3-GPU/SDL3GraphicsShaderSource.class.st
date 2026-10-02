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
	#category : 'SDL3-GPU-ShaderSources',
	#package : 'SDL3-GPU',
	#tag : 'ShaderSources'
}

{ #category : 'testing' }
SDL3GraphicsShaderSource class >> isAbstract [

	^ self == SDL3GraphicsShaderSource
]

{ #category : 'accessing' }
SDL3GraphicsShaderSource class >> shaderStage [

	^ self subclassResponsibility
]

{ #category : 'building' }
SDL3GraphicsShaderSource class >> unownedNewShaderForDevice: aSDL3GPUDevice [
	"Answer a new shader matching the formats supported by the given GPU device."

	^ self
		unownedNewShaderForDevice: aSDL3GPUDevice
		formatFlags: aSDL3GPUDevice gpuShaderFormatFlags
]

{ #category : 'building' }
SDL3GraphicsShaderSource class >> unownedNewShaderForDevice: aSDL3GPUDevice formatFlags: formatFlags [
	"Answer a new shader given the available format flags."

	self
		withNew: SDL3GPUShaderCreateInfo
		formatFlags: formatFlags
		do: [ :createInfo |
			| shader m |
			m := self metadata.
			createInfo 
				stage: self shaderStage;
				numStorageBuffers: m storageBuffers size;
				numStorageTextures: m storageTextures size.

			shader := (aSDL3GPUDevice ffiLibrary
				createGPUShaderDevice: aSDL3GPUDevice
				createinfo: createInfo)
					assertNotNullReturn;
					device: aSDL3GPUDevice;
					yourself.
			shader metadata: m.
			^ shader ]
]
