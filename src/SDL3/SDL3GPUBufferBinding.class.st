"
I am a SDL3 FFI binding for `SDL_GPUBufferBinding`.

A structure specifying parameters in a buffer binding call.

See: https://wiki.libsdl.org/SDL3/SDL_GPUBufferBinding
"
Class {
	#name : 'SDL3GPUBufferBinding',
	#superclass : 'SDL3Structure',
	#classVars : [
		'OFFSET_BUFFER',
		'OFFSET_OFFSET'
	],
	#category : 'SDL3-GPU-Base',
	#package : 'SDL3',
	#tag : 'GPU-Base'
}

{ #category : 'field definition' }
SDL3GPUBufferBinding class >> fieldsDesc [

	^ #(
	SDL_GPUBuffer* buffer;
	Uint32 offset
	)
]

{ #category : 'configuring' }
SDL3GPUBufferBinding >> beBuffer: aBuffer offset: anInteger [

	self
		buffer: aBuffer;
		offset: anInteger
]

{ #category : 'configuring' }
SDL3GPUBufferBinding >> beOffset: anInteger [

	self beBuffer: ExternalAddress null offset: anInteger
]

{ #category : 'accessing - structure variables' }
SDL3GPUBufferBinding >> buffer [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_BUFFER) type: ExternalType void asPointerType
]

{ #category : 'accessing - structure variables' }
SDL3GPUBufferBinding >> buffer: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_BUFFER put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
SDL3GPUBufferBinding >> offset [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_OFFSET
]

{ #category : 'accessing - structure variables' }
SDL3GPUBufferBinding >> offset: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_OFFSET put: anObject
]

{ #category : 'printing' }
SDL3GPUBufferBinding >> printOn: aStream [

	super printOn: aStream.
	aStream
		nextPutAll: ' buffer: (';
		print: self buffer.
	aStream
		nextPutAll: ') offset: ';
		print: self offset
]
