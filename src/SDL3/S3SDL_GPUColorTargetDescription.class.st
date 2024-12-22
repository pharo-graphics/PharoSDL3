Class {
	#name : 'S3SDL_GPUColorTargetDescription',
	#superclass : 'S3Structure',
	#classVars : [
		'OFFSET_BLEND_STATE',
		'OFFSET_FORMAT'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'field definition' }
S3SDL_GPUColorTargetDescription class >> fieldsDesc [

	^ #(
	SDL_GPUTextureFormat format;
	SDL_GPUColorTargetBlendState blend_state
	)
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUColorTargetDescription >> blend_state [
	"This method was automatically generated"
	^ S3SDL_GPUColorTargetBlendState fromHandle: (handle referenceStructAt: OFFSET_BLEND_STATE length: S3SDL_GPUColorTargetBlendState byteSize)
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUColorTargetDescription >> blend_state: anObject [
	"This method was automatically generated"
	handle structAt: OFFSET_BLEND_STATE put: anObject getHandle length: S3SDL_GPUColorTargetBlendState byteSize
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUColorTargetDescription >> format [
	"This method was automatically generated"
	^S3SDL_GPUTextureFormat fromInteger: (handle unsignedLongAt: OFFSET_FORMAT)
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUColorTargetDescription >> format: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_FORMAT put: anObject value
]
