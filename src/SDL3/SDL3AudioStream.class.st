"
I am a SDL3 FFI binding for `SDL_AudioStream`.

The opaque handle that represents an audio stream.

See: https://wiki.libsdl.org/SDL3/SDL_AudioStream
"
Class {
	#name : 'SDL3AudioStream',
	#superclass : 'SDL3BaseObject',
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'accessing' }
SDL3AudioStream >> inputFormatSpec [

	| spec |
	spec := SDL_AudioSpec new.

	self getFormatIntoSrcSpec: spec dstSpec: nil.
	
	^ spec
]

{ #category : 'accessing' }
SDL3AudioStream >> outputFormatSpec [

	| spec |
	spec := SDL_AudioSpec new.

	self getFormatIntoSrcSpec: nil dstSpec: spec.
	
	^ spec
]
