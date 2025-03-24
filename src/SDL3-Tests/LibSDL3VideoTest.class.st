Class {
	#name : 'LibSDL3VideoTest',
	#superclass : 'TestCase',
	#category : 'SDL3-Tests-Library',
	#package : 'SDL3-Tests',
	#tag : 'Library'
}

{ #category : 'running' }
LibSDL3VideoTest >> setUp [

	super setUp.

	"Return early if video subsystem is already initialized"
	(LibSDL3 uniqueInstance SDL_WasInit: S3SDL_InitFlagsE SDL_INIT_VIDEO)
		= S3SDL_InitFlagsE SDL_INIT_VIDEO value ifTrue: [ ^ self ].
	
	"Initialize the video subsystem"
	self assert: (LibSDL3 uniqueInstance SDL_InitSubSystem: S3SDL_InitFlagsE SDL_INIT_VIDEO).
]

{ #category : 'running' }
LibSDL3VideoTest >> tearDown [

	(LibSDL3 uniqueInstance SDL_WasInit: S3SDL_InitFlagsE SDL_INIT_VIDEO)
		= S3SDL_InitFlagsE SDL_INIT_VIDEO ifFalse: [
			LibSDL3 uniqueInstance SDL_QuitSubSystem:
				S3SDL_InitFlagsE SDL_INIT_VIDEO ].

	super tearDown
]

{ #category : 'tests' }
LibSDL3VideoTest >> test01ClipboardAPI [

	"Copy&paste a non-ASCII string"
	self assert: (LibSDL3 uniqueInstance SDL_SetClipboardText: 'Hëllo').
	self assert: LibSDL3 uniqueInstance SDL_HasClipboardText.
	self assert: LibSDL3 uniqueInstance SDL_GetClipboardText equals: 'Hëllo'.

	"Clear"
	self assert: LibSDL3 uniqueInstance SDL_ClearClipboardData.
	self deny: LibSDL3 uniqueInstance SDL_HasClipboardText
]

{ #category : 'tests' }
LibSDL3VideoTest >> test02CreateWindow [

	| window |
	window :=
		LibSDL3 uniqueInstance
			SDL_CreateWindowTitle: 'Pharo SDL3' w: 800 h: 600 flags: 0.

	0.5 second wait.

	self deny: window isNull.
	
	LibSDL3 uniqueInstance SDL_ClearError.
	LibSDL3 uniqueInstance SDL_DestroyWindow: window.
	self assert: LibSDL3 uniqueInstance SDL_GetError isEmpty
]

{ #category : 'tests' }
LibSDL3VideoTest >> test03CreateWindowAndRenderer [

	| window renderer success |
	window := S3SDL_Window newPointer.
	renderer := S3SDL_Renderer newPointer.

	success :=
		LibSDL3 uniqueInstance
			SDL_CreateWindowAndRendererTitle: 'Pharo SDL3'
			width: 800
			height: 600
			window_flags: 0
			window: window
			renderer: renderer.
	self assert: success.
	
	0.5 second wait.

	LibSDL3 uniqueInstance SDL_ClearError.
	LibSDL3 uniqueInstance SDL_DestroyRenderer: renderer getHandle.
	self assert: LibSDL3 uniqueInstance SDL_GetError equals: ''.
	LibSDL3 uniqueInstance SDL_DestroyWindow: window getHandle.
	self assert: LibSDL3 uniqueInstance SDL_GetError equals: ''
]

{ #category : 'tests' }
LibSDL3VideoTest >> test04CreateRenderer [

	| success window renderer |
	window :=
		LibSDL3 uniqueInstance
			SDL_CreateWindowTitle: 'Pharo SDL3' w: 800 h: 600 flags: 0.
	success := window isNull not.
	self assert: success.

	renderer := LibSDL3 uniqueInstance SDL_CreateRendererWindow: window name: nil.
	success := renderer isNull not.
	self assert: success.

	"Set cyan color"
	success :=
		LibSDL3 uniqueInstance
			SDL_SetRenderDrawColorFloatRenderer: renderer
			r: 0.0
			g: 1.0
			b: 1.0
			a: 0.0.
	self assert: success.

	"Let's clear with that color"
	success := LibSDL3 uniqueInstance SDL_RenderClear: renderer.
	self assert: success.

	"Present will actually apply the clear operation"
	success := LibSDL3 uniqueInstance SDL_RenderPresent: renderer.
	self assert: success.

	0.5 second wait.
	
	"Tear down"
	LibSDL3 uniqueInstance SDL_ClearError.
	LibSDL3 uniqueInstance SDL_DestroyRenderer: renderer.
	self assert: LibSDL3 uniqueInstance SDL_GetError equals: ''.
	LibSDL3 uniqueInstance SDL_DestroyWindow: window.
	self assert: LibSDL3 uniqueInstance SDL_GetError equals: ''
]
