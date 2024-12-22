Class {
	#name : 'S3SDL_GPUTextureLocation',
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
S3SDL_GPUTextureLocation class >> fieldsDesc [

	^ #(
	SDL_GPUTexture* texture;
	int mip_level;
	int layer;
	int x;
	int y;
	int z
	)
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUTextureLocation >> layer [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_LAYER
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUTextureLocation >> layer: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_LAYER put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUTextureLocation >> mip_level [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_MIP_LEVEL
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUTextureLocation >> mip_level: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_MIP_LEVEL put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUTextureLocation >> texture [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_TEXTURE) type: ExternalType void asPointerType
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUTextureLocation >> texture: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_TEXTURE put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUTextureLocation >> x [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_X
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUTextureLocation >> x: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_X put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUTextureLocation >> y [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_Y
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUTextureLocation >> y: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_Y put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUTextureLocation >> z [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_Z
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUTextureLocation >> z: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_Z put: anObject
]
