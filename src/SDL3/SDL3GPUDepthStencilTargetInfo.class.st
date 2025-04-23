Class {
	#name : 'SDL3GPUDepthStencilTargetInfo',
	#superclass : 'SDL3Structure',
	#classVars : [
		'OFFSET_CLEAR_DEPTH',
		'OFFSET_CLEAR_STENCIL',
		'OFFSET_CYCLE',
		'OFFSET_LOAD_OP',
		'OFFSET_PADDING1',
		'OFFSET_PADDING2',
		'OFFSET_STENCIL_LOAD_OP',
		'OFFSET_STENCIL_STORE_OP',
		'OFFSET_STORE_OP',
		'OFFSET_TEXTURE'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'field definition' }
SDL3GPUDepthStencilTargetInfo class >> fieldsDesc [

	^ #(
	SDL_GPUTexture* texture;
	float clear_depth;
	SDL_GPULoadOp load_op;
	SDL_GPUStoreOp store_op;
	SDL_GPULoadOp stencil_load_op;
	SDL_GPUStoreOp stencil_store_op;
	bool cycle;
	Uint8 clear_stencil;
	Uint8 padding1;
	Uint8 padding2
	)
]

{ #category : 'accessing - structure variables' }
SDL3GPUDepthStencilTargetInfo >> clearDepth [
	"This method was automatically generated"
	^handle floatAt: OFFSET_CLEAR_DEPTH
]

{ #category : 'accessing - structure variables' }
SDL3GPUDepthStencilTargetInfo >> clearDepth: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_CLEAR_DEPTH put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUDepthStencilTargetInfo >> clearStencil [
	"This method was automatically generated"
	^handle unsignedByteAt: OFFSET_CLEAR_STENCIL
]

{ #category : 'accessing - structure variables' }
SDL3GPUDepthStencilTargetInfo >> clearStencil: anObject [
	"This method was automatically generated"
	handle unsignedByteAt: OFFSET_CLEAR_STENCIL put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUDepthStencilTargetInfo >> cycle [
	"This method was automatically generated"
	^handle booleanAt: OFFSET_CYCLE
]

{ #category : 'accessing - structure variables' }
SDL3GPUDepthStencilTargetInfo >> cycle: anObject [
	"This method was automatically generated"
	handle booleanAt: OFFSET_CYCLE put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUDepthStencilTargetInfo >> loadOp [
	"This method was automatically generated"
	^SDL3GPULoadOp fromInteger: (handle unsignedLongAt: OFFSET_LOAD_OP)
]

{ #category : 'accessing - structure variables' }
SDL3GPUDepthStencilTargetInfo >> loadOp: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_LOAD_OP put: anObject value
]

{ #category : 'accessing - structure variables' }
SDL3GPUDepthStencilTargetInfo >> padding1 [
	"This method was automatically generated"
	^handle unsignedByteAt: OFFSET_PADDING1
]

{ #category : 'accessing - structure variables' }
SDL3GPUDepthStencilTargetInfo >> padding1: anObject [
	"This method was automatically generated"
	handle unsignedByteAt: OFFSET_PADDING1 put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUDepthStencilTargetInfo >> padding2 [
	"This method was automatically generated"
	^handle unsignedByteAt: OFFSET_PADDING2
]

{ #category : 'accessing - structure variables' }
SDL3GPUDepthStencilTargetInfo >> padding2: anObject [
	"This method was automatically generated"
	handle unsignedByteAt: OFFSET_PADDING2 put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUDepthStencilTargetInfo >> stencilLoadOp [
	"This method was automatically generated"
	^SDL3GPULoadOp fromInteger: (handle unsignedLongAt: OFFSET_STENCIL_LOAD_OP)
]

{ #category : 'accessing - structure variables' }
SDL3GPUDepthStencilTargetInfo >> stencilLoadOp: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_STENCIL_LOAD_OP put: anObject value
]

{ #category : 'accessing - structure variables' }
SDL3GPUDepthStencilTargetInfo >> stencilStoreOp [
	"This method was automatically generated"
	^SDL3GPUStoreOp fromInteger: (handle unsignedLongAt: OFFSET_STENCIL_STORE_OP)
]

{ #category : 'accessing - structure variables' }
SDL3GPUDepthStencilTargetInfo >> stencilStoreOp: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_STENCIL_STORE_OP put: anObject value
]

{ #category : 'accessing - structure variables' }
SDL3GPUDepthStencilTargetInfo >> storeOp [
	"This method was automatically generated"
	^SDL3GPUStoreOp fromInteger: (handle unsignedLongAt: OFFSET_STORE_OP)
]

{ #category : 'accessing - structure variables' }
SDL3GPUDepthStencilTargetInfo >> storeOp: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_STORE_OP put: anObject value
]

{ #category : 'accessing - structure variables' }
SDL3GPUDepthStencilTargetInfo >> texture [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_TEXTURE) type: ExternalType void asPointerType
]

{ #category : 'accessing - structure variables' }
SDL3GPUDepthStencilTargetInfo >> texture: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_TEXTURE put: anObject getHandle.
]
