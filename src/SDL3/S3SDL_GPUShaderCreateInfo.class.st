Class {
	#name : 'S3SDL_GPUShaderCreateInfo',
	#superclass : 'S3Structure',
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
S3SDL_GPUShaderCreateInfo class >> fieldsDesc [

	^ #(
	int code_size;
	int* code;
	char* entrypoint;
	SDL_GPUShaderFormat format;
	SDL_GPUShaderStage stage;
	int num_samplers;
	int num_storage_textures;
	int num_storage_buffers;
	int num_uniform_buffers;
	int props
	)
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUShaderCreateInfo >> code [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_CODE) type: ExternalType long asPointerType
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUShaderCreateInfo >> code: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_CODE put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUShaderCreateInfo >> code_size [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_CODE_SIZE
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUShaderCreateInfo >> code_size: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_CODE_SIZE put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUShaderCreateInfo >> entrypoint [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_ENTRYPOINT) type: ExternalType char asPointerType
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUShaderCreateInfo >> entrypoint: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_ENTRYPOINT put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUShaderCreateInfo >> format [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_FORMAT
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUShaderCreateInfo >> format: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_FORMAT put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUShaderCreateInfo >> num_samplers [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_NUM_SAMPLERS
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUShaderCreateInfo >> num_samplers: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_NUM_SAMPLERS put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUShaderCreateInfo >> num_storage_buffers [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_NUM_STORAGE_BUFFERS
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUShaderCreateInfo >> num_storage_buffers: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_NUM_STORAGE_BUFFERS put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUShaderCreateInfo >> num_storage_textures [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_NUM_STORAGE_TEXTURES
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUShaderCreateInfo >> num_storage_textures: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_NUM_STORAGE_TEXTURES put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUShaderCreateInfo >> num_uniform_buffers [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_NUM_UNIFORM_BUFFERS
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUShaderCreateInfo >> num_uniform_buffers: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_NUM_UNIFORM_BUFFERS put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUShaderCreateInfo >> props [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_PROPS
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUShaderCreateInfo >> props: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_PROPS put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUShaderCreateInfo >> stage [
	"This method was automatically generated"
	^S3SDL_GPUShaderStage fromInteger: (handle unsignedLongAt: OFFSET_STAGE)
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUShaderCreateInfo >> stage: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_STAGE put: anObject value
]
