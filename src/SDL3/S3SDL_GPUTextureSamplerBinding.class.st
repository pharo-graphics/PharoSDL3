Class {
	#name : 'S3SDL_GPUTextureSamplerBinding',
	#superclass : 'S3Structure',
	#classVars : [
		'OFFSET_SAMPLER',
		'OFFSET_TEXTURE'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'field definition' }
S3SDL_GPUTextureSamplerBinding class >> fieldsDesc [

	^ #(
	SDL_GPUTexture* texture;
	SDL_GPUSampler* sampler
	)
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUTextureSamplerBinding >> sampler [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_SAMPLER) type: ExternalType void asPointerType
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUTextureSamplerBinding >> sampler: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_SAMPLER put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUTextureSamplerBinding >> texture [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_TEXTURE) type: ExternalType void asPointerType
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUTextureSamplerBinding >> texture: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_TEXTURE put: anObject getHandle.
]
