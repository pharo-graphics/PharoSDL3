Class {
	#name : 'S3SDL_GPUStorageTextureReadWriteBinding',
	#superclass : 'S3Structure',
	#classVars : [
		'OFFSET_CYCLE',
		'OFFSET_LAYER',
		'OFFSET_MIP_LEVEL',
		'OFFSET_PADDING1',
		'OFFSET_PADDING2',
		'OFFSET_PADDING3',
		'OFFSET_TEXTURE'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'field definition' }
S3SDL_GPUStorageTextureReadWriteBinding class >> fieldsDesc [

	^ #(
	SDL_GPUTexture* texture;
	Uint32 mip_level;
	Uint32 layer;
	bool cycle;
	Uint8 padding1;
	Uint8 padding2;
	Uint8 padding3
	)
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUStorageTextureReadWriteBinding >> cycle [
	"This method was automatically generated"
	^handle booleanAt: OFFSET_CYCLE
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUStorageTextureReadWriteBinding >> cycle: anObject [
	"This method was automatically generated"
	handle booleanAt: OFFSET_CYCLE put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUStorageTextureReadWriteBinding >> layer [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_LAYER
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUStorageTextureReadWriteBinding >> layer: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_LAYER put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUStorageTextureReadWriteBinding >> mip_level [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_MIP_LEVEL
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUStorageTextureReadWriteBinding >> mip_level: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_MIP_LEVEL put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUStorageTextureReadWriteBinding >> padding1 [
	"This method was automatically generated"
	^handle unsignedByteAt: OFFSET_PADDING1
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUStorageTextureReadWriteBinding >> padding1: anObject [
	"This method was automatically generated"
	handle unsignedByteAt: OFFSET_PADDING1 put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUStorageTextureReadWriteBinding >> padding2 [
	"This method was automatically generated"
	^handle unsignedByteAt: OFFSET_PADDING2
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUStorageTextureReadWriteBinding >> padding2: anObject [
	"This method was automatically generated"
	handle unsignedByteAt: OFFSET_PADDING2 put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUStorageTextureReadWriteBinding >> padding3 [
	"This method was automatically generated"
	^handle unsignedByteAt: OFFSET_PADDING3
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUStorageTextureReadWriteBinding >> padding3: anObject [
	"This method was automatically generated"
	handle unsignedByteAt: OFFSET_PADDING3 put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUStorageTextureReadWriteBinding >> texture [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_TEXTURE) type: ExternalType void asPointerType
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUStorageTextureReadWriteBinding >> texture: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_TEXTURE put: anObject getHandle.
]
