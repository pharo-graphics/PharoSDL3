Class {
	#name : 'SDL3InitState',
	#superclass : 'SDL3Structure',
	#classVars : [
		'OFFSET_RESERVED',
		'OFFSET_STATUS',
		'OFFSET_THREAD'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'field definition' }
SDL3InitState class >> fieldsDesc [

	^ #(
	SDL_AtomicInt status;
	SDL_ThreadID thread;
	void* reserved
	)
]

{ #category : 'accessing - structure variables' }
SDL3InitState >> status [
	"This method was automatically generated"
	^ SDL3AtomicInt fromHandle: (handle referenceStructAt: OFFSET_STATUS length: SDL3AtomicInt byteSize)
]

{ #category : 'accessing - structure variables' }
SDL3InitState >> status: anObject [
	"This method was automatically generated"
	handle structAt: OFFSET_STATUS put: anObject getHandle length: SDL3AtomicInt byteSize
]

{ #category : 'accessing - structure variables' }
SDL3InitState >> thread [
	"This method was automatically generated"
	^handle unsignedLongLongAt: OFFSET_THREAD
]

{ #category : 'accessing - structure variables' }
SDL3InitState >> thread: anObject [
	"This method was automatically generated"
	handle unsignedLongLongAt: OFFSET_THREAD put: anObject
]
