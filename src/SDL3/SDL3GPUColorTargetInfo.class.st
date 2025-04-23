Class {
	#name : 'SDL3GPUColorTargetInfo',
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
SDL3GPUColorTargetInfo class >> fieldsDesc [

	^ #(
	SDL_GPUTexture* texture;
	Uint32 mip_level;
	Uint32 layer_or_depth_plane;
	SDL_FColor clear_color;
	SDL_GPULoadOp load_op;
	SDL_GPUStoreOp store_op;
	SDL_GPUTexture* resolve_texture;
	Uint32 resolve_mip_level;
	Uint32 resolve_layer;
	bool cycle;
	bool cycle_resolve_texture;
	Uint8 padding1;
	Uint8 padding2
	)
]

{ #category : 'accessing - structure variables' }
SDL3GPUColorTargetInfo >> clear_color [
	"This method was automatically generated"
	^ SDL3FColor fromHandle: (handle referenceStructAt: OFFSET_CLEAR_COLOR length: SDL3FColor byteSize)
]

{ #category : 'accessing - structure variables' }
SDL3GPUColorTargetInfo >> clear_color: anObject [
	"This method was automatically generated"
	handle structAt: OFFSET_CLEAR_COLOR put: anObject getHandle length: SDL3FColor byteSize
]

{ #category : 'accessing - structure variables' }
SDL3GPUColorTargetInfo >> cycle [
	"This method was automatically generated"
	^handle booleanAt: OFFSET_CYCLE
]

{ #category : 'accessing - structure variables' }
SDL3GPUColorTargetInfo >> cycle: anObject [
	"This method was automatically generated"
	handle booleanAt: OFFSET_CYCLE put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUColorTargetInfo >> cycle_resolve_texture [
	"This method was automatically generated"
	^handle booleanAt: OFFSET_CYCLE_RESOLVE_TEXTURE
]

{ #category : 'accessing - structure variables' }
SDL3GPUColorTargetInfo >> cycle_resolve_texture: anObject [
	"This method was automatically generated"
	handle booleanAt: OFFSET_CYCLE_RESOLVE_TEXTURE put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUColorTargetInfo >> layer_or_depth_plane [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_LAYER_OR_DEPTH_PLANE
]

{ #category : 'accessing - structure variables' }
SDL3GPUColorTargetInfo >> layer_or_depth_plane: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_LAYER_OR_DEPTH_PLANE put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUColorTargetInfo >> load_op [
	"This method was automatically generated"
	^SDL3GPULoadOp fromInteger: (handle unsignedLongAt: OFFSET_LOAD_OP)
]

{ #category : 'accessing - structure variables' }
SDL3GPUColorTargetInfo >> load_op: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_LOAD_OP put: anObject value
]

{ #category : 'accessing - structure variables' }
SDL3GPUColorTargetInfo >> mip_level [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_MIP_LEVEL
]

{ #category : 'accessing - structure variables' }
SDL3GPUColorTargetInfo >> mip_level: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_MIP_LEVEL put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUColorTargetInfo >> padding1 [
	"This method was automatically generated"
	^handle unsignedByteAt: OFFSET_PADDING1
]

{ #category : 'accessing - structure variables' }
SDL3GPUColorTargetInfo >> padding1: anObject [
	"This method was automatically generated"
	handle unsignedByteAt: OFFSET_PADDING1 put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUColorTargetInfo >> padding2 [
	"This method was automatically generated"
	^handle unsignedByteAt: OFFSET_PADDING2
]

{ #category : 'accessing - structure variables' }
SDL3GPUColorTargetInfo >> padding2: anObject [
	"This method was automatically generated"
	handle unsignedByteAt: OFFSET_PADDING2 put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUColorTargetInfo >> resolve_layer [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_RESOLVE_LAYER
]

{ #category : 'accessing - structure variables' }
SDL3GPUColorTargetInfo >> resolve_layer: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_RESOLVE_LAYER put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUColorTargetInfo >> resolve_mip_level [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_RESOLVE_MIP_LEVEL
]

{ #category : 'accessing - structure variables' }
SDL3GPUColorTargetInfo >> resolve_mip_level: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_RESOLVE_MIP_LEVEL put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUColorTargetInfo >> resolve_texture [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_RESOLVE_TEXTURE) type: ExternalType void asPointerType
]

{ #category : 'accessing - structure variables' }
SDL3GPUColorTargetInfo >> resolve_texture: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_RESOLVE_TEXTURE put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
SDL3GPUColorTargetInfo >> store_op [
	"This method was automatically generated"
	^SDL3GPUStoreOp fromInteger: (handle unsignedLongAt: OFFSET_STORE_OP)
]

{ #category : 'accessing - structure variables' }
SDL3GPUColorTargetInfo >> store_op: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_STORE_OP put: anObject value
]

{ #category : 'accessing - structure variables' }
SDL3GPUColorTargetInfo >> texture [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_TEXTURE) type: ExternalType void asPointerType
]

{ #category : 'accessing - structure variables' }
SDL3GPUColorTargetInfo >> texture: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_TEXTURE put: anObject getHandle.
]
