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

	self assert: lib getVersion >= 3001006.
	
	self assert: lib getRevision isString
]

{ #category : 'tests' }
LibSDL3Test >> test02GetTicksAndDelay [

	| ticks1 ticks2 delta |
	ticks1 := lib getTicks.
	ticks2 := lib getTicks.
	delta := ticks2 - ticks1.
	self assert: delta equals: 0.

	ticks1 := lib getTicks.
	lib delay: 5.
	ticks2 := lib getTicks.
	delta := ticks2 - ticks1.
	self assert: delta >= 5
]

{ #category : 'tests' }
LibSDL3Test >> test03GetTicksNSAndDelayNS [

	| ticks1 ticks2 delta |
	ticks1 := lib getTicksNS.
	ticks2 := lib getTicksNS.
	delta := ticks2 - ticks1.
	self assert: delta > 0.

	ticks1 := lib getTicksNS.
	lib delayNS: 100000.
	ticks2 := lib getTicksNS.
	self assert: ticks2 - ticks1 > delta
]

{ #category : 'tests' }
LibSDL3Test >> test04PerformanceCounter [

	| count1 count2 delta |
	"Number of counts per second"
	self assert: lib getPerformanceFrequency > 0.
	
	"This is the FFI bottleneck"
	count1 := lib getPerformanceCounter.
	count2 := lib getPerformanceCounter.
	delta := count2 - count1.
	self assert: delta > 0
]

{ #category : 'tests' }
LibSDL3Test >> test05CPUinfo [

	self assert: lib getSystemRAM > 0.
	
	self assert: lib getNumLogicalCPUCores > 0.
	
	self assert: lib getCPUCacheLineSize > 0.

	#(#hasAltiVec #hasMMX #hasSSE #hasSSE2 #hasSSE3 #hasSSE41 #hasSSE42 #hasAVX #hasAVX2 #hasAVX512F #hasARMSIMD #hasNEON #hasLSX #hasLASX) do: [ :each |
		| result |
		result := lib perform: each.
		self assert: result class superclass equals: Boolean ]

]

{ #category : 'tests' }
LibSDL3Test >> test06FilesystemAPI [

	self
		assert: lib getCurrentDirectory asFileReference 
		equals: '.' asFileReference.
	
	self assert:
		(FileLocator vmDirectory asPath <=
			lib getBasePath asFileReference asPath)
]

{ #category : 'tests' }
LibSDL3Test >> test07VideoSubsystemLifecycle [

	"Video subsystem may be already initialized"
	(lib wasInit: SDL3InitFlags video) =
		SDL3InitFlags video value ifTrue: [ ^ self skip ].

	self assert: (lib initSubSystem: SDL3InitFlags video).

	self
		assert: (lib wasInit: SDL3InitFlags video)
		equals: SDL3InitFlags video value.

	lib quitSubSystem: SDL3InitFlags video.

	self
		assert: (lib wasInit: SDL3InitFlags video)
		equals: 0
]

{ #category : 'tests' }
LibSDL3Test >> test08Properties [

	| id |
	id := lib newProperties.

	self assert:
		(lib
			setStringPropertyProps: id
			name: 'bonjour'
			value: 'hola').

	self assert:
		(lib
			hasPropertyProps: id
			name: 'bonjour').

	self
		assert:
			(lib
				getStringPropertyProps: id
				name: 'bonjour'
				defaultValue: 'none')
		equals: 'hola'.

		self
			assert:
				(lib
					getPropertyTypeProps: id
					name: 'bonjour')
			equals: SDL3PropertyType string.

"	self
		assert:
			(lib
				SDL_GetStringPropertyProps: id
				name: 'HELLO'
				default_value: 'none')
		equals: 'none'.
"
	lib destroyProperties: id
]
