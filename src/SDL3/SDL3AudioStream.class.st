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
