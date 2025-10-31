Class {
	#name : 'SDL3GPUMultisampleState',
	#superclass : 'SDL3Structure',
	#classVars : [
		'OFFSET_ENABLE_ALPHA_TO_COVERAGE',
		'OFFSET_ENABLE_MASK',
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
SDL3GPUMultisampleState class >> fieldsDesc [

	^ #(
	SDL_GPUSampleCount sample_count;
	Uint32 sample_mask;
	bool enable_mask;
	bool enable_alpha_to_coverage;
	Uint8 padding2;
	Uint8 padding3
	)
]

{ #category : 'accessing - structure variables' }
SDL3GPUMultisampleState >> enableAlphaToCoverage [
	"This method was automatically generated"
	^handle booleanAt: OFFSET_ENABLE_ALPHA_TO_COVERAGE
]

{ #category : 'accessing - structure variables' }
SDL3GPUMultisampleState >> enableAlphaToCoverage: anObject [
	"This method was automatically generated"
	handle booleanAt: OFFSET_ENABLE_ALPHA_TO_COVERAGE put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUMultisampleState >> enableMask [
	"This method was automatically generated"
	^handle booleanAt: OFFSET_ENABLE_MASK
]

{ #category : 'accessing - structure variables' }
SDL3GPUMultisampleState >> enableMask: anObject [
	"This method was automatically generated"
	handle booleanAt: OFFSET_ENABLE_MASK put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUMultisampleState >> padding2 [
	"This method was automatically generated"
	^handle unsignedByteAt: OFFSET_PADDING2
]

{ #category : 'accessing - structure variables' }
SDL3GPUMultisampleState >> padding2: anObject [
	"This method was automatically generated"
	handle unsignedByteAt: OFFSET_PADDING2 put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUMultisampleState >> padding3 [
	"This method was automatically generated"
	^handle unsignedByteAt: OFFSET_PADDING3
]

{ #category : 'accessing - structure variables' }
SDL3GPUMultisampleState >> padding3: anObject [
	"This method was automatically generated"
	handle unsignedByteAt: OFFSET_PADDING3 put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUMultisampleState >> sampleCount [
	"This method was automatically generated"
	^SDL3GPUSampleCount fromInteger: (handle unsignedLongAt: OFFSET_SAMPLE_COUNT)
]

{ #category : 'accessing - structure variables' }
SDL3GPUMultisampleState >> sampleCount: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_SAMPLE_COUNT put: anObject value
]

{ #category : 'accessing - structure variables' }
SDL3GPUMultisampleState >> sampleMask [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_SAMPLE_MASK
]

{ #category : 'accessing - structure variables' }
SDL3GPUMultisampleState >> sampleMask: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_SAMPLE_MASK put: anObject
]
