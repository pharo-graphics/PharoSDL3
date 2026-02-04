Class {
	#name : 'SDL3BasicTest',
	#superclass : 'SDL3Test',
	#category : 'SDL3-Tests-Library',
	#package : 'SDL3-Tests',
	#tag : 'Library'
}

{ #category : 'tests' }
SDL3BasicTest >> test01GetVersion [

	self assert: sdl getVersion >= 3004000.

	self assert: sdl getRevision isString
]

{ #category : 'tests' }
SDL3BasicTest >> test02Milliseconds [

	| ticks1 ticks2 delta |
	"Get the number of milliseconds that have elapsed since the SDL library initialization"
	ticks1 := sdl getTicks.
	ticks2 := sdl getTicks.
	delta := ticks2 - ticks1.
	self assert: delta equals: 0.

	ticks1 := sdl getTicks.
	sdl delay: 5.
	ticks2 := sdl getTicks.
	delta := ticks2 - ticks1.
	self assert: delta >= 5
]

{ #category : 'tests' }
SDL3BasicTest >> test03Nanoseconds [

	| ticks1 ticks2 delta |
	"Get the number of nanoseconds since SDL library initialization"
	ticks1 := sdl getTicksNS.
	ticks2 := sdl getTicksNS.
	delta := ticks2 - ticks1.
	self assert: delta > 0.

	ticks1 := sdl getTicksNS.
	"Wait at least the specified time, but possibly longer due to OS scheduling."
	sdl delayNS: 100.
	ticks2 := sdl getTicksNS.
	self assert: ticks2 - ticks1 > delta.

	"SDL's currentTime is the number of nanoseconds since SDL library initialization."
	ticks1 := sdl currentTime.
	"Attempt to wait as close to the requested time as possible, busy waiting if
	necessary, but could return later due to OS scheduling."
	sdl delayPrecise: 100.
	ticks2 := sdl currentTime.
	self assert: ticks2 - ticks1 > delta.

]

{ #category : 'tests' }
SDL3BasicTest >> test04PerformanceCounter [

	| count1 count2 delta |
	"Number of counts per second"
	self assert: sdl getPerformanceFrequency > 0.
	
	"This is the FFI bottleneck"
	count1 := sdl getPerformanceCounter.
	count2 := sdl getPerformanceCounter.
	delta := count2 - count1.
	self assert: delta > 0
]

{ #category : 'tests' }
SDL3BasicTest >> test05CPUinfo [

	self assert: sdl getSystemRAM > 0.
	
	self assert: sdl getNumLogicalCPUCores > 0.
	
	self assert: sdl getCPUCacheLineSize > 0.

	#(#hasAltiVec #hasMMX #hasSSE #hasSSE2 #hasSSE3 #hasSSE41 #hasSSE42 #hasAVX #hasAVX2 #hasAVX512F #hasARMSIMD #hasNEON #hasLSX #hasLASX) do: [ :each |
		| result |
		result := sdl perform: each.
		self assert: result class superclass equals: Boolean ]

]

{ #category : 'tests' }
SDL3BasicTest >> test06Properties [

	| id |
	id := sdl newProperties.

	self assert:
		(sdl
			setStringPropertyProps: id
			name: 'bonjour'
			value: 'hola').

	self assert:
		(sdl
			hasPropertyProps: id
			name: 'bonjour').

	self
		assert:
			(sdl
				getStringPropertyProps: id
				name: 'bonjour'
				defaultValue: 'none')
		equals: 'hola'.

		self
			assert:
				(sdl
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
	sdl destroyProperties: id
]

{ #category : 'tests' }
SDL3BasicTest >> test07SubsystemLifecycle [
	"Note: This test initializes and quits events subsystem independently if it was already initialized"

	self assert: (sdl initSubSystem: SDL3InitFlags events).

	self
		assert: (sdl wasInit: SDL3InitFlags events)
		equals: SDL3InitFlags events value.

	sdl quitSubSystem: SDL3InitFlags events.

	self
		assert: (sdl wasInit: SDL3InitFlags events)
		equals: 0
]
