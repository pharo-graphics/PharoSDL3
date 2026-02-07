Class {
	#name : 'SDL3GPUBlitInfo',
	#superclass : 'SDL3Structure',
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
SDL3GPUBlitInfo class >> fieldsDesc [

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
SDL3GPUBlitInfo >> clearColor [
	"This method was automatically generated"
	^ SDL3FColor fromHandle: (handle referenceStructAt: OFFSET_CLEAR_COLOR length: SDL3FColor byteSize)
]

{ #category : 'accessing - structure variables' }
SDL3GPUBlitInfo >> clearColor: anObject [
	"This method was automatically generated"
	handle structAt: OFFSET_CLEAR_COLOR put: anObject getHandle length: SDL3FColor byteSize
]

{ #category : 'accessing - structure variables' }
SDL3GPUBlitInfo >> cycle [
	"This method was automatically generated"
	^handle booleanAt: OFFSET_CYCLE
]

{ #category : 'accessing - structure variables' }
SDL3GPUBlitInfo >> cycle: anObject [
	"This method was automatically generated"
	handle booleanAt: OFFSET_CYCLE put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUBlitInfo >> destination [
	"This method was automatically generated"
	^ SDL3GPUBlitRegion fromHandle: (handle referenceStructAt: OFFSET_DESTINATION length: SDL3GPUBlitRegion byteSize)
]

{ #category : 'accessing - structure variables' }
SDL3GPUBlitInfo >> destination: anObject [
	"This method was automatically generated"
	handle structAt: OFFSET_DESTINATION put: anObject getHandle length: SDL3GPUBlitRegion byteSize
]

{ #category : 'accessing - structure variables' }
SDL3GPUBlitInfo >> filter [
	"This method was automatically generated"
	^SDL3GPUFilter fromInteger: (handle unsignedLongAt: OFFSET_FILTER)
]

{ #category : 'accessing - structure variables' }
SDL3GPUBlitInfo >> filter: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_FILTER put: anObject value
]

{ #category : 'accessing - structure variables' }
SDL3GPUBlitInfo >> flipMode [
	"This method was automatically generated"
	^SDL3FlipMode fromInteger: (handle unsignedLongAt: OFFSET_FLIP_MODE)
]

{ #category : 'accessing - structure variables' }
SDL3GPUBlitInfo >> flipMode: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_FLIP_MODE put: anObject value
]

{ #category : 'accessing - structure variables' }
SDL3GPUBlitInfo >> loadOp [
	"This method was automatically generated"
	^SDL3GPULoadOp fromInteger: (handle unsignedLongAt: OFFSET_LOAD_OP)
]

{ #category : 'accessing - structure variables' }
SDL3GPUBlitInfo >> loadOp: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_LOAD_OP put: anObject value
]

{ #category : 'accessing - structure variables' }
SDL3GPUBlitInfo >> source [
	"This method was automatically generated"
	^ SDL3GPUBlitRegion fromHandle: (handle referenceStructAt: OFFSET_SOURCE length: SDL3GPUBlitRegion byteSize)
]

{ #category : 'accessing - structure variables' }
SDL3GPUBlitInfo >> source: anObject [
	"This method was automatically generated"
	handle structAt: OFFSET_SOURCE put: anObject getHandle length: SDL3GPUBlitRegion byteSize
]
