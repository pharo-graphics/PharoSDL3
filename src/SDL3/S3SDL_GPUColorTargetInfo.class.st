Class {
	#name : 'S3SDL_GPUColorTargetInfo',
	#superclass : 'S3Structure',
	#classVars : [
		'OFFSET_CLEAR_COLOR',
		'OFFSET_CYCLE',
		'OFFSET_CYCLE_RESOLVE_TEXTURE',
		'OFFSET_LAYER_OR_DEPTH_PLANE',
		'OFFSET_LOAD_OP',
		'OFFSET_MIP_LEVEL',
		'OFFSET_PADDING1',
		'OFFSET_PADDING2',
		'OFFSET_RESOLVE_LAYER',
		'OFFSET_RESOLVE_MIP_LEVEL',
		'OFFSET_RESOLVE_TEXTURE',
		'OFFSET_STORE_OP',
		'OFFSET_TEXTURE'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'field definition' }
S3SDL_GPUColorTargetInfo class >> fieldsDesc [

	^ #(
	SDL_GPUTexture* texture;
	int mip_level;
	int layer_or_depth_plane;
	int clear_color;
	SDL_GPULoadOp load_op;
	SDL_GPUStoreOp store_op;
	SDL_GPUTexture* resolve_texture;
	int resolve_mip_level;
	int resolve_layer;
	int cycle;
	int cycle_resolve_texture;
	int padding1;
	int padding2
	)
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUColorTargetInfo >> clear_color [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_CLEAR_COLOR
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUColorTargetInfo >> clear_color: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_CLEAR_COLOR put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUColorTargetInfo >> cycle [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_CYCLE
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUColorTargetInfo >> cycle: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_CYCLE put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUColorTargetInfo >> cycle_resolve_texture [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_CYCLE_RESOLVE_TEXTURE
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUColorTargetInfo >> cycle_resolve_texture: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_CYCLE_RESOLVE_TEXTURE put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUColorTargetInfo >> layer_or_depth_plane [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_LAYER_OR_DEPTH_PLANE
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUColorTargetInfo >> layer_or_depth_plane: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_LAYER_OR_DEPTH_PLANE put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUColorTargetInfo >> load_op [
	"This method was automatically generated"
	^S3SDL_GPULoadOp fromInteger: (handle unsignedLongAt: OFFSET_LOAD_OP)
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUColorTargetInfo >> load_op: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_LOAD_OP put: anObject value
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUColorTargetInfo >> mip_level [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_MIP_LEVEL
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUColorTargetInfo >> mip_level: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_MIP_LEVEL put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUColorTargetInfo >> padding1 [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_PADDING1
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUColorTargetInfo >> padding1: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_PADDING1 put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUColorTargetInfo >> padding2 [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_PADDING2
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUColorTargetInfo >> padding2: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_PADDING2 put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUColorTargetInfo >> resolve_layer [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_RESOLVE_LAYER
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUColorTargetInfo >> resolve_layer: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_RESOLVE_LAYER put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUColorTargetInfo >> resolve_mip_level [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_RESOLVE_MIP_LEVEL
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUColorTargetInfo >> resolve_mip_level: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_RESOLVE_MIP_LEVEL put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUColorTargetInfo >> resolve_texture [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_RESOLVE_TEXTURE) type: ExternalType void asPointerType
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUColorTargetInfo >> resolve_texture: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_RESOLVE_TEXTURE put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUColorTargetInfo >> store_op [
	"This method was automatically generated"
	^S3SDL_GPUStoreOp fromInteger: (handle unsignedLongAt: OFFSET_STORE_OP)
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUColorTargetInfo >> store_op: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_STORE_OP put: anObject value
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUColorTargetInfo >> texture [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_TEXTURE) type: ExternalType void asPointerType
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUColorTargetInfo >> texture: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_TEXTURE put: anObject getHandle.
]
