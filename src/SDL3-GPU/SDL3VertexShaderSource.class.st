"
Represents source code for vertex shaders.

Responsibilities:
- Maintain vertex shader HLSL source code
- Report vertex input attributes (positions, UVs, normals, etc.)
- Report vertex outputs (interpolated data for fragments)
- Create SDL_GPUShader objects for vertex stage

Example: transforms vertex positions, applies skinning
"
Class {
	#name : 'SDL3VertexShaderSource',
	#superclass : 'SDL3GraphicsShaderSource',
	#category : 'SDL3-GPU-ShaderSources',
	#package : 'SDL3-GPU',
	#tag : 'ShaderSources'
}

{ #category : 'testing' }
SDL3VertexShaderSource class >> isAbstract [

	^ self == SDL3VertexShaderSource
]

{ #category : 'accessing' }
SDL3VertexShaderSource class >> metadata [

	^ SDL3GPUVertexShaderMetadata new
]

{ #category : 'accessing' }
SDL3VertexShaderSource class >> shaderStage [

	^ SDL3GPUShaderStage vertex
]

{ #category : 'accessing' }
SDL3VertexShaderSource class >> stageFileExtension [

	^ 'vert'
]
