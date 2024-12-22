Class {
	#name : 'S3SDL_GPUGraphicsPipelineCreateInfo',
	#superclass : 'S3Structure',
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
S3SDL_GPUGraphicsPipelineCreateInfo class >> fieldsDesc [

	^ #(
	SDL_GPUShader* vertex_shader;
	SDL_GPUShader* fragment_shader;
	SDL_GPUVertexInputState vertex_input_state;
	SDL_GPUPrimitiveType primitive_type;
	SDL_GPURasterizerState rasterizer_state;
	SDL_GPUMultisampleState multisample_state;
	SDL_GPUDepthStencilState depth_stencil_state;
	SDL_GPUGraphicsPipelineTargetInfo target_info;
	int props
	)
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUGraphicsPipelineCreateInfo >> depth_stencil_state [
	"This method was automatically generated"
	^ S3SDL_GPUDepthStencilState fromHandle: (handle referenceStructAt: OFFSET_DEPTH_STENCIL_STATE length: S3SDL_GPUDepthStencilState byteSize)
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUGraphicsPipelineCreateInfo >> depth_stencil_state: anObject [
	"This method was automatically generated"
	handle structAt: OFFSET_DEPTH_STENCIL_STATE put: anObject getHandle length: S3SDL_GPUDepthStencilState byteSize
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUGraphicsPipelineCreateInfo >> fragment_shader [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_FRAGMENT_SHADER) type: ExternalType void asPointerType
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUGraphicsPipelineCreateInfo >> fragment_shader: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_FRAGMENT_SHADER put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUGraphicsPipelineCreateInfo >> multisample_state [
	"This method was automatically generated"
	^ S3SDL_GPUMultisampleState fromHandle: (handle referenceStructAt: OFFSET_MULTISAMPLE_STATE length: S3SDL_GPUMultisampleState byteSize)
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUGraphicsPipelineCreateInfo >> multisample_state: anObject [
	"This method was automatically generated"
	handle structAt: OFFSET_MULTISAMPLE_STATE put: anObject getHandle length: S3SDL_GPUMultisampleState byteSize
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUGraphicsPipelineCreateInfo >> primitive_type [
	"This method was automatically generated"
	^S3SDL_GPUPrimitiveType fromInteger: (handle unsignedLongAt: OFFSET_PRIMITIVE_TYPE)
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUGraphicsPipelineCreateInfo >> primitive_type: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_PRIMITIVE_TYPE put: anObject value
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUGraphicsPipelineCreateInfo >> props [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_PROPS
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUGraphicsPipelineCreateInfo >> props: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_PROPS put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUGraphicsPipelineCreateInfo >> rasterizer_state [
	"This method was automatically generated"
	^ S3SDL_GPURasterizerState fromHandle: (handle referenceStructAt: OFFSET_RASTERIZER_STATE length: S3SDL_GPURasterizerState byteSize)
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUGraphicsPipelineCreateInfo >> rasterizer_state: anObject [
	"This method was automatically generated"
	handle structAt: OFFSET_RASTERIZER_STATE put: anObject getHandle length: S3SDL_GPURasterizerState byteSize
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUGraphicsPipelineCreateInfo >> target_info [
	"This method was automatically generated"
	^ S3SDL_GPUGraphicsPipelineTargetInfo fromHandle: (handle referenceStructAt: OFFSET_TARGET_INFO length: S3SDL_GPUGraphicsPipelineTargetInfo byteSize)
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUGraphicsPipelineCreateInfo >> target_info: anObject [
	"This method was automatically generated"
	handle structAt: OFFSET_TARGET_INFO put: anObject getHandle length: S3SDL_GPUGraphicsPipelineTargetInfo byteSize
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUGraphicsPipelineCreateInfo >> vertex_input_state [
	"This method was automatically generated"
	^ S3SDL_GPUVertexInputState fromHandle: (handle referenceStructAt: OFFSET_VERTEX_INPUT_STATE length: S3SDL_GPUVertexInputState byteSize)
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUGraphicsPipelineCreateInfo >> vertex_input_state: anObject [
	"This method was automatically generated"
	handle structAt: OFFSET_VERTEX_INPUT_STATE put: anObject getHandle length: S3SDL_GPUVertexInputState byteSize
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUGraphicsPipelineCreateInfo >> vertex_shader [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_VERTEX_SHADER) type: ExternalType void asPointerType
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUGraphicsPipelineCreateInfo >> vertex_shader: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_VERTEX_SHADER put: anObject getHandle.
]
