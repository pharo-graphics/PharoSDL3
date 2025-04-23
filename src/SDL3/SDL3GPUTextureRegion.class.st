Class {
	#name : 'SDL3GPUTextureRegion',
	#superclass : 'S3Structure',
	#classVars : [
		'OFFSET_D',
		'OFFSET_H',
		'OFFSET_LAYER',
		'OFFSET_MIP_LEVEL',
		'OFFSET_TEXTURE',
		'OFFSET_W',
		'OFFSET_X',
		'OFFSET_Y',
		'OFFSET_Z'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'field definition' }
SDL3GPUTextureRegion class >> fieldsDesc [

	^ #(
	SDL_GPUTexture* texture;
	Uint32 mip_level;
	Uint32 layer;
	Uint32 x;
	Uint32 y;
	Uint32 z;
	Uint32 w;
	Uint32 h;
	Uint32 d
	)
]

{ #category : 'accessing - structure variables' }
SDL3GPUTextureRegion >> d [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_D
]

{ #category : 'accessing - structure variables' }
SDL3GPUTextureRegion >> d: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_D put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUTextureRegion >> h [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_H
]

{ #category : 'accessing - structure variables' }
SDL3GPUTextureRegion >> h: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_H put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUTextureRegion >> layer [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_LAYER
]

{ #category : 'accessing - structure variables' }
SDL3GPUTextureRegion >> layer: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_LAYER put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUTextureRegion >> mip_level [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_MIP_LEVEL
]

{ #category : 'accessing - structure variables' }
SDL3GPUTextureRegion >> mip_level: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_MIP_LEVEL put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUTextureRegion >> texture [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_TEXTURE) type: ExternalType void asPointerType
]

{ #category : 'accessing - structure variables' }
SDL3GPUTextureRegion >> texture: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_TEXTURE put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
SDL3GPUTextureRegion >> w [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_W
]

{ #category : 'accessing - structure variables' }
SDL3GPUTextureRegion >> w: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_W put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUTextureRegion >> x [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_X
]

{ #category : 'accessing - structure variables' }
SDL3GPUTextureRegion >> x: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_X put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUTextureRegion >> y [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_Y
]

{ #category : 'accessing - structure variables' }
SDL3GPUTextureRegion >> y: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_Y put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUTextureRegion >> z [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_Z
]

{ #category : 'accessing - structure variables' }
SDL3GPUTextureRegion >> z: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_Z put: anObject
]
