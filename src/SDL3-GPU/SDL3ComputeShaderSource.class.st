"
Represents source code for compute shaders.

Responsibilities:
- Maintain compute shader HLSL source code
- Report threadgroup dimensions (X, Y, Z)
- Report storage resources (read/write buffers and textures)
- Create SDL_GPUComputePipeline objects
- Query metadata via reflection

Compute shaders operate outside the graphics pipeline for 
general-purpose GPU computation (physics, post-processing, etc.)
"
Class {
	#name : 'SDL3ComputeShaderSource',
	#superclass : 'SDL3ShaderSource',
	#category : 'SDL3-GPU-ShaderSources',
	#package : 'SDL3-GPU',
	#tag : 'ShaderSources'
}

{ #category : 'testing' }
SDL3ComputeShaderSource class >> isAbstract [

	^ self == SDL3ComputeShaderSource
]

{ #category : 'accessing' }
SDL3ComputeShaderSource class >> metadata [
	| m |
	m := SDL3GPUComputeShaderMetadata new.
	m threadCountX: 1.
	m threadCountY: 1.
	m threadCountZ: 1.
	^ m
]

{ #category : 'building' }
SDL3ComputeShaderSource class >> newComputePipelineAmong: supportedShaderFormats device: aSDL3GPUDevice [
	"Create a new compute pipeline given the available formats."

	self
		withNew: SDL3GPUComputePipelineCreateInfo
		formats: supportedShaderFormats
		do: [ :createInfo |
			| computePipeline m |
			m := self metadata.
			createInfo
				metadata: m;
				numReadonlyStorageTextures: m numberOfReadOnlyStorageTextures;
				numReadonlyStorageBuffers: m numberOfReadOnlyStorageBuffers;
				numReadwriteStorageTextures: m numberOfReadWriteStorageTextures;
				numReadwriteStorageBuffers: m numberOfReadWriteStorageBuffers;
				threadcountX: m threadCountX;
				threadcountY: m threadCountY;
				threadcountZ: m threadCountZ.

			computePipeline := (aSDL3GPUDevice ffiLibrary
				newGPUComputePipelineDevice: aSDL3GPUDevice
				createinfo: createInfo)
					assertNotNullReturn;
					device: aSDL3GPUDevice;
					yourself.
			computePipeline metadata: m.
			^ computePipeline ]
]

{ #category : 'accessing' }
SDL3ComputeShaderSource class >> stageFileExtension [

	^ 'comp'
]
