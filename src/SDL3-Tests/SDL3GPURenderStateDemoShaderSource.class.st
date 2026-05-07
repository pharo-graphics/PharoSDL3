"
I represent an abtract fragment shader used for demonstration.

My concrete subclasses define in class-side shaders in HLSL format, and embed the binaries that resulted from their compilation.

See my superclass about compilation and embedding binaries.
"
Class {
	#name : 'SDL3GPURenderStateDemoShaderSource',
	#superclass : 'SDL3FragmentShaderSource',
	#category : 'SDL3-Tests-Shaders',
	#package : 'SDL3-Tests',
	#tag : 'Shaders'
}

{ #category : 'testing' }
SDL3GPURenderStateDemoShaderSource class >> isAbstract [

	^ self == SDL3GPURenderStateDemoShaderSource
]

{ #category : 'accessing' }
SDL3GPURenderStateDemoShaderSource class >> numberOfUniformBuffers [

	^ 1
]
