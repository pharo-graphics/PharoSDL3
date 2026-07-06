"
Represents source code for fragment (pixel) shaders.

Responsibilities:
- Maintain fragment shader HLSL source code
- Report fragment input variables
- Report fragment output formats (color attachments)
- Create SDL_GPUShader objects for fragment stage

Example: applies textures, lighting, effects
"
Class {
	#name : 'SDL3FragmentShaderSource',
	#superclass : 'SDL3GraphicsShaderSource',
	#category : 'SDL3-GPU-ShaderSources',
	#package : 'SDL3-GPU',
	#tag : 'ShaderSources'
}

{ #category : 'testing' }
SDL3FragmentShaderSource class >> isAbstract [

	^ self == SDL3FragmentShaderSource
]

{ #category : 'accessing' }
SDL3FragmentShaderSource class >> metadata [

	^ SDL3GPUFragmentShaderMetadata new
]

{ #category : 'accessing' }
SDL3FragmentShaderSource class >> shaderStage [

	^ SDL3GPUShaderStage fragment
]

{ #category : 'accessing' }
SDL3FragmentShaderSource class >> stageFileExtension [

	^ 'frag'
]
