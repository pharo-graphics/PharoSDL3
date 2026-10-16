"
I test SDL3GPUGraphicsPipelineBuilder configuration, prototype copying, pre-flight validation, and pipeline creation.
"
Class {
	#name : 'SDL3GPUGraphicsPipelineBuilderTest',
	#superclass : 'TestCase',
	#category : 'SDL3-GPU-Tests-Pipeline',
	#package : 'SDL3-GPU-Tests',
	#tag : 'Pipeline'
}

{ #category : 'tests' }
SDL3GPUGraphicsPipelineBuilderTest >> testCopyPrototype [

	| baseBuilder copyBuilder |
	baseBuilder := (SDL3GPUGraphicsPipelineBuilder on: nil)
		vertexShader: SDL3GPUQuadVertexShaderSource;
		addVertexBufferFor: SDL3GPUQuadVertex;
		targetFormat: SDL3GPUTextureFormat b8g8r8a8Unorm.
	copyBuilder := baseBuilder copy
		fragmentShader: SDL3GPUQuadFragmentShaderSource.

	self shouldnt: [ copyBuilder validate ] raise: Error.
	self should: [ baseBuilder validate ] raise: MessageNotUnderstood
]

{ #category : 'tests' }
SDL3GPUGraphicsPipelineBuilderTest >> testPreflightValidationVertexMismatch [

	| builder |
	builder := (SDL3GPUGraphicsPipelineBuilder on: nil)
		vertexShader: SDL3GPUQuadVertexShaderSource;
		fragmentShader: SDL3GPUQuadFragmentShaderSource;
		targetFormat: SDL3GPUTextureFormat b8g8r8a8Unorm.
	builder addVertexAttribute:
		((SDL3GPUVertexElement location: 0 offset: 0 format: SDL3GPUVertexElementFormat float3) asVertexAttributeForSlot: 0).
	self should: [ builder validate ] raise: SDL3GPUShaderLayoutMismatch.

	builder addVertexAttribute:
		((SDL3GPUVertexElement location: 1 offset: 12 format: SDL3GPUVertexElementFormat float2) asVertexAttributeForSlot: 0).
	self shouldnt: [ builder validate ] raise: SDL3GPUShaderLayoutMismatch
]

{ #category : 'tests' }
SDL3GPUGraphicsPipelineBuilderTest >> testVertexElementOneBasedOffset [

	| element |
	element := SDL3GPUVertexElement location: 2 oneBasedOffset: 17 format: SDL3GPUVertexElementFormat float4.
	self assert: element location equals: 2.
	self assert: element offset equals: 16.
	self assert: element format equals: SDL3GPUVertexElementFormat float4
]
