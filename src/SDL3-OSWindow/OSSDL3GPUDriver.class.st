"
I am a OSWindow driver that uses the low-level GPU API of SDL3 to create window Form renderer.
"
Class {
	#name : 'OSSDL3GPUDriver',
	#superclass : 'OSSDL3AbstractDriver',
	#instVars : [
		'gpuDevice',
		'lastUS'
	],
	#category : 'SDL3-OSWindow-Core',
	#package : 'SDL3-OSWindow',
	#tag : 'Core'
}

{ #category : 'testing' }
OSSDL3GPUDriver class >> isSuitable [
	"Answer true if the SDL3 library is available on the current platform."

	^ SDL3Library uniqueInstance isAvailable
]

{ #category : 'accessing' }
OSSDL3GPUDriver >> gpuDevice [
	"Answer the shared SDL3 GPU device"

	^ gpuDevice
]

{ #category : 'initialization' }
OSSDL3GPUDriver >> initializeSDL3Library [
	"Initialize the library and then a GPU device (which is shared by all windows)"

	super initializeSDL3Library.

	gpuDevice :=
		SDL_GPUDevice unownedNewDebugMode:
			OSSDL3SystemSettings debugEnabled.

	self class allWindows do: [ :each |
		each isValid ifTrue: [
			each gpuDevice: gpuDevice ] ]
]

{ #category : 'accessing' }
OSSDL3GPUDriver >> newFormRenderer: form backendWindow: aBackendWindow [

	self assert: [ gpuDevice isNil not and: [ gpuDevice isNull not ] ].

	^ OSSDL3GPUFormRenderer new
		form: form;
		backendWindow: aBackendWindow;
		gpuDevice: gpuDevice;
		yourself
]

{ #category : 'window creation' }
OSSDL3GPUDriver >> prepareBackendWindow: aBackendWindow [

	self assert: [ gpuDevice isNil not and: [ gpuDevice isNull not ] ].
	gpuDevice claimWindow: aBackendWindow sdlWindow
]

{ #category : 'events-processing' }
OSSDL3GPUDriver >> runEventLoop [

	lastUS := Time microsecondClockValue.
	super runEventLoop
]

{ #category : 'system startup' }
OSSDL3GPUDriver >> shutDown: quitting [

	quitting ifTrue: [
		gpuDevice ifNotNil: [
			self class allWindows do: [ :each |
				each gpuDevice: nil ].
			gpuDevice destroy.
			gpuDevice := nil ] ].

	super shutDown: quitting
]

{ #category : 'events-processing' }
OSSDL3GPUDriver >> waitSpareTime [
	"Wait according to the expected loop period"

	| waitMS elapsedUS currentUS |
	currentUS := Time microsecondClockValue.
	elapsedUS := currentUS - lastUS.
	lastUS := currentUS.

	"Wait if spare time is at least 1ms.
	(1 millisecond = 1000 microseconds)"
	waitMS := (OSSDL3SystemSettings eventLoopPeriodMS * 1000 - elapsedUS) // 1000.
	waitMS > 0 ifTrue: [ (Delay forMilliseconds: waitMS) wait ]
]

{ #category : 'events-processing' }
OSSDL3GPUDriver >> waitUntilNextEventLoopIteration [
	"We try to flush window renderers while needed, for a limited number of times.
	In any case, we will send #waitCapped to wait more if needed"

	OSSDL3SystemSettings eventLoopPeriodMS timesRepeat: [
		| stillNeedFlush |
		stillNeedFlush := false.
		self class allWindows do: [ :each |
			stillNeedFlush := stillNeedFlush | each rendererFlush ].

		stillNeedFlush ifFalse: [ ^ self waitSpareTime ].

		(Delay forMilliseconds: 1) wait ].

	self waitSpareTime
]
