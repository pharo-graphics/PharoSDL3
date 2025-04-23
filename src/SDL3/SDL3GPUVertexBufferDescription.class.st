Class {
	#name : 'SDL3GPUVertexBufferDescription',
	#superclass : 'SDL3Structure',
	#classVars : [
		'OFFSET_INPUT_RATE',
		'OFFSET_INSTANCE_STEP_RATE',
		'OFFSET_PITCH',
		'OFFSET_SLOT'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'field definition' }
SDL3GPUVertexBufferDescription class >> fieldsDesc [

	^ #(
	Uint32 slot;
	Uint32 pitch;
	SDL_GPUVertexInputRate input_rate;
	Uint32 instance_step_rate
	)
]

{ #category : 'accessing - structure variables' }
SDL3GPUVertexBufferDescription >> inputRate [
	"This method was automatically generated"
	^SDL3GPUVertexInputRate fromInteger: (handle unsignedLongAt: OFFSET_INPUT_RATE)
]

{ #category : 'accessing - structure variables' }
SDL3GPUVertexBufferDescription >> inputRate: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_INPUT_RATE put: anObject value
]

{ #category : 'accessing - structure variables' }
SDL3GPUVertexBufferDescription >> instanceStepRate [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_INSTANCE_STEP_RATE
]

{ #category : 'accessing - structure variables' }
SDL3GPUVertexBufferDescription >> instanceStepRate: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_INSTANCE_STEP_RATE put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUVertexBufferDescription >> pitch [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_PITCH
]

{ #category : 'accessing - structure variables' }
SDL3GPUVertexBufferDescription >> pitch: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_PITCH put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUVertexBufferDescription >> slot [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_SLOT
]

{ #category : 'accessing - structure variables' }
SDL3GPUVertexBufferDescription >> slot: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_SLOT put: anObject
]
