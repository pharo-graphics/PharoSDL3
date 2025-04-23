Class {
	#name : 'SDL3TextEditingCandidatesEvent',
	#superclass : 'SDL3MappedEvent',
	#classVars : [
		'OFFSET_CANDIDATES',
		'OFFSET_HORIZONTAL',
		'OFFSET_NUM_CANDIDATES',
		'OFFSET_PADDING1',
		'OFFSET_PADDING2',
		'OFFSET_PADDING3',
		'OFFSET_RESERVED',
		'OFFSET_SELECTED_CANDIDATE',
		'OFFSET_TIMESTAMP',
		'OFFSET_TYPE',
		'OFFSET_WINDOWID'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'field definition' }
SDL3TextEditingCandidatesEvent class >> fieldsDesc [

	^ #(
	SDL_EventType type;
	Uint32 reserved;
	Uint64 timestamp;
	SDL_WindowID windowID;
	char* candidates;
	Sint32 num_candidates;
	Sint32 selected_candidate;
	bool horizontal;
	Uint8 padding1;
	Uint8 padding2;
	Uint8 padding3
	)
]

{ #category : 'accessing - structure variables' }
SDL3TextEditingCandidatesEvent >> candidates [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_CANDIDATES) type: ExternalType char asPointerType
]

{ #category : 'accessing - structure variables' }
SDL3TextEditingCandidatesEvent >> candidates: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_CANDIDATES put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
SDL3TextEditingCandidatesEvent >> horizontal [
	"This method was automatically generated"
	^handle booleanAt: OFFSET_HORIZONTAL
]

{ #category : 'accessing - structure variables' }
SDL3TextEditingCandidatesEvent >> horizontal: anObject [
	"This method was automatically generated"
	handle booleanAt: OFFSET_HORIZONTAL put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3TextEditingCandidatesEvent >> num_candidates [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_NUM_CANDIDATES
]

{ #category : 'accessing - structure variables' }
SDL3TextEditingCandidatesEvent >> num_candidates: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_NUM_CANDIDATES put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3TextEditingCandidatesEvent >> padding1 [
	"This method was automatically generated"
	^handle unsignedByteAt: OFFSET_PADDING1
]

{ #category : 'accessing - structure variables' }
SDL3TextEditingCandidatesEvent >> padding1: anObject [
	"This method was automatically generated"
	handle unsignedByteAt: OFFSET_PADDING1 put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3TextEditingCandidatesEvent >> padding2 [
	"This method was automatically generated"
	^handle unsignedByteAt: OFFSET_PADDING2
]

{ #category : 'accessing - structure variables' }
SDL3TextEditingCandidatesEvent >> padding2: anObject [
	"This method was automatically generated"
	handle unsignedByteAt: OFFSET_PADDING2 put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3TextEditingCandidatesEvent >> padding3 [
	"This method was automatically generated"
	^handle unsignedByteAt: OFFSET_PADDING3
]

{ #category : 'accessing - structure variables' }
SDL3TextEditingCandidatesEvent >> padding3: anObject [
	"This method was automatically generated"
	handle unsignedByteAt: OFFSET_PADDING3 put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3TextEditingCandidatesEvent >> reserved [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_RESERVED
]

{ #category : 'accessing - structure variables' }
SDL3TextEditingCandidatesEvent >> reserved: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_RESERVED put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3TextEditingCandidatesEvent >> selected_candidate [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_SELECTED_CANDIDATE
]

{ #category : 'accessing - structure variables' }
SDL3TextEditingCandidatesEvent >> selected_candidate: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_SELECTED_CANDIDATE put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3TextEditingCandidatesEvent >> timestamp [
	"This method was automatically generated"
	^handle unsignedLongLongAt: OFFSET_TIMESTAMP
]

{ #category : 'accessing - structure variables' }
SDL3TextEditingCandidatesEvent >> timestamp: anObject [
	"This method was automatically generated"
	handle unsignedLongLongAt: OFFSET_TIMESTAMP put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3TextEditingCandidatesEvent >> type [
	"This method was automatically generated"
	^SDL3EventType fromInteger: (handle unsignedLongAt: OFFSET_TYPE)
]

{ #category : 'accessing - structure variables' }
SDL3TextEditingCandidatesEvent >> type: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_TYPE put: anObject value
]

{ #category : 'accessing - structure variables' }
SDL3TextEditingCandidatesEvent >> windowID [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_WINDOWID
]

{ #category : 'accessing - structure variables' }
SDL3TextEditingCandidatesEvent >> windowID: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_WINDOWID put: anObject
]
