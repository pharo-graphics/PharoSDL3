Class {
	#name : 'SDL3GPUDepthStencilState',
	#superclass : 'SDL3Structure',
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
SDL3GPUDepthStencilState class >> fieldsDesc [

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
SDL3GPUDepthStencilState >> backStencilState [
	"This method was automatically generated"
	^ SDL3GPUStencilOpState fromHandle: (handle referenceStructAt: OFFSET_BACK_STENCIL_STATE length: SDL3GPUStencilOpState byteSize)
]

{ #category : 'accessing - structure variables' }
SDL3GPUDepthStencilState >> backStencilState: anObject [
	"This method was automatically generated"
	handle structAt: OFFSET_BACK_STENCIL_STATE put: anObject getHandle length: SDL3GPUStencilOpState byteSize
]

{ #category : 'accessing - structure variables' }
SDL3GPUDepthStencilState >> compareMask [
	"This method was automatically generated"
	^handle unsignedByteAt: OFFSET_COMPARE_MASK
]

{ #category : 'accessing - structure variables' }
SDL3GPUDepthStencilState >> compareMask: anObject [
	"This method was automatically generated"
	handle unsignedByteAt: OFFSET_COMPARE_MASK put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUDepthStencilState >> compareOp [
	"This method was automatically generated"
	^SDL3GPUCompareOp fromInteger: (handle unsignedLongAt: OFFSET_COMPARE_OP)
]

{ #category : 'accessing - structure variables' }
SDL3GPUDepthStencilState >> compareOp: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_COMPARE_OP put: anObject value
]

{ #category : 'accessing - structure variables' }
SDL3GPUDepthStencilState >> enableDepthTest [
	"This method was automatically generated"
	^handle booleanAt: OFFSET_ENABLE_DEPTH_TEST
]

{ #category : 'accessing - structure variables' }
SDL3GPUDepthStencilState >> enableDepthTest: anObject [
	"This method was automatically generated"
	handle booleanAt: OFFSET_ENABLE_DEPTH_TEST put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUDepthStencilState >> enableDepthWrite [
	"This method was automatically generated"
	^handle booleanAt: OFFSET_ENABLE_DEPTH_WRITE
]

{ #category : 'accessing - structure variables' }
SDL3GPUDepthStencilState >> enableDepthWrite: anObject [
	"This method was automatically generated"
	handle booleanAt: OFFSET_ENABLE_DEPTH_WRITE put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUDepthStencilState >> enableStencilTest [
	"This method was automatically generated"
	^handle booleanAt: OFFSET_ENABLE_STENCIL_TEST
]

{ #category : 'accessing - structure variables' }
SDL3GPUDepthStencilState >> enableStencilTest: anObject [
	"This method was automatically generated"
	handle booleanAt: OFFSET_ENABLE_STENCIL_TEST put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUDepthStencilState >> frontStencilState [
	"This method was automatically generated"
	^ SDL3GPUStencilOpState fromHandle: (handle referenceStructAt: OFFSET_FRONT_STENCIL_STATE length: SDL3GPUStencilOpState byteSize)
]

{ #category : 'accessing - structure variables' }
SDL3GPUDepthStencilState >> frontStencilState: anObject [
	"This method was automatically generated"
	handle structAt: OFFSET_FRONT_STENCIL_STATE put: anObject getHandle length: SDL3GPUStencilOpState byteSize
]

{ #category : 'accessing - structure variables' }
SDL3GPUDepthStencilState >> padding1 [
	"This method was automatically generated"
	^handle unsignedByteAt: OFFSET_PADDING1
]

{ #category : 'accessing - structure variables' }
SDL3GPUDepthStencilState >> padding1: anObject [
	"This method was automatically generated"
	handle unsignedByteAt: OFFSET_PADDING1 put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUDepthStencilState >> padding2 [
	"This method was automatically generated"
	^handle unsignedByteAt: OFFSET_PADDING2
]

{ #category : 'accessing - structure variables' }
SDL3GPUDepthStencilState >> padding2: anObject [
	"This method was automatically generated"
	handle unsignedByteAt: OFFSET_PADDING2 put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUDepthStencilState >> padding3 [
	"This method was automatically generated"
	^handle unsignedByteAt: OFFSET_PADDING3
]

{ #category : 'accessing - structure variables' }
SDL3GPUDepthStencilState >> padding3: anObject [
	"This method was automatically generated"
	handle unsignedByteAt: OFFSET_PADDING3 put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUDepthStencilState >> writeMask [
	"This method was automatically generated"
	^handle unsignedByteAt: OFFSET_WRITE_MASK
]

{ #category : 'accessing - structure variables' }
SDL3GPUDepthStencilState >> writeMask: anObject [
	"This method was automatically generated"
	handle unsignedByteAt: OFFSET_WRITE_MASK put: anObject
]
