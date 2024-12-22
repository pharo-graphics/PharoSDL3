Class {
	#name : 'S3SDL_StorageInterface',
	#superclass : 'S3Structure',
	#classVars : [
		'OFFSET_UINT64',
		'OFFSET_VERSION'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'field definition' }
S3SDL_StorageInterface class >> fieldsDesc [

	^ #(
	int version;
	int Uint64
	)
]

{ #category : 'accessing - structure variables' }
S3SDL_StorageInterface >> Uint64 [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_UINT64
]

{ #category : 'accessing - structure variables' }
S3SDL_StorageInterface >> Uint64: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_UINT64 put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_StorageInterface >> version [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_VERSION
]

{ #category : 'accessing - structure variables' }
S3SDL_StorageInterface >> version: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_VERSION put: anObject
]
