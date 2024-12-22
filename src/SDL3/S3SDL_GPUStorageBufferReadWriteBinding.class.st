Class {
	#name : 'S3SDL_GPUStorageBufferReadWriteBinding',
	#superclass : 'S3Structure',
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
S3SDL_GPUStorageBufferReadWriteBinding class >> fieldsDesc [

	^ #(
	SDL_GPUBuffer* buffer;
	int cycle;
	int padding1;
	int padding2;
	int padding3
	)
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUStorageBufferReadWriteBinding >> buffer [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_BUFFER) type: ExternalType void asPointerType
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUStorageBufferReadWriteBinding >> buffer: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_BUFFER put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUStorageBufferReadWriteBinding >> cycle [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_CYCLE
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUStorageBufferReadWriteBinding >> cycle: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_CYCLE put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUStorageBufferReadWriteBinding >> padding1 [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_PADDING1
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUStorageBufferReadWriteBinding >> padding1: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_PADDING1 put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUStorageBufferReadWriteBinding >> padding2 [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_PADDING2
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUStorageBufferReadWriteBinding >> padding2: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_PADDING2 put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUStorageBufferReadWriteBinding >> padding3 [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_PADDING3
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUStorageBufferReadWriteBinding >> padding3: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_PADDING3 put: anObject
]
