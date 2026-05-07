Class {
	#name : 'SDL3ComputeShaderSource',
	#superclass : 'SDL3ShaderSource',
	#category : 'SDL3-Own',
	#package : 'SDL3-Own'
}

{ #category : 'testing' }
SDL3ComputeShaderSource class >> isAbstract [

	^ self == SDL3ComputeShaderSource
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

{ #category : 'code generation' }
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
