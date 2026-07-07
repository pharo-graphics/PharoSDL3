"
I am a SDL3 FFI binding for `SDL_GUID`.

An SDL_GUID is a 128-bit identifier for an input device that identifies that device across runs of SDL programs on the same platform.

See: https://wiki.libsdl.org/SDL3/SDL_GUID
"
Class {
	#name : 'SDL3GUID',
	#superclass : 'SDL3Structure',
	#classVars : [
		'OFFSET_DATA'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'field definition' }
SDL3GUID class >> fieldsDesc [

	^ #(
	Uint8_16 data
	)
]

{ #category : 'accessing - structure variables' }
SDL3GUID >> data [
	"This method was automatically generated"
	^(FFIArray ofType: #FFIUInt8 size: 16) fromHandle: (handle copyFrom: OFFSET_DATA to: OFFSET_DATA + 15)
]

{ #category : 'accessing - structure variables' }
SDL3GUID >> data: anObject [
	"This method was automatically generated"
	handle replaceFrom: OFFSET_DATA to: OFFSET_DATA + 15 with: anObject getHandle startingAt: 1
]
