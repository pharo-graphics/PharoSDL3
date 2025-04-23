Class {
	#name : 'SDL3GPUTextureSamplerBinding',
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
SDL3GPUTextureSamplerBinding class >> fieldsDesc [

	^ #(
	SDL_GPUTexture* texture;
	SDL_GPUSampler* sampler
	)
]

{ #category : 'accessing - structure variables' }
SDL3GPUTextureSamplerBinding >> sampler [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_SAMPLER) type: ExternalType void asPointerType
]

{ #category : 'accessing - structure variables' }
SDL3GPUTextureSamplerBinding >> sampler: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_SAMPLER put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
SDL3GPUTextureSamplerBinding >> texture [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_TEXTURE) type: ExternalType void asPointerType
]

{ #category : 'accessing - structure variables' }
SDL3GPUTextureSamplerBinding >> texture: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_TEXTURE put: anObject getHandle.
]
