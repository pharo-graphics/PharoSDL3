Class {
	#name : 'S3SDL_GPUColorTargetBlendState',
	#superclass : 'S3Structure',
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
S3SDL_GPUColorTargetBlendState class >> fieldsDesc [

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
S3SDL_GPUColorTargetBlendState >> alpha_blend_op [
	"This method was automatically generated"
	^S3SDL_GPUBlendOp fromInteger: (handle unsignedLongAt: OFFSET_ALPHA_BLEND_OP)
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUColorTargetBlendState >> alpha_blend_op: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_ALPHA_BLEND_OP put: anObject value
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUColorTargetBlendState >> color_blend_op [
	"This method was automatically generated"
	^S3SDL_GPUBlendOp fromInteger: (handle unsignedLongAt: OFFSET_COLOR_BLEND_OP)
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUColorTargetBlendState >> color_blend_op: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_COLOR_BLEND_OP put: anObject value
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUColorTargetBlendState >> color_write_mask [
	"This method was automatically generated"
	^handle unsignedByteAt: OFFSET_COLOR_WRITE_MASK
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUColorTargetBlendState >> color_write_mask: anObject [
	"This method was automatically generated"
	handle unsignedByteAt: OFFSET_COLOR_WRITE_MASK put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUColorTargetBlendState >> dst_alpha_blendfactor [
	"This method was automatically generated"
	^S3SDL_GPUBlendFactor fromInteger: (handle unsignedLongAt: OFFSET_DST_ALPHA_BLENDFACTOR)
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUColorTargetBlendState >> dst_alpha_blendfactor: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_DST_ALPHA_BLENDFACTOR put: anObject value
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUColorTargetBlendState >> dst_color_blendfactor [
	"This method was automatically generated"
	^S3SDL_GPUBlendFactor fromInteger: (handle unsignedLongAt: OFFSET_DST_COLOR_BLENDFACTOR)
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUColorTargetBlendState >> dst_color_blendfactor: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_DST_COLOR_BLENDFACTOR put: anObject value
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUColorTargetBlendState >> enable_blend [
	"This method was automatically generated"
	^handle booleanAt: OFFSET_ENABLE_BLEND
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUColorTargetBlendState >> enable_blend: anObject [
	"This method was automatically generated"
	handle booleanAt: OFFSET_ENABLE_BLEND put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUColorTargetBlendState >> enable_color_write_mask [
	"This method was automatically generated"
	^handle booleanAt: OFFSET_ENABLE_COLOR_WRITE_MASK
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUColorTargetBlendState >> enable_color_write_mask: anObject [
	"This method was automatically generated"
	handle booleanAt: OFFSET_ENABLE_COLOR_WRITE_MASK put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUColorTargetBlendState >> padding1 [
	"This method was automatically generated"
	^handle unsignedByteAt: OFFSET_PADDING1
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUColorTargetBlendState >> padding1: anObject [
	"This method was automatically generated"
	handle unsignedByteAt: OFFSET_PADDING1 put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUColorTargetBlendState >> padding2 [
	"This method was automatically generated"
	^handle unsignedByteAt: OFFSET_PADDING2
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUColorTargetBlendState >> padding2: anObject [
	"This method was automatically generated"
	handle unsignedByteAt: OFFSET_PADDING2 put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUColorTargetBlendState >> src_alpha_blendfactor [
	"This method was automatically generated"
	^S3SDL_GPUBlendFactor fromInteger: (handle unsignedLongAt: OFFSET_SRC_ALPHA_BLENDFACTOR)
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUColorTargetBlendState >> src_alpha_blendfactor: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_SRC_ALPHA_BLENDFACTOR put: anObject value
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUColorTargetBlendState >> src_color_blendfactor [
	"This method was automatically generated"
	^S3SDL_GPUBlendFactor fromInteger: (handle unsignedLongAt: OFFSET_SRC_COLOR_BLENDFACTOR)
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUColorTargetBlendState >> src_color_blendfactor: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_SRC_COLOR_BLENDFACTOR put: anObject value
]
