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

	self assert: LibSDL3 uniqueInstance SDL_GetVersion >= 3001006
]

{ #category : 'tests' }
LibSDL3Test >> test02GetTicks [

	| ticks1 ticks2 delta |
	ticks1 := LibSDL3 uniqueInstance SDL_GetTicks.
	ticks2 := LibSDL3 uniqueInstance SDL_GetTicks.
	delta := ticks2 - ticks1.
	self assert: delta equals: 0.

	ticks1 := LibSDL3 uniqueInstance SDL_GetTicks.
	5 milliSeconds wait.
	ticks2 := LibSDL3 uniqueInstance SDL_GetTicks.
	delta := ticks2 - ticks1.
	self assert: delta >= 5
]

{ #category : 'tests' }
LibSDL3Test >> test03Delay [

	| ticks1 ticks2 delta |
	ticks1 := LibSDL3 uniqueInstance SDL_GetTicks.
	LibSDL3 uniqueInstance SDL_Delay: 5.
	ticks2 := LibSDL3 uniqueInstance SDL_GetTicks.

	delta := ticks2 - ticks1.
	self assert: delta >= 5
]

{ #category : 'tests' }
LibSDL3Test >> test04InitAndQuitVideoSubSystem [

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
