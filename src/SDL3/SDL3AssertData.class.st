Class {
	#name : 'SDL3AssertData',
	#superclass : 'S3Structure',
	#classVars : [
		'OFFSET_ALWAYS_IGNORE',
		'OFFSET_CONDITION',
		'OFFSET_FILENAME',
		'OFFSET_FUNCTION',
		'OFFSET_LINENUM',
		'OFFSET_NEXT',
		'OFFSET_TRIGGER_COUNT'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'field definition' }
SDL3AssertData class >> fieldsDesc [

	^ #(
	bool always_ignore;
	uint trigger_count;
	char* condition;
	char* filename;
	int linenum;
	char* function;
	SDL_AssertData* next
	)
]

{ #category : 'accessing - structure variables' }
SDL3AssertData >> always_ignore [
	"This method was automatically generated"
	^handle booleanAt: OFFSET_ALWAYS_IGNORE
]

{ #category : 'accessing - structure variables' }
SDL3AssertData >> always_ignore: anObject [
	"This method was automatically generated"
	handle booleanAt: OFFSET_ALWAYS_IGNORE put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3AssertData >> condition [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_CONDITION) type: ExternalType char asPointerType
]

{ #category : 'accessing - structure variables' }
SDL3AssertData >> condition: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_CONDITION put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
SDL3AssertData >> filename [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_FILENAME) type: ExternalType char asPointerType
]

{ #category : 'accessing - structure variables' }
SDL3AssertData >> filename: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_FILENAME put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
SDL3AssertData >> function [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_FUNCTION) type: ExternalType char asPointerType
]

{ #category : 'accessing - structure variables' }
SDL3AssertData >> function: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_FUNCTION put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
SDL3AssertData >> linenum [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_LINENUM
]

{ #category : 'accessing - structure variables' }
SDL3AssertData >> linenum: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_LINENUM put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3AssertData >> next [
	"This method was automatically generated"
	^SDL3AssertData fromHandle: (handle pointerAt: OFFSET_NEXT)
]

{ #category : 'accessing - structure variables' }
SDL3AssertData >> next: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_NEXT put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
SDL3AssertData >> trigger_count [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_TRIGGER_COUNT
]

{ #category : 'accessing - structure variables' }
SDL3AssertData >> trigger_count: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_TRIGGER_COUNT put: anObject
]
