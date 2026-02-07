Class {
	#name : 'SDL3GPUColorTargetBlendState',
	#superclass : 'SDL3Structure',
	#classVars : [
		'OFFSET_ALPHA_BLEND_OP',
		'OFFSET_COLOR_BLEND_OP',
		'OFFSET_COLOR_WRITE_MASK',
		'OFFSET_DST_ALPHA_BLENDFACTOR',
		'OFFSET_DST_COLOR_BLENDFACTOR',
		'OFFSET_ENABLE_BLEND',
		'OFFSET_ENABLE_COLOR_WRITE_MASK',
		'OFFSET_PADDING1',
		'OFFSET_PADDING2',
		'OFFSET_SRC_ALPHA_BLENDFACTOR',
		'OFFSET_SRC_COLOR_BLENDFACTOR'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'field definition' }
SDL3GPUColorTargetBlendState class >> fieldsDesc [

	^ #(
	SDL_GPUBlendFactor src_color_blendfactor;
	SDL_GPUBlendFactor dst_color_blendfactor;
	SDL_GPUBlendOp color_blend_op;
	SDL_GPUBlendFactor src_alpha_blendfactor;
	SDL_GPUBlendFactor dst_alpha_blendfactor;
	SDL_GPUBlendOp alpha_blend_op;
	SDL_GPUColorComponentFlags color_write_mask;
	bool enable_blend;
	bool enable_color_write_mask;
	Uint8 padding1;
	Uint8 padding2
	)
]

{ #category : 'accessing - structure variables' }
SDL3GPUColorTargetBlendState >> alphaBlendOp [
	"This method was automatically generated"
	^SDL3GPUBlendOp fromInteger: (handle unsignedLongAt: OFFSET_ALPHA_BLEND_OP)
]

{ #category : 'accessing - structure variables' }
SDL3GPUColorTargetBlendState >> alphaBlendOp: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_ALPHA_BLEND_OP put: anObject value
]

{ #category : 'accessing - structure variables' }
SDL3GPUColorTargetBlendState >> colorBlendOp [
	"This method was automatically generated"
	^SDL3GPUBlendOp fromInteger: (handle unsignedLongAt: OFFSET_COLOR_BLEND_OP)
]

{ #category : 'accessing - structure variables' }
SDL3GPUColorTargetBlendState >> colorBlendOp: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_COLOR_BLEND_OP put: anObject value
]

{ #category : 'accessing - structure variables' }
SDL3GPUColorTargetBlendState >> colorWriteMask [
	"This method was automatically generated"
	^handle unsignedByteAt: OFFSET_COLOR_WRITE_MASK
]

{ #category : 'accessing - structure variables' }
SDL3GPUColorTargetBlendState >> colorWriteMask: anObject [
	"This method was automatically generated"
	handle unsignedByteAt: OFFSET_COLOR_WRITE_MASK put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUColorTargetBlendState >> dstAlphaBlendfactor [
	"This method was automatically generated"
	^SDL3GPUBlendFactor fromInteger: (handle unsignedLongAt: OFFSET_DST_ALPHA_BLENDFACTOR)
]

{ #category : 'accessing - structure variables' }
SDL3GPUColorTargetBlendState >> dstAlphaBlendfactor: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_DST_ALPHA_BLENDFACTOR put: anObject value
]

{ #category : 'accessing - structure variables' }
SDL3GPUColorTargetBlendState >> dstColorBlendfactor [
	"This method was automatically generated"
	^SDL3GPUBlendFactor fromInteger: (handle unsignedLongAt: OFFSET_DST_COLOR_BLENDFACTOR)
]

{ #category : 'accessing - structure variables' }
SDL3GPUColorTargetBlendState >> dstColorBlendfactor: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_DST_COLOR_BLENDFACTOR put: anObject value
]

{ #category : 'accessing - structure variables' }
SDL3GPUColorTargetBlendState >> enableBlend [
	"This method was automatically generated"
	^handle booleanAt: OFFSET_ENABLE_BLEND
]

{ #category : 'accessing - structure variables' }
SDL3GPUColorTargetBlendState >> enableBlend: anObject [
	"This method was automatically generated"
	handle booleanAt: OFFSET_ENABLE_BLEND put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUColorTargetBlendState >> enableColorWriteMask [
	"This method was automatically generated"
	^handle booleanAt: OFFSET_ENABLE_COLOR_WRITE_MASK
]

{ #category : 'accessing - structure variables' }
SDL3GPUColorTargetBlendState >> enableColorWriteMask: anObject [
	"This method was automatically generated"
	handle booleanAt: OFFSET_ENABLE_COLOR_WRITE_MASK put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUColorTargetBlendState >> srcAlphaBlendfactor [
	"This method was automatically generated"
	^SDL3GPUBlendFactor fromInteger: (handle unsignedLongAt: OFFSET_SRC_ALPHA_BLENDFACTOR)
]

{ #category : 'accessing - structure variables' }
SDL3GPUColorTargetBlendState >> srcAlphaBlendfactor: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_SRC_ALPHA_BLENDFACTOR put: anObject value
]

{ #category : 'accessing - structure variables' }
SDL3GPUColorTargetBlendState >> srcColorBlendfactor [
	"This method was automatically generated"
	^SDL3GPUBlendFactor fromInteger: (handle unsignedLongAt: OFFSET_SRC_COLOR_BLENDFACTOR)
]

{ #category : 'accessing - structure variables' }
SDL3GPUColorTargetBlendState >> srcColorBlendfactor: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_SRC_COLOR_BLENDFACTOR put: anObject value
]
