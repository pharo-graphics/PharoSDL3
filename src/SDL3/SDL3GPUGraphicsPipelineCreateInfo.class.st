Class {
	#name : 'SDL3GPUGraphicsPipelineCreateInfo',
	#superclass : 'SDL3Structure',
	#classVars : [
		'OFFSET_DEPTH_STENCIL_STATE',
		'OFFSET_FRAGMENT_SHADER',
		'OFFSET_MULTISAMPLE_STATE',
		'OFFSET_PRIMITIVE_TYPE',
		'OFFSET_PROPS',
		'OFFSET_RASTERIZER_STATE',
		'OFFSET_TARGET_INFO',
		'OFFSET_VERTEX_INPUT_STATE',
		'OFFSET_VERTEX_SHADER'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'field definition' }
SDL3GPUGraphicsPipelineCreateInfo class >> fieldsDesc [

	^ #(
	SDL_GPUShader* vertex_shader;
	SDL_GPUShader* fragment_shader;
	SDL_GPUVertexInputState vertex_input_state;
	SDL_GPUPrimitiveType primitive_type;
	SDL_GPURasterizerState rasterizer_state;
	SDL_GPUMultisampleState multisample_state;
	SDL_GPUDepthStencilState depth_stencil_state;
	SDL_GPUGraphicsPipelineTargetInfo target_info;
	SDL_PropertiesID props
	)
]

{ #category : 'accessing - structure variables' }
SDL3GPUGraphicsPipelineCreateInfo >> depthStencilState [
	"This method was automatically generated"
	^ SDL3GPUDepthStencilState fromHandle: (handle referenceStructAt: OFFSET_DEPTH_STENCIL_STATE length: SDL3GPUDepthStencilState byteSize)
]

{ #category : 'accessing - structure variables' }
SDL3GPUGraphicsPipelineCreateInfo >> depthStencilState: anObject [
	"This method was automatically generated"
	handle structAt: OFFSET_DEPTH_STENCIL_STATE put: anObject getHandle length: SDL3GPUDepthStencilState byteSize
]

{ #category : 'accessing - structure variables' }
SDL3GPUGraphicsPipelineCreateInfo >> fragmentShader [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_FRAGMENT_SHADER) type: ExternalType void asPointerType
]

{ #category : 'accessing - structure variables' }
SDL3GPUGraphicsPipelineCreateInfo >> fragmentShader: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_FRAGMENT_SHADER put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
SDL3GPUGraphicsPipelineCreateInfo >> multisampleState [
	"This method was automatically generated"
	^ SDL3GPUMultisampleState fromHandle: (handle referenceStructAt: OFFSET_MULTISAMPLE_STATE length: SDL3GPUMultisampleState byteSize)
]

{ #category : 'accessing - structure variables' }
SDL3GPUGraphicsPipelineCreateInfo >> multisampleState: anObject [
	"This method was automatically generated"
	handle structAt: OFFSET_MULTISAMPLE_STATE put: anObject getHandle length: SDL3GPUMultisampleState byteSize
]

{ #category : 'accessing - structure variables' }
SDL3GPUGraphicsPipelineCreateInfo >> primitiveType [
	"This method was automatically generated"
	^SDL3GPUPrimitiveType fromInteger: (handle unsignedLongAt: OFFSET_PRIMITIVE_TYPE)
]

{ #category : 'accessing - structure variables' }
SDL3GPUGraphicsPipelineCreateInfo >> primitiveType: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_PRIMITIVE_TYPE put: anObject value
]

{ #category : 'accessing - structure variables' }
SDL3GPUGraphicsPipelineCreateInfo >> props [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_PROPS
]

{ #category : 'accessing - structure variables' }
SDL3GPUGraphicsPipelineCreateInfo >> props: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_PROPS put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUGraphicsPipelineCreateInfo >> rasterizerState [
	"This method was automatically generated"
	^ SDL3GPURasterizerState fromHandle: (handle referenceStructAt: OFFSET_RASTERIZER_STATE length: SDL3GPURasterizerState byteSize)
]

{ #category : 'accessing - structure variables' }
SDL3GPUGraphicsPipelineCreateInfo >> rasterizerState: anObject [
	"This method was automatically generated"
	handle structAt: OFFSET_RASTERIZER_STATE put: anObject getHandle length: SDL3GPURasterizerState byteSize
]

{ #category : 'accessing - structure variables' }
SDL3GPUGraphicsPipelineCreateInfo >> targetInfo [
	"This method was automatically generated"
	^ SDL3GPUGraphicsPipelineTargetInfo fromHandle: (handle referenceStructAt: OFFSET_TARGET_INFO length: SDL3GPUGraphicsPipelineTargetInfo byteSize)
]

{ #category : 'accessing - structure variables' }
SDL3GPUGraphicsPipelineCreateInfo >> targetInfo: anObject [
	"This method was automatically generated"
	handle structAt: OFFSET_TARGET_INFO put: anObject getHandle length: SDL3GPUGraphicsPipelineTargetInfo byteSize
]

{ #category : 'accessing - structure variables' }
SDL3GPUGraphicsPipelineCreateInfo >> vertexInputState [
	"This method was automatically generated"
	^ SDL3GPUVertexInputState fromHandle: (handle referenceStructAt: OFFSET_VERTEX_INPUT_STATE length: SDL3GPUVertexInputState byteSize)
]

{ #category : 'accessing - structure variables' }
SDL3GPUGraphicsPipelineCreateInfo >> vertexInputState: anObject [
	"This method was automatically generated"
	handle structAt: OFFSET_VERTEX_INPUT_STATE put: anObject getHandle length: SDL3GPUVertexInputState byteSize
]

{ #category : 'accessing - structure variables' }
SDL3GPUGraphicsPipelineCreateInfo >> vertexShader [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_VERTEX_SHADER) type: ExternalType void asPointerType
]

{ #category : 'accessing - structure variables' }
SDL3GPUGraphicsPipelineCreateInfo >> vertexShader: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_VERTEX_SHADER put: anObject getHandle.
]
