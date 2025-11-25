Class {
	#name : 'SDL3TextEditingCandidatesEvent',
	#superclass : 'SDL3WindowIDEvent',
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
SDL3TextEditingCandidatesEvent >> horizontal [
	"This method was automatically generated"
	^handle booleanAt: OFFSET_HORIZONTAL
]

{ #category : 'accessing - structure variables' }
SDL3TextEditingCandidatesEvent >> numCandidates [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_NUM_CANDIDATES
]

{ #category : 'accessing - structure variables' }
SDL3TextEditingCandidatesEvent >> padding1 [
	"This method was automatically generated"
	^handle unsignedByteAt: OFFSET_PADDING1
]

{ #category : 'accessing - structure variables' }
SDL3TextEditingCandidatesEvent >> padding2 [
	"This method was automatically generated"
	^handle unsignedByteAt: OFFSET_PADDING2
]

{ #category : 'accessing - structure variables' }
SDL3TextEditingCandidatesEvent >> padding3 [
	"This method was automatically generated"
	^handle unsignedByteAt: OFFSET_PADDING3
]

{ #category : 'accessing - structure variables' }
SDL3TextEditingCandidatesEvent >> reserved [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_RESERVED
]

{ #category : 'accessing - structure variables' }
SDL3TextEditingCandidatesEvent >> selectedCandidate [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_SELECTED_CANDIDATE
]

{ #category : 'accessing - structure variables' }
SDL3TextEditingCandidatesEvent >> timestamp [
	"This method was automatically generated"
	^handle unsignedLongLongAt: OFFSET_TIMESTAMP
]

{ #category : 'accessing - structure variables' }
SDL3TextEditingCandidatesEvent >> windowID [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_WINDOWID
]
