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
	#category : 'SDL3-Own-Shaders',
	#package : 'SDL3-Own',
	#tag : 'Shaders'
}

{ #category : 'testing' }
SDL3ComputeShaderSource class >> isAbstract [

	^ self == SDL3ComputeShaderSource
]

{ #category : 'building' }
SDL3ComputeShaderSource class >> newComputePipelineAmong: supportedShaderFormats device: aSDL3GPUDevice [
	"Create a new compute pipeline given the available formats."

	self
		withNew: SDL3GPUComputePipelineCreateInfo
		formats: supportedShaderFormats
		do: [ :createInfo |
			| computePipeline |
			createInfo
				numReadonlyStorageTextures: self numberOfReadOnlyStorageTextures;
				numReadonlyStorageBuffers: self numberOfReadOnlyStorageBuffers;
				numReadwriteStorageTextures: self numberOfReadWriteStorageTextures;
				numReadwriteStorageBuffers: self numberOfReadWriteStorageBuffers;
				threadcountX: self threadCountX;
				threadcountY: self threadCountY;
				threadcountZ: self threadCountZ.

			computePipeline := aSDL3GPUDevice newGPUComputePipelineCreateinfo: createInfo.
			computePipeline assertNotNullReturn.
			^ computePipeline ]
]

{ #category : 'accessing' }
SDL3ComputeShaderSource class >> numberOfReadOnlyStorageBuffers [

	^ 0
]

{ #category : 'accessing' }
SDL3ComputeShaderSource class >> numberOfReadOnlyStorageTextures [

	^ 0
]

{ #category : 'accessing' }
SDL3ComputeShaderSource class >> numberOfReadWriteStorageBuffers [

	^ 0
]

{ #category : 'accessing' }
SDL3ComputeShaderSource class >> numberOfReadWriteStorageTextures [

	^ 0
]

{ #category : 'accessing' }
SDL3ComputeShaderSource class >> numberOfSamplers [

	^ 0
]

{ #category : 'accessing' }
SDL3ComputeShaderSource class >> stageFileExtension [

	^ 'comp'
]

{ #category : 'accessing' }
SDL3ComputeShaderSource class >> threadCountX [

	^ 1
]

{ #category : 'accessing' }
SDL3ComputeShaderSource class >> threadCountY [

	^ 1
]

{ #category : 'accessing' }
SDL3ComputeShaderSource class >> threadCountZ [

	^ 1
]
