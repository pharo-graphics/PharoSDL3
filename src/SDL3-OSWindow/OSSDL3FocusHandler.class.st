"
I am responsible for restoring the window's mouse cursor when it gains input focus.
I listen for focus-gain events and ensure the backend window sets its current cursor active.
"
Class {
	#name : 'OSSDL3FocusHandler',
	#superclass : 'OSSDL3EventHandler',
	#instVars : [
		'driver'
	],
	#category : 'SDL3-OSWindow-Events',
	#package : 'SDL3-OSWindow',
	#tag : 'Events'
}

{ #category : 'accessing' }
OSSDL3FocusHandler >> driver [

	^ driver
]

{ #category : 'accessing' }
OSSDL3FocusHandler >> driver: anObject [

	driver := anObject
]

{ #category : 'visiting - concrete' }
OSSDL3FocusHandler >> visitWindowFocusGainedEvent: anEvent [

	(driver backendWindowWithId: anEvent windowID) ifNotNil: [ :win |
		win ensureSetCurrentCursor ].

	^ self forwardToNextHandler: anEvent
]
