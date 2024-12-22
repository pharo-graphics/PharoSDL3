Class {
	#name : 'S3SDL_IOStreamInterface',
	#superclass : 'S3Structure',
	#classVars : [
		'OFFSET_SINT64',
		'OFFSET_SIZE_T',
		'OFFSET_VERSION'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'field definition' }
S3SDL_IOStreamInterface class >> fieldsDesc [

	^ #(
	int version;
	int Sint64;
	int size_t
	)
]

{ #category : 'accessing - structure variables' }
S3SDL_IOStreamInterface >> Sint64 [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_SINT64
]

{ #category : 'accessing - structure variables' }
S3SDL_IOStreamInterface >> Sint64: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_SINT64 put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_IOStreamInterface >> size_t [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_SIZE_T
]

{ #category : 'accessing - structure variables' }
S3SDL_IOStreamInterface >> size_t: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_SIZE_T put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_IOStreamInterface >> version [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_VERSION
]

{ #category : 'accessing - structure variables' }
S3SDL_IOStreamInterface >> version: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_VERSION put: anObject
]
