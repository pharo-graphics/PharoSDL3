Class {
	#name : 'S3SDL_GPUBlitInfo',
	#superclass : 'S3Structure',
	#classVars : [
		'OFFSET_CLEAR_COLOR',
		'OFFSET_CYCLE',
		'OFFSET_DESTINATION',
		'OFFSET_FILTER',
		'OFFSET_FLIP_MODE',
		'OFFSET_LOAD_OP',
		'OFFSET_PADDING1',
		'OFFSET_PADDING2',
		'OFFSET_PADDING3',
		'OFFSET_SOURCE'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'field definition' }
S3SDL_GPUBlitInfo class >> fieldsDesc [

	^ #(
	SDL_GPUBlitRegion source;
	SDL_GPUBlitRegion destination;
	SDL_GPULoadOp load_op;
	SDL_FColor clear_color;
	SDL_FlipMode flip_mode;
	SDL_GPUFilter filter;
	bool cycle;
	Uint8 padding1;
	Uint8 padding2;
	Uint8 padding3
	)
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUBlitInfo >> clear_color [
	"This method was automatically generated"
	^ S3SDL_FColor fromHandle: (handle referenceStructAt: OFFSET_CLEAR_COLOR length: S3SDL_FColor byteSize)
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUBlitInfo >> clear_color: anObject [
	"This method was automatically generated"
	handle structAt: OFFSET_CLEAR_COLOR put: anObject getHandle length: S3SDL_FColor byteSize
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUBlitInfo >> cycle [
	"This method was automatically generated"
	^handle booleanAt: OFFSET_CYCLE
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUBlitInfo >> cycle: anObject [
	"This method was automatically generated"
	handle booleanAt: OFFSET_CYCLE put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUBlitInfo >> destination [
	"This method was automatically generated"
	^ S3SDL_GPUBlitRegion fromHandle: (handle referenceStructAt: OFFSET_DESTINATION length: S3SDL_GPUBlitRegion byteSize)
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUBlitInfo >> destination: anObject [
	"This method was automatically generated"
	handle structAt: OFFSET_DESTINATION put: anObject getHandle length: S3SDL_GPUBlitRegion byteSize
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUBlitInfo >> filter [
	"This method was automatically generated"
	^S3SDL_GPUFilter fromInteger: (handle unsignedLongAt: OFFSET_FILTER)
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUBlitInfo >> filter: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_FILTER put: anObject value
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUBlitInfo >> flip_mode [
	"This method was automatically generated"
	^S3SDL_FlipMode fromInteger: (handle unsignedLongAt: OFFSET_FLIP_MODE)
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUBlitInfo >> flip_mode: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_FLIP_MODE put: anObject value
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUBlitInfo >> load_op [
	"This method was automatically generated"
	^S3SDL_GPULoadOp fromInteger: (handle unsignedLongAt: OFFSET_LOAD_OP)
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUBlitInfo >> load_op: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_LOAD_OP put: anObject value
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUBlitInfo >> padding1 [
	"This method was automatically generated"
	^handle unsignedByteAt: OFFSET_PADDING1
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUBlitInfo >> padding1: anObject [
	"This method was automatically generated"
	handle unsignedByteAt: OFFSET_PADDING1 put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUBlitInfo >> padding2 [
	"This method was automatically generated"
	^handle unsignedByteAt: OFFSET_PADDING2
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUBlitInfo >> padding2: anObject [
	"This method was automatically generated"
	handle unsignedByteAt: OFFSET_PADDING2 put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUBlitInfo >> padding3 [
	"This method was automatically generated"
	^handle unsignedByteAt: OFFSET_PADDING3
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUBlitInfo >> padding3: anObject [
	"This method was automatically generated"
	handle unsignedByteAt: OFFSET_PADDING3 put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUBlitInfo >> source [
	"This method was automatically generated"
	^ S3SDL_GPUBlitRegion fromHandle: (handle referenceStructAt: OFFSET_SOURCE length: S3SDL_GPUBlitRegion byteSize)
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUBlitInfo >> source: anObject [
	"This method was automatically generated"
	handle structAt: OFFSET_SOURCE put: anObject getHandle length: S3SDL_GPUBlitRegion byteSize
]
