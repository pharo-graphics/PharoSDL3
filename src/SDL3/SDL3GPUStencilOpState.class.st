Class {
	#name : 'SDL3GPUStencilOpState',
	#superclass : 'SDL3Structure',
	#classVars : [
		'OFFSET_COMPARE_OP',
		'OFFSET_DEPTH_FAIL_OP',
		'OFFSET_FAIL_OP',
		'OFFSET_PASS_OP'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'field definition' }
SDL3GPUStencilOpState class >> fieldsDesc [

	^ #(
	SDL_GPUStencilOp fail_op;
	SDL_GPUStencilOp pass_op;
	SDL_GPUStencilOp depth_fail_op;
	SDL_GPUCompareOp compare_op
	)
]

{ #category : 'accessing - structure variables' }
SDL3GPUStencilOpState >> compareOp [
	"This method was automatically generated"
	^SDL3GPUCompareOp fromInteger: (handle unsignedLongAt: OFFSET_COMPARE_OP)
]

{ #category : 'accessing - structure variables' }
SDL3GPUStencilOpState >> compareOp: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_COMPARE_OP put: anObject value
]

{ #category : 'accessing - structure variables' }
SDL3GPUStencilOpState >> depthFailOp [
	"This method was automatically generated"
	^SDL3GPUStencilOp fromInteger: (handle unsignedLongAt: OFFSET_DEPTH_FAIL_OP)
]

{ #category : 'accessing - structure variables' }
SDL3GPUStencilOpState >> depthFailOp: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_DEPTH_FAIL_OP put: anObject value
]

{ #category : 'accessing - structure variables' }
SDL3GPUStencilOpState >> failOp [
	"This method was automatically generated"
	^SDL3GPUStencilOp fromInteger: (handle unsignedLongAt: OFFSET_FAIL_OP)
]

{ #category : 'accessing - structure variables' }
SDL3GPUStencilOpState >> failOp: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_FAIL_OP put: anObject value
]

{ #category : 'accessing - structure variables' }
SDL3GPUStencilOpState >> passOp [
	"This method was automatically generated"
	^SDL3GPUStencilOp fromInteger: (handle unsignedLongAt: OFFSET_PASS_OP)
]

{ #category : 'accessing - structure variables' }
SDL3GPUStencilOpState >> passOp: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_PASS_OP put: anObject value
]
