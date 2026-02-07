Class {
	#name : 'SDL3UserEvent',
	#superclass : 'SDL3WindowIDEvent',
	#classVars : [
		'OFFSET_CODE',
		'OFFSET_DATA1',
		'OFFSET_DATA2',
		'OFFSET_RESERVED',
		'OFFSET_TIMESTAMP',
		'OFFSET_TYPE',
		'OFFSET_WINDOWID'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'field definition' }
SDL3UserEvent class >> fieldsDesc [

	^ #(
	Uint32 type;
	Uint32 reserved;
	Uint64 timestamp;
	SDL_WindowID windowID;
	Sint32 code;
	void* data1;
	void* data2
	)
]

{ #category : 'visitor' }
SDL3UserEvent >> accept: aVisitor [

	^ aVisitor visitUserEvent: self
]

{ #category : 'accessing - structure variables' }
SDL3UserEvent >> code [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_CODE
]

{ #category : 'accessing - structure variables' }
SDL3UserEvent >> code: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_CODE put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3UserEvent >> data1 [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_DATA1) type: ExternalType void asPointerType
]

{ #category : 'accessing - structure variables' }
SDL3UserEvent >> data1: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_DATA1 put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
SDL3UserEvent >> data2 [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_DATA2) type: ExternalType void asPointerType
]

{ #category : 'accessing - structure variables' }
SDL3UserEvent >> data2: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_DATA2 put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
SDL3UserEvent >> timestamp [
	"This method was automatically generated"
	^handle unsignedLongLongAt: OFFSET_TIMESTAMP
]

{ #category : 'accessing - structure variables' }
SDL3UserEvent >> timestamp: anObject [
	"This method was automatically generated"
	handle unsignedLongLongAt: OFFSET_TIMESTAMP put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3UserEvent >> type: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_TYPE put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3UserEvent >> windowID [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_WINDOWID
]

{ #category : 'accessing - structure variables' }
SDL3UserEvent >> windowID: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_WINDOWID put: anObject
]
