"
I am a SDL3 FFI binding for `SDL_HapticDirection`.

Structure that represents a haptic direction.

See: https://wiki.libsdl.org/SDL3/SDL_HapticDirection
"
Class {
	#name : 'SDL3HapticDirection',
	#superclass : 'SDL3Structure',
	#classVars : [
		'OFFSET_DIR',
		'OFFSET_TYPE'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'field definition' }
SDL3HapticDirection class >> fieldsDesc [

	^ #(
	SDL_HapticDirectionType type;
	Sint32_3 dir
	)
]

{ #category : 'accessing - structure variables' }
SDL3HapticDirection >> dir [
	"This method was automatically generated"
	^(FFIArray ofType: #FFIInt32 size: 3) fromHandle: (handle copyFrom: OFFSET_DIR to: OFFSET_DIR + 11)
]

{ #category : 'accessing - structure variables' }
SDL3HapticDirection >> dir: anObject [
	"This method was automatically generated"
	handle replaceFrom: OFFSET_DIR to: OFFSET_DIR + 11 with: anObject getHandle startingAt: 1
]

{ #category : 'accessing - structure variables' }
SDL3HapticDirection >> type [
	"This method was automatically generated"
	^handle unsignedByteAt: OFFSET_TYPE
]

{ #category : 'accessing - structure variables' }
SDL3HapticDirection >> type: anObject [
	"This method was automatically generated"
	handle unsignedByteAt: OFFSET_TYPE put: anObject
]
