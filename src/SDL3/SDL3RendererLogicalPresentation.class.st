"
I am a SDL3 FFI binding for `SDL_RendererLogicalPresentation`.

How the logical size is mapped to the output.

See: https://wiki.libsdl.org/SDL3/SDL_RendererLogicalPresentation
"
Class {
	#name : 'SDL3RendererLogicalPresentation',
	#superclass : 'SDL3Enumeration',
	#classVars : [
		'SDL_LOGICAL_PRESENTATION_DISABLED',
		'SDL_LOGICAL_PRESENTATION_INTEGER_SCALE',
		'SDL_LOGICAL_PRESENTATION_LETTERBOX',
		'SDL_LOGICAL_PRESENTATION_OVERSCAN',
		'SDL_LOGICAL_PRESENTATION_STRETCH'
	],
	#category : 'SDL3-Enumerations',
	#package : 'SDL3',
	#tag : 'Enumerations'
}

{ #category : 'accessing enum' }
SDL3RendererLogicalPresentation class >> disabled [
	"This method was automatically generated"
	^ SDL_LOGICAL_PRESENTATION_DISABLED
]

{ #category : 'enum declaration' }
SDL3RendererLogicalPresentation class >> enumDecl [

	^ #(
	SDL_LOGICAL_PRESENTATION_DISABLED 0
	SDL_LOGICAL_PRESENTATION_STRETCH 1
	SDL_LOGICAL_PRESENTATION_LETTERBOX 2
	SDL_LOGICAL_PRESENTATION_OVERSCAN 3
	SDL_LOGICAL_PRESENTATION_INTEGER_SCALE 4 )
]

{ #category : 'accessing enum' }
SDL3RendererLogicalPresentation class >> integerScale [
	"This method was automatically generated"
	^ SDL_LOGICAL_PRESENTATION_INTEGER_SCALE
]

{ #category : 'accessing enum' }
SDL3RendererLogicalPresentation class >> letterbox [
	"This method was automatically generated"
	^ SDL_LOGICAL_PRESENTATION_LETTERBOX
]

{ #category : 'accessing enum' }
SDL3RendererLogicalPresentation class >> overscan [
	"This method was automatically generated"
	^ SDL_LOGICAL_PRESENTATION_OVERSCAN
]

{ #category : 'accessing enum' }
SDL3RendererLogicalPresentation class >> stretch [
	"This method was automatically generated"
	^ SDL_LOGICAL_PRESENTATION_STRETCH
]
