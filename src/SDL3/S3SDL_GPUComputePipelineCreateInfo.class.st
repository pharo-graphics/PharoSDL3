Class {
	#name : 'S3SDL_GPUComputePipelineCreateInfo',
	#superclass : 'S3Structure',
	#classVars : [
		'OFFSET_CODE',
		'OFFSET_CODE_SIZE',
		'OFFSET_ENTRYPOINT',
		'OFFSET_FORMAT',
		'OFFSET_NUM_READONLY_STORAGE_BUFFERS',
		'OFFSET_NUM_READONLY_STORAGE_TEXTURES',
		'OFFSET_NUM_READWRITE_STORAGE_BUFFERS',
		'OFFSET_NUM_READWRITE_STORAGE_TEXTURES',
		'OFFSET_NUM_SAMPLERS',
		'OFFSET_NUM_UNIFORM_BUFFERS',
		'OFFSET_PROPS',
		'OFFSET_THREADCOUNT_X',
		'OFFSET_THREADCOUNT_Y',
		'OFFSET_THREADCOUNT_Z'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'field definition' }
S3SDL_GPUComputePipelineCreateInfo class >> fieldsDesc [

	^ #(
	int code_size;
	int* code;
	char* entrypoint;
	SDL_GPUShaderFormat format;
	int num_samplers;
	int num_readonly_storage_textures;
	int num_readonly_storage_buffers;
	int num_readwrite_storage_textures;
	int num_readwrite_storage_buffers;
	int num_uniform_buffers;
	int threadcount_x;
	int threadcount_y;
	int threadcount_z;
	int props
	)
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUComputePipelineCreateInfo >> code [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_CODE) type: ExternalType long asPointerType
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUComputePipelineCreateInfo >> code: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_CODE put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUComputePipelineCreateInfo >> code_size [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_CODE_SIZE
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUComputePipelineCreateInfo >> code_size: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_CODE_SIZE put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUComputePipelineCreateInfo >> entrypoint [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_ENTRYPOINT) type: ExternalType char asPointerType
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUComputePipelineCreateInfo >> entrypoint: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_ENTRYPOINT put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUComputePipelineCreateInfo >> format [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_FORMAT
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUComputePipelineCreateInfo >> format: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_FORMAT put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUComputePipelineCreateInfo >> num_readonly_storage_buffers [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_NUM_READONLY_STORAGE_BUFFERS
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUComputePipelineCreateInfo >> num_readonly_storage_buffers: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_NUM_READONLY_STORAGE_BUFFERS put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUComputePipelineCreateInfo >> num_readonly_storage_textures [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_NUM_READONLY_STORAGE_TEXTURES
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUComputePipelineCreateInfo >> num_readonly_storage_textures: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_NUM_READONLY_STORAGE_TEXTURES put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUComputePipelineCreateInfo >> num_readwrite_storage_buffers [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_NUM_READWRITE_STORAGE_BUFFERS
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUComputePipelineCreateInfo >> num_readwrite_storage_buffers: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_NUM_READWRITE_STORAGE_BUFFERS put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUComputePipelineCreateInfo >> num_readwrite_storage_textures [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_NUM_READWRITE_STORAGE_TEXTURES
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUComputePipelineCreateInfo >> num_readwrite_storage_textures: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_NUM_READWRITE_STORAGE_TEXTURES put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUComputePipelineCreateInfo >> num_samplers [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_NUM_SAMPLERS
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUComputePipelineCreateInfo >> num_samplers: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_NUM_SAMPLERS put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUComputePipelineCreateInfo >> num_uniform_buffers [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_NUM_UNIFORM_BUFFERS
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUComputePipelineCreateInfo >> num_uniform_buffers: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_NUM_UNIFORM_BUFFERS put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUComputePipelineCreateInfo >> props [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_PROPS
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUComputePipelineCreateInfo >> props: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_PROPS put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUComputePipelineCreateInfo >> threadcount_x [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_THREADCOUNT_X
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUComputePipelineCreateInfo >> threadcount_x: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_THREADCOUNT_X put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUComputePipelineCreateInfo >> threadcount_y [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_THREADCOUNT_Y
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUComputePipelineCreateInfo >> threadcount_y: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_THREADCOUNT_Y put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUComputePipelineCreateInfo >> threadcount_z [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_THREADCOUNT_Z
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUComputePipelineCreateInfo >> threadcount_z: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_THREADCOUNT_Z put: anObject
]
