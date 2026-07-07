"
I am a SDL3 FFI binding for `SDL_AtomicInt`.

A type representing an atomic integer value.

See: https://wiki.libsdl.org/SDL3/SDL_AtomicInt
"
Class {
	#name : 'SDL3AtomicInt',
	#superclass : 'SDL3Structure',
	#classVars : [
		'OFFSET_VALUE'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'field definition' }
SDL3AtomicInt class >> fieldsDesc [

	^ #(
	int value
	)
]

{ #category : 'accessing - structure variables' }
SDL3AtomicInt >> value [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_VALUE
]

{ #category : 'accessing - structure variables' }
SDL3AtomicInt >> value: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_VALUE put: anObject
]
