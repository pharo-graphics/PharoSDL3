Class {
	#name : 'S3SDL_GPUTextureRegion',
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
S3SDL_GPUTextureRegion class >> fieldsDesc [

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
S3SDL_GPUTextureRegion >> d [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_D
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUTextureRegion >> d: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_D put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUTextureRegion >> h [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_H
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUTextureRegion >> h: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_H put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUTextureRegion >> layer [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_LAYER
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUTextureRegion >> layer: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_LAYER put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUTextureRegion >> mip_level [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_MIP_LEVEL
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUTextureRegion >> mip_level: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_MIP_LEVEL put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUTextureRegion >> texture [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_TEXTURE) type: ExternalType void asPointerType
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUTextureRegion >> texture: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_TEXTURE put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUTextureRegion >> w [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_W
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUTextureRegion >> w: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_W put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUTextureRegion >> x [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_X
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUTextureRegion >> x: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_X put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUTextureRegion >> y [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_Y
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUTextureRegion >> y: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_Y put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUTextureRegion >> z [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_Z
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUTextureRegion >> z: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_Z put: anObject
]
