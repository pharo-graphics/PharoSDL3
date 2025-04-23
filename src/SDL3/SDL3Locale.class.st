Class {
	#name : 'SDL3Locale',
	#superclass : 'SDL3Structure',
	#classVars : [
		'OFFSET_COUNTRY',
		'OFFSET_LANGUAGE'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'field definition' }
SDL3Locale class >> fieldsDesc [

	^ #(
	char* language;
	char* country
	)
]

{ #category : 'accessing - structure variables' }
SDL3Locale >> country [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_COUNTRY) type: ExternalType char asPointerType
]

{ #category : 'accessing - structure variables' }
SDL3Locale >> country: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_COUNTRY put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
SDL3Locale >> language [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_LANGUAGE) type: ExternalType char asPointerType
]

{ #category : 'accessing - structure variables' }
SDL3Locale >> language: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_LANGUAGE put: anObject getHandle.
]
