"
A LibSDL3Test is a test class for testing the behavior of LibSDL3
"
Class {
	#name : 'LibSDL3Test',
	#superclass : 'TestCase',
	#category : 'SDL3-Tests-Library',
	#package : 'SDL3-Tests',
	#tag : 'Library'
}

{ #category : 'tests' }
LibSDL3Test >> test01GetVersion [

	self
		assert: LibSDL3 uniqueInstance SDL_GetVersion
		equals: 3001009
]

{ #category : 'tests' }
LibSDL3Test >> test02InitAndQuitVideoSubSystem [

	self
		assert: (LibSDL3 uniqueInstance SDL_WasInit: S3SDL_InitFlagsE SDL_INIT_VIDEO value)
		equals: 0.
	
	LibSDL3 uniqueInstance SDL_InitSubSystem: S3SDL_InitFlagsE SDL_INIT_VIDEO value.

	self
		deny: (LibSDL3 uniqueInstance SDL_WasInit: S3SDL_InitFlagsE SDL_INIT_VIDEO value)
		equals: 0.

	LibSDL3 uniqueInstance SDL_QuitSubSystem: S3SDL_InitFlagsE SDL_INIT_VIDEO value.

	self
		assert: (LibSDL3 uniqueInstance SDL_WasInit: S3SDL_InitFlagsE SDL_INIT_VIDEO value)
		equals: 0
]
