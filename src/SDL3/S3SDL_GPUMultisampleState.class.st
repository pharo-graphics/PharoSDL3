Class {
	#name : 'S3SDL_GPUMultisampleState',
	#superclass : 'S3Structure',
	#classVars : [
		'OFFSET_ENABLE_MASK',
		'OFFSET_PADDING1',
		'OFFSET_PADDING2',
		'OFFSET_PADDING3',
		'OFFSET_SAMPLE_COUNT',
		'OFFSET_SAMPLE_MASK'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'field definition' }
S3SDL_GPUMultisampleState class >> fieldsDesc [

	^ #(
	SDL_GPUSampleCount sample_count;
	Uint32 sample_mask;
	bool enable_mask;
	Uint8 padding1;
	Uint8 padding2;
	Uint8 padding3
	)
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUMultisampleState >> enable_mask [
	"This method was automatically generated"
	^handle booleanAt: OFFSET_ENABLE_MASK
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUMultisampleState >> enable_mask: anObject [
	"This method was automatically generated"
	handle booleanAt: OFFSET_ENABLE_MASK put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUMultisampleState >> padding1 [
	"This method was automatically generated"
	^handle unsignedByteAt: OFFSET_PADDING1
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUMultisampleState >> padding1: anObject [
	"This method was automatically generated"
	handle unsignedByteAt: OFFSET_PADDING1 put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUMultisampleState >> padding2 [
	"This method was automatically generated"
	^handle unsignedByteAt: OFFSET_PADDING2
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUMultisampleState >> padding2: anObject [
	"This method was automatically generated"
	handle unsignedByteAt: OFFSET_PADDING2 put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUMultisampleState >> padding3 [
	"This method was automatically generated"
	^handle unsignedByteAt: OFFSET_PADDING3
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUMultisampleState >> padding3: anObject [
	"This method was automatically generated"
	handle unsignedByteAt: OFFSET_PADDING3 put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUMultisampleState >> sample_count [
	"This method was automatically generated"
	^S3SDL_GPUSampleCount fromInteger: (handle unsignedLongAt: OFFSET_SAMPLE_COUNT)
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUMultisampleState >> sample_count: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_SAMPLE_COUNT put: anObject value
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUMultisampleState >> sample_mask [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_SAMPLE_MASK
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUMultisampleState >> sample_mask: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_SAMPLE_MASK put: anObject
]
