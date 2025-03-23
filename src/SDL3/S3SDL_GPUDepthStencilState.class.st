Class {
	#name : 'S3SDL_GPUDepthStencilState',
	#superclass : 'S3Structure',
	#classVars : [
		'OFFSET_BACK_STENCIL_STATE',
		'OFFSET_COMPARE_MASK',
		'OFFSET_COMPARE_OP',
		'OFFSET_ENABLE_DEPTH_TEST',
		'OFFSET_ENABLE_DEPTH_WRITE',
		'OFFSET_ENABLE_STENCIL_TEST',
		'OFFSET_FRONT_STENCIL_STATE',
		'OFFSET_PADDING1',
		'OFFSET_PADDING2',
		'OFFSET_PADDING3',
		'OFFSET_WRITE_MASK'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'field definition' }
S3SDL_GPUDepthStencilState class >> fieldsDesc [

	^ #(
	SDL_GPUCompareOp compare_op;
	SDL_GPUStencilOpState back_stencil_state;
	SDL_GPUStencilOpState front_stencil_state;
	Uint8 compare_mask;
	Uint8 write_mask;
	bool enable_depth_test;
	bool enable_depth_write;
	bool enable_stencil_test;
	Uint8 padding1;
	Uint8 padding2;
	Uint8 padding3
	)
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUDepthStencilState >> back_stencil_state [
	"This method was automatically generated"
	^ S3SDL_GPUStencilOpState fromHandle: (handle referenceStructAt: OFFSET_BACK_STENCIL_STATE length: S3SDL_GPUStencilOpState byteSize)
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUDepthStencilState >> back_stencil_state: anObject [
	"This method was automatically generated"
	handle structAt: OFFSET_BACK_STENCIL_STATE put: anObject getHandle length: S3SDL_GPUStencilOpState byteSize
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUDepthStencilState >> compare_mask [
	"This method was automatically generated"
	^handle unsignedByteAt: OFFSET_COMPARE_MASK
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUDepthStencilState >> compare_mask: anObject [
	"This method was automatically generated"
	handle unsignedByteAt: OFFSET_COMPARE_MASK put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUDepthStencilState >> compare_op [
	"This method was automatically generated"
	^S3SDL_GPUCompareOp fromInteger: (handle unsignedLongAt: OFFSET_COMPARE_OP)
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUDepthStencilState >> compare_op: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_COMPARE_OP put: anObject value
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUDepthStencilState >> enable_depth_test [
	"This method was automatically generated"
	^handle booleanAt: OFFSET_ENABLE_DEPTH_TEST
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUDepthStencilState >> enable_depth_test: anObject [
	"This method was automatically generated"
	handle booleanAt: OFFSET_ENABLE_DEPTH_TEST put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUDepthStencilState >> enable_depth_write [
	"This method was automatically generated"
	^handle booleanAt: OFFSET_ENABLE_DEPTH_WRITE
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUDepthStencilState >> enable_depth_write: anObject [
	"This method was automatically generated"
	handle booleanAt: OFFSET_ENABLE_DEPTH_WRITE put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUDepthStencilState >> enable_stencil_test [
	"This method was automatically generated"
	^handle booleanAt: OFFSET_ENABLE_STENCIL_TEST
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUDepthStencilState >> enable_stencil_test: anObject [
	"This method was automatically generated"
	handle booleanAt: OFFSET_ENABLE_STENCIL_TEST put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUDepthStencilState >> front_stencil_state [
	"This method was automatically generated"
	^ S3SDL_GPUStencilOpState fromHandle: (handle referenceStructAt: OFFSET_FRONT_STENCIL_STATE length: S3SDL_GPUStencilOpState byteSize)
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUDepthStencilState >> front_stencil_state: anObject [
	"This method was automatically generated"
	handle structAt: OFFSET_FRONT_STENCIL_STATE put: anObject getHandle length: S3SDL_GPUStencilOpState byteSize
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUDepthStencilState >> padding1 [
	"This method was automatically generated"
	^handle unsignedByteAt: OFFSET_PADDING1
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUDepthStencilState >> padding1: anObject [
	"This method was automatically generated"
	handle unsignedByteAt: OFFSET_PADDING1 put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUDepthStencilState >> padding2 [
	"This method was automatically generated"
	^handle unsignedByteAt: OFFSET_PADDING2
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUDepthStencilState >> padding2: anObject [
	"This method was automatically generated"
	handle unsignedByteAt: OFFSET_PADDING2 put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUDepthStencilState >> padding3 [
	"This method was automatically generated"
	^handle unsignedByteAt: OFFSET_PADDING3
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUDepthStencilState >> padding3: anObject [
	"This method was automatically generated"
	handle unsignedByteAt: OFFSET_PADDING3 put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUDepthStencilState >> write_mask [
	"This method was automatically generated"
	^handle unsignedByteAt: OFFSET_WRITE_MASK
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUDepthStencilState >> write_mask: anObject [
	"This method was automatically generated"
	handle unsignedByteAt: OFFSET_WRITE_MASK put: anObject
]
