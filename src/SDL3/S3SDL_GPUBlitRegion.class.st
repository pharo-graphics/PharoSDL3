Class {
	#name : 'S3SDL_GPUBlitRegion',
	#superclass : 'S3Structure',
	#classVars : [
		'OFFSET_H',
		'OFFSET_LAYER_OR_DEPTH_PLANE',
		'OFFSET_MIP_LEVEL',
		'OFFSET_TEXTURE',
		'OFFSET_W',
		'OFFSET_X',
		'OFFSET_Y'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'field definition' }
S3SDL_GPUBlitRegion class >> fieldsDesc [

	^ #(
	SDL_GPUTexture* texture;
	int mip_level;
	int layer_or_depth_plane;
	int x;
	int y;
	int w;
	int h
	)
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUBlitRegion >> h [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_H
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUBlitRegion >> h: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_H put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUBlitRegion >> layer_or_depth_plane [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_LAYER_OR_DEPTH_PLANE
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUBlitRegion >> layer_or_depth_plane: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_LAYER_OR_DEPTH_PLANE put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUBlitRegion >> mip_level [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_MIP_LEVEL
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUBlitRegion >> mip_level: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_MIP_LEVEL put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUBlitRegion >> texture [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_TEXTURE) type: ExternalType void asPointerType
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUBlitRegion >> texture: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_TEXTURE put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUBlitRegion >> w [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_W
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUBlitRegion >> w: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_W put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUBlitRegion >> x [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_X
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUBlitRegion >> x: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_X put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUBlitRegion >> y [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_Y
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUBlitRegion >> y: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_Y put: anObject
]
