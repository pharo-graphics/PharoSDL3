Class {
	#name : 'SDL3CursorFrameInfo',
	#superclass : 'SDL3Structure',
	#classVars : [
		'OFFSET_DURATION',
		'OFFSET_SURFACE'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'field definition' }
SDL3CursorFrameInfo class >> fieldsDesc [

	^ #(
	SDL_Surface* surface;
	Uint32 duration
	)
]

{ #category : 'accessing - structure variables' }
SDL3CursorFrameInfo >> duration [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_DURATION
]

{ #category : 'accessing - structure variables' }
SDL3CursorFrameInfo >> duration: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_DURATION put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3CursorFrameInfo >> surface [
	"This method was automatically generated"
	^SDL3Surface fromHandle: (handle pointerAt: OFFSET_SURFACE)
]

{ #category : 'accessing - structure variables' }
SDL3CursorFrameInfo >> surface: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_SURFACE put: anObject getHandle.
]
