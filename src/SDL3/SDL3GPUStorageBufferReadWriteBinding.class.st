Class {
	#name : 'SDL3GPUStorageBufferReadWriteBinding',
	#superclass : 'SDL3Structure',
	#classVars : [
		'OFFSET_BUFFER',
		'OFFSET_CYCLE',
		'OFFSET_PADDING1',
		'OFFSET_PADDING2',
		'OFFSET_PADDING3'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'field definition' }
SDL3GPUStorageBufferReadWriteBinding class >> fieldsDesc [

	^ #(
	SDL_GPUBuffer* buffer;
	bool cycle;
	Uint8 padding1;
	Uint8 padding2;
	Uint8 padding3
	)
]

{ #category : 'accessing - structure variables' }
SDL3GPUStorageBufferReadWriteBinding >> buffer [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_BUFFER) type: ExternalType void asPointerType
]

{ #category : 'accessing - structure variables' }
SDL3GPUStorageBufferReadWriteBinding >> buffer: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_BUFFER put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
SDL3GPUStorageBufferReadWriteBinding >> cycle [
	"This method was automatically generated"
	^handle booleanAt: OFFSET_CYCLE
]

{ #category : 'accessing - structure variables' }
SDL3GPUStorageBufferReadWriteBinding >> cycle: anObject [
	"This method was automatically generated"
	handle booleanAt: OFFSET_CYCLE put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUStorageBufferReadWriteBinding >> padding1 [
	"This method was automatically generated"
	^handle unsignedByteAt: OFFSET_PADDING1
]

{ #category : 'accessing - structure variables' }
SDL3GPUStorageBufferReadWriteBinding >> padding1: anObject [
	"This method was automatically generated"
	handle unsignedByteAt: OFFSET_PADDING1 put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUStorageBufferReadWriteBinding >> padding2 [
	"This method was automatically generated"
	^handle unsignedByteAt: OFFSET_PADDING2
]

{ #category : 'accessing - structure variables' }
SDL3GPUStorageBufferReadWriteBinding >> padding2: anObject [
	"This method was automatically generated"
	handle unsignedByteAt: OFFSET_PADDING2 put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUStorageBufferReadWriteBinding >> padding3 [
	"This method was automatically generated"
	^handle unsignedByteAt: OFFSET_PADDING3
]

{ #category : 'accessing - structure variables' }
SDL3GPUStorageBufferReadWriteBinding >> padding3: anObject [
	"This method was automatically generated"
	handle unsignedByteAt: OFFSET_PADDING3 put: anObject
]
