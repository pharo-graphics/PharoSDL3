Class {
	#name : 'SDL3GPUBlitRegion',
	#superclass : 'SDL3Structure',
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
SDL3GPUBlitRegion class >> fieldsDesc [

	^ #(
	SDL_GPUTexture* texture;
	Uint32 mip_level;
	Uint32 layer_or_depth_plane;
	Uint32 x;
	Uint32 y;
	Uint32 w;
	Uint32 h
	)
]

{ #category : 'accessing - structure variables' }
SDL3GPUBlitRegion >> h [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_H
]

{ #category : 'accessing - structure variables' }
SDL3GPUBlitRegion >> h: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_H put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUBlitRegion >> layerOrDepthPlane [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_LAYER_OR_DEPTH_PLANE
]

{ #category : 'accessing - structure variables' }
SDL3GPUBlitRegion >> layerOrDepthPlane: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_LAYER_OR_DEPTH_PLANE put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUBlitRegion >> mipLevel [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_MIP_LEVEL
]

{ #category : 'accessing - structure variables' }
SDL3GPUBlitRegion >> mipLevel: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_MIP_LEVEL put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUBlitRegion >> texture [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_TEXTURE) type: ExternalType void asPointerType
]

{ #category : 'accessing - structure variables' }
SDL3GPUBlitRegion >> texture: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_TEXTURE put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
SDL3GPUBlitRegion >> w [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_W
]

{ #category : 'accessing - structure variables' }
SDL3GPUBlitRegion >> w: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_W put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUBlitRegion >> x [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_X
]

{ #category : 'accessing - structure variables' }
SDL3GPUBlitRegion >> x: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_X put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUBlitRegion >> y [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_Y
]

{ #category : 'accessing - structure variables' }
SDL3GPUBlitRegion >> y: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_Y put: anObject
]
