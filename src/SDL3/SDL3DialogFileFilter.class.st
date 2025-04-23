Class {
	#name : 'SDL3DialogFileFilter',
	#superclass : 'SDL3Structure',
	#classVars : [
		'OFFSET_NAME',
		'OFFSET_PATTERN'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'field definition' }
SDL3DialogFileFilter class >> fieldsDesc [

	^ #(
	char* name;
	char* pattern
	)
]

{ #category : 'accessing - structure variables' }
SDL3DialogFileFilter >> name [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_NAME) type: ExternalType char asPointerType
]

{ #category : 'accessing - structure variables' }
SDL3DialogFileFilter >> name: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_NAME put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
SDL3DialogFileFilter >> pattern [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_PATTERN) type: ExternalType char asPointerType
]

{ #category : 'accessing - structure variables' }
SDL3DialogFileFilter >> pattern: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_PATTERN put: anObject getHandle.
]
