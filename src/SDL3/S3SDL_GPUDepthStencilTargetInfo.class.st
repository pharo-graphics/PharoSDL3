Class {
	#name : 'S3SDL_GPUDepthStencilTargetInfo',
	#superclass : 'S3Structure',
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
S3SDL_GPUDepthStencilTargetInfo class >> fieldsDesc [

	^ #(
	SDL_GPUTexture* texture;
	float clear_depth;
	SDL_GPULoadOp load_op;
	SDL_GPUStoreOp store_op;
	SDL_GPULoadOp stencil_load_op;
	SDL_GPUStoreOp stencil_store_op;
	int cycle;
	int clear_stencil;
	int padding1;
	int padding2
	)
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUDepthStencilTargetInfo >> clear_depth [
	"This method was automatically generated"
	^handle floatAt: OFFSET_CLEAR_DEPTH
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUDepthStencilTargetInfo >> clear_depth: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_CLEAR_DEPTH put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUDepthStencilTargetInfo >> clear_stencil [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_CLEAR_STENCIL
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUDepthStencilTargetInfo >> clear_stencil: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_CLEAR_STENCIL put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUDepthStencilTargetInfo >> cycle [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_CYCLE
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUDepthStencilTargetInfo >> cycle: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_CYCLE put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUDepthStencilTargetInfo >> load_op [
	"This method was automatically generated"
	^S3SDL_GPULoadOp fromInteger: (handle unsignedLongAt: OFFSET_LOAD_OP)
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUDepthStencilTargetInfo >> load_op: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_LOAD_OP put: anObject value
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUDepthStencilTargetInfo >> padding1 [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_PADDING1
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUDepthStencilTargetInfo >> padding1: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_PADDING1 put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUDepthStencilTargetInfo >> padding2 [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_PADDING2
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUDepthStencilTargetInfo >> padding2: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_PADDING2 put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUDepthStencilTargetInfo >> stencil_load_op [
	"This method was automatically generated"
	^S3SDL_GPULoadOp fromInteger: (handle unsignedLongAt: OFFSET_STENCIL_LOAD_OP)
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUDepthStencilTargetInfo >> stencil_load_op: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_STENCIL_LOAD_OP put: anObject value
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUDepthStencilTargetInfo >> stencil_store_op [
	"This method was automatically generated"
	^S3SDL_GPUStoreOp fromInteger: (handle unsignedLongAt: OFFSET_STENCIL_STORE_OP)
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUDepthStencilTargetInfo >> stencil_store_op: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_STENCIL_STORE_OP put: anObject value
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUDepthStencilTargetInfo >> store_op [
	"This method was automatically generated"
	^S3SDL_GPUStoreOp fromInteger: (handle unsignedLongAt: OFFSET_STORE_OP)
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUDepthStencilTargetInfo >> store_op: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_STORE_OP put: anObject value
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUDepthStencilTargetInfo >> texture [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_TEXTURE) type: ExternalType void asPointerType
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUDepthStencilTargetInfo >> texture: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_TEXTURE put: anObject getHandle.
]
