Class {
	#name : 'SDL3GPUColorTargetDescription',
	#superclass : 'SDL3Structure',
	#classVars : [
		'OFFSET_BLEND_STATE',
		'OFFSET_FORMAT'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'field definition' }
SDL3GPUColorTargetDescription class >> fieldsDesc [

	^ #(
	SDL_GPUTextureFormat format;
	SDL_GPUColorTargetBlendState blend_state
	)
]

{ #category : 'accessing - structure variables' }
SDL3GPUColorTargetDescription >> blend_state [
	"This method was automatically generated"
	^ SDL3GPUColorTargetBlendState fromHandle: (handle referenceStructAt: OFFSET_BLEND_STATE length: SDL3GPUColorTargetBlendState byteSize)
]

{ #category : 'accessing - structure variables' }
SDL3GPUColorTargetDescription >> blend_state: anObject [
	"This method was automatically generated"
	handle structAt: OFFSET_BLEND_STATE put: anObject getHandle length: SDL3GPUColorTargetBlendState byteSize
]

{ #category : 'accessing - structure variables' }
SDL3GPUColorTargetDescription >> format [
	"This method was automatically generated"
	^SDL3GPUTextureFormat fromInteger: (handle unsignedLongAt: OFFSET_FORMAT)
]

{ #category : 'accessing - structure variables' }
SDL3GPUColorTargetDescription >> format: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_FORMAT put: anObject value
]
