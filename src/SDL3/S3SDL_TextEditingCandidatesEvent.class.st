Class {
	#name : 'S3SDL_TextEditingCandidatesEvent',
	#superclass : 'S3Structure',
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
S3SDL_TextEditingCandidatesEvent class >> fieldsDesc [

	^ #(
	SDL_EventType type;
	int reserved;
	int timestamp;
	int windowID;
	char* candidates;
	int num_candidates;
	int selected_candidate;
	int horizontal;
	int padding1;
	int padding2;
	int padding3
	)
]

{ #category : 'accessing - structure variables' }
S3SDL_TextEditingCandidatesEvent >> candidates [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_CANDIDATES) type: ExternalType char asPointerType
]

{ #category : 'accessing - structure variables' }
S3SDL_TextEditingCandidatesEvent >> candidates: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_CANDIDATES put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
S3SDL_TextEditingCandidatesEvent >> horizontal [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_HORIZONTAL
]

{ #category : 'accessing - structure variables' }
S3SDL_TextEditingCandidatesEvent >> horizontal: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_HORIZONTAL put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_TextEditingCandidatesEvent >> num_candidates [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_NUM_CANDIDATES
]

{ #category : 'accessing - structure variables' }
S3SDL_TextEditingCandidatesEvent >> num_candidates: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_NUM_CANDIDATES put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_TextEditingCandidatesEvent >> padding1 [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_PADDING1
]

{ #category : 'accessing - structure variables' }
S3SDL_TextEditingCandidatesEvent >> padding1: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_PADDING1 put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_TextEditingCandidatesEvent >> padding2 [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_PADDING2
]

{ #category : 'accessing - structure variables' }
S3SDL_TextEditingCandidatesEvent >> padding2: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_PADDING2 put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_TextEditingCandidatesEvent >> padding3 [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_PADDING3
]

{ #category : 'accessing - structure variables' }
S3SDL_TextEditingCandidatesEvent >> padding3: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_PADDING3 put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_TextEditingCandidatesEvent >> reserved [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_RESERVED
]

{ #category : 'accessing - structure variables' }
S3SDL_TextEditingCandidatesEvent >> reserved: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_RESERVED put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_TextEditingCandidatesEvent >> selected_candidate [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_SELECTED_CANDIDATE
]

{ #category : 'accessing - structure variables' }
S3SDL_TextEditingCandidatesEvent >> selected_candidate: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_SELECTED_CANDIDATE put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_TextEditingCandidatesEvent >> timestamp [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_TIMESTAMP
]

{ #category : 'accessing - structure variables' }
S3SDL_TextEditingCandidatesEvent >> timestamp: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_TIMESTAMP put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_TextEditingCandidatesEvent >> type [
	"This method was automatically generated"
	^S3SDL_EventType fromInteger: (handle unsignedLongAt: OFFSET_TYPE)
]

{ #category : 'accessing - structure variables' }
S3SDL_TextEditingCandidatesEvent >> type: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_TYPE put: anObject value
]

{ #category : 'accessing - structure variables' }
S3SDL_TextEditingCandidatesEvent >> windowID [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_WINDOWID
]

{ #category : 'accessing - structure variables' }
S3SDL_TextEditingCandidatesEvent >> windowID: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_WINDOWID put: anObject
]
