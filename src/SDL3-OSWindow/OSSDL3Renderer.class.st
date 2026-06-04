"
I am an abstract base class for SDL3-based OSWindow renderers.

I provide common functionality for managing the SDL3 renderer lifecycle and
integrating with the OSWindow system. I inherit from OSWindowGenericRenderer
to support the standard Morphic rendering interface.
"
Class {
	#name : 'OSSDL3Renderer',
	#superclass : 'OSWindowGenericRenderer',
	#instVars : [
		'sdl3Renderer'
	],
	#category : 'SDL3-OSWindow-Renderers',
	#package : 'SDL3-OSWindow',
	#tag : 'Renderers'
}

{ #category : 'instance creation' }
OSSDL3Renderer class >> for: aBackendWindow [
	^ self basicNew
		backendWindow: aBackendWindow;
		initialize;
		yourself
]

{ #category : 'accessing' }
OSSDL3Renderer >> backendWindow [
	^ backendWindow
]

{ #category : 'initialization' }
OSSDL3Renderer >> createSDL3Renderer [
	"Subclasses should create the sdl3Renderer here"
	self subclassResponsibility
]

{ #category : 'deleting' }
OSSDL3Renderer >> destroy [
	sdl3Renderer ifNotNil: [ 
		sdl3Renderer destroy.
		sdl3Renderer := nil.
	].
	super destroy
]

{ #category : 'initialization' }
OSSDL3Renderer >> initialize [
	super initialize.
	self createSDL3Renderer
]

{ #category : 'testing' }
OSSDL3Renderer >> isValid [
	^ sdl3Renderer notNil and: [ sdl3Renderer isNull not ]
]

{ #category : 'accessing' }
OSSDL3Renderer >> outputExtent [

	^ sdl3Renderer outputExtent
]

{ #category : 'updating screen' }
OSSDL3Renderer >> present [
	sdl3Renderer ifNotNil: [ sdl3Renderer renderPresent ]
]

{ #category : 'accessing' }
OSSDL3Renderer >> sdl3Renderer [
	^ sdl3Renderer
]

{ #category : 'updating screen' }
OSSDL3Renderer >> updateAll [
	super updateAll.
	self present
]

{ #category : 'updating screen' }
OSSDL3Renderer >> updateRectangle: rectangle [
	super updateRectangle: rectangle.
	self present
]
