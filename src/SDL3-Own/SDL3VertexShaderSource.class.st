Class {
	#name : 'SDL3VertexShaderSource',
	#superclass : 'SDL3GraphicsShaderSource',
	#category : 'SDL3-Own-Shaders',
	#package : 'SDL3-Own',
	#tag : 'Shaders'
}

{ #category : 'testing' }
SDL3VertexShaderSource class >> isAbstract [

	^ self == SDL3VertexShaderSource
]

{ #category : 'accessing' }
SDL3VertexShaderSource class >> numberOfSamplers [

	^ 0
]

{ #category : 'instance creation' }
SDL3VertexShaderSource class >> shaderStage [

	^ SDL3GPUShaderStage vertex
]

{ #category : 'code generation' }
SDL3VertexShaderSource class >> stageFileExtension [

	^ 'vert'
]
