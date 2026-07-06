"
I represent an abtract fragment shader used for demonstration.

My concrete subclasses define in class-side shaders in HLSL format, and embed the binaries that resulted from their compilation.

See my superclass about compilation and embedding binaries.
"
Class {
	#name : 'SDL3GPURenderStateDemoShaderSource',
	#superclass : 'SDL3FragmentShaderSource',
	#category : 'SDL3-GPUDemos-RenderState',
	#package : 'SDL3-GPUDemos',
	#tag : 'RenderState'
}

{ #category : 'testing' }
SDL3GPURenderStateDemoShaderSource class >> isAbstract [

	^ self == SDL3GPURenderStateDemoShaderSource
]

{ #category : 'accessing' }
SDL3GPURenderStateDemoShaderSource class >> metadata [
	^ (SDL3GPUFragmentShaderMetadata new
		   samplers: (OrderedCollection new
				    add: (SDL3GPUSamplerBinding index: 0 space: 2);
				    yourself);
		   uniformBuffers: (OrderedCollection new
				    add: (SDL3GPUUniformBinding index: 0 space: 3);
				    yourself);
		   yourself)
]
