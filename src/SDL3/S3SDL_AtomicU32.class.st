Class {
	#name : 'S3SDL_AtomicU32',
	#superclass : 'S3Structure',
	#classVars : [
		'OFFSET_VALUE'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'field definition' }
S3SDL_AtomicU32 class >> fieldsDesc [

	^ #(
	Uint32 value
	)
]

{ #category : 'accessing - structure variables' }
S3SDL_AtomicU32 >> value [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_VALUE
]

{ #category : 'accessing - structure variables' }
S3SDL_AtomicU32 >> value: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_VALUE put: anObject
]
