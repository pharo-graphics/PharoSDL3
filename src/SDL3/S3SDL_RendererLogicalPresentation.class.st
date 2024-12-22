Class {
	#name : 'S3SDL_RendererLogicalPresentation',
	#superclass : 'S3Enumeration',
	#classVars : [
		'SDL_LOGICAL_PRESENTATION_DISABLED',
		'SDL_LOGICAL_PRESENTATION_INTEGER_SCALE',
		'SDL_LOGICAL_PRESENTATION_LETTERBOX',
		'SDL_LOGICAL_PRESENTATION_OVERSCAN',
		'SDL_LOGICAL_PRESENTATION_STRETCH'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'accessing enum' }
S3SDL_RendererLogicalPresentation class >> SDL_LOGICAL_PRESENTATION_DISABLED [
	"This method was automatically generated"
	^ SDL_LOGICAL_PRESENTATION_DISABLED
]

{ #category : 'accessing enum' }
S3SDL_RendererLogicalPresentation class >> SDL_LOGICAL_PRESENTATION_INTEGER_SCALE [
	"This method was automatically generated"
	^ SDL_LOGICAL_PRESENTATION_INTEGER_SCALE
]

{ #category : 'accessing enum' }
S3SDL_RendererLogicalPresentation class >> SDL_LOGICAL_PRESENTATION_LETTERBOX [
	"This method was automatically generated"
	^ SDL_LOGICAL_PRESENTATION_LETTERBOX
]

{ #category : 'accessing enum' }
S3SDL_RendererLogicalPresentation class >> SDL_LOGICAL_PRESENTATION_OVERSCAN [
	"This method was automatically generated"
	^ SDL_LOGICAL_PRESENTATION_OVERSCAN
]

{ #category : 'accessing enum' }
S3SDL_RendererLogicalPresentation class >> SDL_LOGICAL_PRESENTATION_STRETCH [
	"This method was automatically generated"
	^ SDL_LOGICAL_PRESENTATION_STRETCH
]

{ #category : 'enum declaration' }
S3SDL_RendererLogicalPresentation class >> enumDecl [

	^ #(
	SDL_LOGICAL_PRESENTATION_DISABLED 0
	SDL_LOGICAL_PRESENTATION_STRETCH 1
	SDL_LOGICAL_PRESENTATION_LETTERBOX 2
	SDL_LOGICAL_PRESENTATION_OVERSCAN 3
	SDL_LOGICAL_PRESENTATION_INTEGER_SCALE 4 )
]
