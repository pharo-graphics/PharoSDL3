Class {
	#name : 'SDL3GPUShaderCreateInfo',
	#superclass : 'SDL3Structure',
	#classVars : [
		'OFFSET_CODE',
		'OFFSET_CODE_SIZE',
		'OFFSET_ENTRYPOINT',
		'OFFSET_FORMAT',
		'OFFSET_NUM_SAMPLERS',
		'OFFSET_NUM_STORAGE_BUFFERS',
		'OFFSET_NUM_STORAGE_TEXTURES',
		'OFFSET_NUM_UNIFORM_BUFFERS',
		'OFFSET_PROPS',
		'OFFSET_STAGE'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'field definition' }
SDL3GPUShaderCreateInfo class >> fieldsDesc [

	^ #(
	size_t code_size;
	Uint8* code;
	char* entrypoint;
	SDL_GPUShaderFormat format;
	SDL_GPUShaderStage stage;
	Uint32 num_samplers;
	Uint32 num_storage_textures;
	Uint32 num_storage_buffers;
	Uint32 num_uniform_buffers;
	SDL_PropertiesID props
	)
]

{ #category : 'accessing - structure variables' }
SDL3GPUShaderCreateInfo >> code [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_CODE) type: ExternalType byte asPointerType
]

{ #category : 'accessing - structure variables' }
SDL3GPUShaderCreateInfo >> code: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_CODE put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
SDL3GPUShaderCreateInfo >> code_size [
	"This method was automatically generated"
	^handle platformSizeTAt: OFFSET_CODE_SIZE
]

{ #category : 'accessing - structure variables' }
SDL3GPUShaderCreateInfo >> code_size: anObject [
	"This method was automatically generated"
	^handle platformSizeTAt: OFFSET_CODE_SIZE put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUShaderCreateInfo >> entrypoint [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_ENTRYPOINT) type: ExternalType char asPointerType
]

{ #category : 'accessing - structure variables' }
SDL3GPUShaderCreateInfo >> entrypoint: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_ENTRYPOINT put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
SDL3GPUShaderCreateInfo >> format [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_FORMAT
]

{ #category : 'accessing - structure variables' }
SDL3GPUShaderCreateInfo >> format: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_FORMAT put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUShaderCreateInfo >> num_samplers [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_NUM_SAMPLERS
]

{ #category : 'accessing - structure variables' }
SDL3GPUShaderCreateInfo >> num_samplers: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_NUM_SAMPLERS put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUShaderCreateInfo >> num_storage_buffers [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_NUM_STORAGE_BUFFERS
]

{ #category : 'accessing - structure variables' }
SDL3GPUShaderCreateInfo >> num_storage_buffers: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_NUM_STORAGE_BUFFERS put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUShaderCreateInfo >> num_storage_textures [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_NUM_STORAGE_TEXTURES
]

{ #category : 'accessing - structure variables' }
SDL3GPUShaderCreateInfo >> num_storage_textures: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_NUM_STORAGE_TEXTURES put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUShaderCreateInfo >> num_uniform_buffers [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_NUM_UNIFORM_BUFFERS
]

{ #category : 'accessing - structure variables' }
SDL3GPUShaderCreateInfo >> num_uniform_buffers: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_NUM_UNIFORM_BUFFERS put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUShaderCreateInfo >> props [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_PROPS
]

{ #category : 'accessing - structure variables' }
SDL3GPUShaderCreateInfo >> props: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_PROPS put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUShaderCreateInfo >> stage [
	"This method was automatically generated"
	^SDL3GPUShaderStage fromInteger: (handle unsignedLongAt: OFFSET_STAGE)
]

{ #category : 'accessing - structure variables' }
SDL3GPUShaderCreateInfo >> stage: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_STAGE put: anObject value
]
