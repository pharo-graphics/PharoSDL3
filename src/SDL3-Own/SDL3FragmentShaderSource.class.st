Class {
	#name : 'SDL3FragmentShaderSource',
	#superclass : 'SDL3GraphicsShaderSource',
	#category : 'SDL3-Own-Shaders',
	#package : 'SDL3-Own',
	#tag : 'Shaders'
}

{ #category : 'testing' }
SDL3FragmentShaderSource class >> isAbstract [

	^ self == SDL3FragmentShaderSource
]

{ #category : 'accessing' }
SDL3FragmentShaderSource class >> numberOfSamplers [

	^ 1
]

{ #category : 'code generation' }
SDL3FragmentShaderSource class >> stageFileExtension [

	^ 'frag'
]
