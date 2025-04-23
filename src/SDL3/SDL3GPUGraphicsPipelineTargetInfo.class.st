Class {
	#name : 'SDL3GPUGraphicsPipelineTargetInfo',
	#superclass : 'S3Structure',
	#classVars : [
		'OFFSET_COLOR_TARGET_DESCRIPTIONS',
		'OFFSET_DEPTH_STENCIL_FORMAT',
		'OFFSET_HAS_DEPTH_STENCIL_TARGET',
		'OFFSET_NUM_COLOR_TARGETS',
		'OFFSET_PADDING1',
		'OFFSET_PADDING2',
		'OFFSET_PADDING3'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'field definition' }
SDL3GPUGraphicsPipelineTargetInfo class >> fieldsDesc [

	^ #(
	SDL_GPUColorTargetDescription* color_target_descriptions;
	Uint32 num_color_targets;
	SDL_GPUTextureFormat depth_stencil_format;
	bool has_depth_stencil_target;
	Uint8 padding1;
	Uint8 padding2;
	Uint8 padding3
	)
]

{ #category : 'accessing - structure variables' }
SDL3GPUGraphicsPipelineTargetInfo >> color_target_descriptions [
	"This method was automatically generated"
	^SDL3GPUColorTargetDescription fromHandle: (handle pointerAt: OFFSET_COLOR_TARGET_DESCRIPTIONS)
]

{ #category : 'accessing - structure variables' }
SDL3GPUGraphicsPipelineTargetInfo >> color_target_descriptions: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_COLOR_TARGET_DESCRIPTIONS put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
SDL3GPUGraphicsPipelineTargetInfo >> depth_stencil_format [
	"This method was automatically generated"
	^SDL3GPUTextureFormat fromInteger: (handle unsignedLongAt: OFFSET_DEPTH_STENCIL_FORMAT)
]

{ #category : 'accessing - structure variables' }
SDL3GPUGraphicsPipelineTargetInfo >> depth_stencil_format: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_DEPTH_STENCIL_FORMAT put: anObject value
]

{ #category : 'accessing - structure variables' }
SDL3GPUGraphicsPipelineTargetInfo >> has_depth_stencil_target [
	"This method was automatically generated"
	^handle booleanAt: OFFSET_HAS_DEPTH_STENCIL_TARGET
]

{ #category : 'accessing - structure variables' }
SDL3GPUGraphicsPipelineTargetInfo >> has_depth_stencil_target: anObject [
	"This method was automatically generated"
	handle booleanAt: OFFSET_HAS_DEPTH_STENCIL_TARGET put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUGraphicsPipelineTargetInfo >> num_color_targets [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_NUM_COLOR_TARGETS
]

{ #category : 'accessing - structure variables' }
SDL3GPUGraphicsPipelineTargetInfo >> num_color_targets: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_NUM_COLOR_TARGETS put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUGraphicsPipelineTargetInfo >> padding1 [
	"This method was automatically generated"
	^handle unsignedByteAt: OFFSET_PADDING1
]

{ #category : 'accessing - structure variables' }
SDL3GPUGraphicsPipelineTargetInfo >> padding1: anObject [
	"This method was automatically generated"
	handle unsignedByteAt: OFFSET_PADDING1 put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUGraphicsPipelineTargetInfo >> padding2 [
	"This method was automatically generated"
	^handle unsignedByteAt: OFFSET_PADDING2
]

{ #category : 'accessing - structure variables' }
SDL3GPUGraphicsPipelineTargetInfo >> padding2: anObject [
	"This method was automatically generated"
	handle unsignedByteAt: OFFSET_PADDING2 put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUGraphicsPipelineTargetInfo >> padding3 [
	"This method was automatically generated"
	^handle unsignedByteAt: OFFSET_PADDING3
]

{ #category : 'accessing - structure variables' }
SDL3GPUGraphicsPipelineTargetInfo >> padding3: anObject [
	"This method was automatically generated"
	handle unsignedByteAt: OFFSET_PADDING3 put: anObject
]
