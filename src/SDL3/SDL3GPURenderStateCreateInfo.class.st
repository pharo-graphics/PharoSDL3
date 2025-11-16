Class {
	#name : 'SDL3GPURenderStateCreateInfo',
	#superclass : 'SDL3Structure',
	#classVars : [
		'OFFSET_FRAGMENT_SHADER',
		'OFFSET_NUM_SAMPLER_BINDINGS',
		'OFFSET_NUM_STORAGE_BUFFERS',
		'OFFSET_NUM_STORAGE_TEXTURES',
		'OFFSET_PROPS',
		'OFFSET_SAMPLER_BINDINGS',
		'OFFSET_STORAGE_BUFFERS',
		'OFFSET_STORAGE_TEXTURES'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'field definition' }
SDL3GPURenderStateCreateInfo class >> fieldsDesc [

	^ #(
	SDL_GPUShader* fragment_shader;
	Sint32 num_sampler_bindings;
	SDL_GPUTextureSamplerBinding* sampler_bindings;
	Sint32 num_storage_textures;
	SDL_GPUTexture* storage_textures;
	Sint32 num_storage_buffers;
	SDL_GPUBuffer* storage_buffers;
	SDL_PropertiesID props
	)
]

{ #category : 'accessing - structure variables' }
SDL3GPURenderStateCreateInfo >> fragmentShader [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_FRAGMENT_SHADER) type: ExternalType void asPointerType
]

{ #category : 'accessing - structure variables' }
SDL3GPURenderStateCreateInfo >> fragmentShader: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_FRAGMENT_SHADER put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
SDL3GPURenderStateCreateInfo >> numSamplerBindings [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_NUM_SAMPLER_BINDINGS
]

{ #category : 'accessing - structure variables' }
SDL3GPURenderStateCreateInfo >> numSamplerBindings: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_NUM_SAMPLER_BINDINGS put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPURenderStateCreateInfo >> numStorageBuffers [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_NUM_STORAGE_BUFFERS
]

{ #category : 'accessing - structure variables' }
SDL3GPURenderStateCreateInfo >> numStorageBuffers: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_NUM_STORAGE_BUFFERS put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPURenderStateCreateInfo >> numStorageTextures [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_NUM_STORAGE_TEXTURES
]

{ #category : 'accessing - structure variables' }
SDL3GPURenderStateCreateInfo >> numStorageTextures: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_NUM_STORAGE_TEXTURES put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPURenderStateCreateInfo >> props [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_PROPS
]

{ #category : 'accessing - structure variables' }
SDL3GPURenderStateCreateInfo >> props: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_PROPS put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPURenderStateCreateInfo >> samplerBindings [
	"This method was automatically generated"
	^SDL3GPUTextureSamplerBinding fromHandle: (handle pointerAt: OFFSET_SAMPLER_BINDINGS)
]

{ #category : 'accessing - structure variables' }
SDL3GPURenderStateCreateInfo >> samplerBindings: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_SAMPLER_BINDINGS put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
SDL3GPURenderStateCreateInfo >> storageBuffers [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_STORAGE_BUFFERS) type: ExternalType void asPointerType
]

{ #category : 'accessing - structure variables' }
SDL3GPURenderStateCreateInfo >> storageBuffers: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_STORAGE_BUFFERS put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
SDL3GPURenderStateCreateInfo >> storageTextures [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_STORAGE_TEXTURES) type: ExternalType void asPointerType
]

{ #category : 'accessing - structure variables' }
SDL3GPURenderStateCreateInfo >> storageTextures: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_STORAGE_TEXTURES put: anObject getHandle.
]
