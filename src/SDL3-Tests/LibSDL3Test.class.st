"
A LibSDL3Test is a test class for testing the behavior of LibSDL3
"
Class {
	#name : 'LibSDL3Test',
	#superclass : 'TestCase',
	#instVars : [
		'lib'
	],
	#category : 'SDL3-Tests-Library',
	#package : 'SDL3-Tests',
	#tag : 'Library'
}

{ #category : 'running' }
LibSDL3Test >> setUp [

	super setUp.

	lib := LibSDL3 uniqueInstance
]

{ #category : 'tests' }
LibSDL3Test >> test01GetVersion [

	self assert: lib SDL_GetVersion >= 3001006.
	
	self assert: (lib SDL_GetRevision beginsWith: 'release-3')
]

{ #category : 'tests' }
LibSDL3Test >> test02GetTicksAndDelay [

	| ticks1 ticks2 delta |
	ticks1 := lib SDL_GetTicks.
	ticks2 := lib SDL_GetTicks.
	delta := ticks2 - ticks1.
	self assert: delta equals: 0.

	ticks1 := lib SDL_GetTicks.
	lib SDL_Delay: 5.
	ticks2 := lib SDL_GetTicks.
	delta := ticks2 - ticks1.
	self assert: delta >= 5
]

{ #category : 'tests' }
LibSDL3Test >> test03GetTicksNSAndDelayNS [

	| ticks1 ticks2 delta |
	ticks1 := lib SDL_GetTicksNS.
	ticks2 := lib SDL_GetTicksNS.
	delta := ticks2 - ticks1.
	self assert: delta > 0.

	ticks1 := lib SDL_GetTicksNS.
	lib SDL_DelayNS: 100000.
	ticks2 := lib SDL_GetTicksNS.
	self assert: ticks2 - ticks1 > delta
]

{ #category : 'tests' }
LibSDL3Test >> test04PerformanceCounter [

	| count1 count2 delta |
	"Number of counts per second"
	self assert: lib SDL_GetPerformanceFrequency > 0.
	
	"This is the FFI bottleneck"
	count1 := lib SDL_GetPerformanceCounter.
	count2 := lib SDL_GetPerformanceCounter.
	delta := count2 - count1.
	self assert: delta > 0
]

{ #category : 'tests' }
LibSDL3Test >> test05CPUinfo [

	self assert: lib SDL_GetSystemRAM > 0.
	
	self assert: lib SDL_GetNumLogicalCPUCores > 0.
	
	self assert: lib SDL_GetCPUCacheLineSize > 0.

	#(SDL_HasAltiVec SDL_HasMMX SDL_HasSSE SDL_HasSSE2 SDL_HasSSE3 SDL_HasSSE41 SDL_HasSSE42 SDL_HasAVX SDL_HasAVX2 SDL_HasAVX512F SDL_HasARMSIMD SDL_HasNEON SDL_HasLSX SDL_HasLASX) do: [ :each |
		| result |
		result := lib perform: each.
		self assert: result class superclass equals: Boolean ]

]

{ #category : 'tests' }
LibSDL3Test >> test06FilesystemAPI [

	self
		assert: lib SDL_GetCurrentDirectory asFileReference 
		equals: '.' asFileReference.
	
	self assert:
		(FileLocator vmDirectory asPath <=
			lib SDL_GetBasePath asFileReference asPath)
]

{ #category : 'tests' }
LibSDL3Test >> test07VideoSubsystemLifecycle [

	"Video subsystem may be already initialized"
	(lib SDL_WasInit: S3SDLInitFlags SDL_INIT_VIDEO) =
		S3SDLInitFlags SDL_INIT_VIDEO value ifTrue: [ ^ self skip ].

	self assert: (lib SDL_InitSubSystem: S3SDLInitFlags SDL_INIT_VIDEO).

	self
		assert: (lib SDL_WasInit: S3SDLInitFlags SDL_INIT_VIDEO)
		equals: S3SDLInitFlags SDL_INIT_VIDEO value.

	lib SDL_QuitSubSystem: S3SDLInitFlags SDL_INIT_VIDEO.

	self
		assert: (lib SDL_WasInit: S3SDLInitFlags SDL_INIT_VIDEO)
		equals: 0
]
