Class {
	#name : 'S3SDL_DialogFileFilter',
	#superclass : 'S3Structure',
	#classVars : [
		'OFFSET_NAME',
		'OFFSET_PATTERN'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'field definition' }
S3SDL_DialogFileFilter class >> fieldsDesc [

	^ #(
	char* name;
	char* pattern
	)
]

{ #category : 'accessing - structure variables' }
S3SDL_DialogFileFilter >> name [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_NAME) type: ExternalType char asPointerType
]

{ #category : 'accessing - structure variables' }
S3SDL_DialogFileFilter >> name: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_NAME put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
S3SDL_DialogFileFilter >> pattern [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_PATTERN) type: ExternalType char asPointerType
]

{ #category : 'accessing - structure variables' }
S3SDL_DialogFileFilter >> pattern: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_PATTERN put: anObject getHandle.
]
