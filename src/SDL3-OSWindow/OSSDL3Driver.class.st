"
A window driver used for running OSWindow using SDL3 library and SDL3 2D Form renderer.
"
Class {
	#name : 'OSSDL3Driver',
	#superclass : 'OSSDL3AbstractDriver',
	#category : 'SDL3-OSWindow-Core',
	#package : 'SDL3-OSWindow',
	#tag : 'Core'
}

{ #category : 'testing' }
OSSDL3Driver class >> isSuitable [
	"Answer true if the SDL3 library is available on the current platform."

	^ SDL3Library uniqueInstance isAvailable
]

{ #category : 'accessing' }
OSSDL3Driver >> newFormRenderer: form backendWindow: aBackendWindow [

	^ OSSDL3FormRenderer new
		form: form;
		backendWindow: aBackendWindow;
		yourself
]

{ #category : 'events-processing' }
OSSDL3Driver >> waitUntilNextEventLoopIteration [

	(Delay forMilliseconds: OSSDL3SystemSettings eventLoopPeriodMS) wait
]
