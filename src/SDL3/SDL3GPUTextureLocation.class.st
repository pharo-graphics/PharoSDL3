Class {
	#name : 'SDL3GPUTextureLocation',
	#superclass : 'S3Structure',
	#classVars : [
		'OFFSET_LAYER',
		'OFFSET_MIP_LEVEL',
		'OFFSET_TEXTURE',
		'OFFSET_X',
		'OFFSET_Y',
		'OFFSET_Z'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'field definition' }
SDL3GPUTextureLocation class >> fieldsDesc [

	^ #(
	SDL_GPUTexture* texture;
	Uint32 mip_level;
	Uint32 layer;
	Uint32 x;
	Uint32 y;
	Uint32 z
	)
]

{ #category : 'accessing - structure variables' }
SDL3GPUTextureLocation >> layer [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_LAYER
]

{ #category : 'accessing - structure variables' }
SDL3GPUTextureLocation >> layer: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_LAYER put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUTextureLocation >> mip_level [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_MIP_LEVEL
]

{ #category : 'accessing - structure variables' }
SDL3GPUTextureLocation >> mip_level: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_MIP_LEVEL put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUTextureLocation >> texture [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_TEXTURE) type: ExternalType void asPointerType
]

{ #category : 'accessing - structure variables' }
SDL3GPUTextureLocation >> texture: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_TEXTURE put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
SDL3GPUTextureLocation >> x [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_X
]

{ #category : 'accessing - structure variables' }
SDL3GPUTextureLocation >> x: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_X put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUTextureLocation >> y [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_Y
]

{ #category : 'accessing - structure variables' }
SDL3GPUTextureLocation >> y: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_Y put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUTextureLocation >> z [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_Z
]

{ #category : 'accessing - structure variables' }
SDL3GPUTextureLocation >> z: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_Z put: anObject
]
