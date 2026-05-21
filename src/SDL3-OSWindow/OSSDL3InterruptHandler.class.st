"
I am an event handler that detects the user interrupt shortcut (Cmd+.).
"
Class {
	#name : 'OSSDL3InterruptHandler',
	#superclass : 'OSSDL3EventHandler',
	#category : 'SDL3-OSWindow-Events',
	#package : 'SDL3-OSWindow',
	#tag : 'Events'
}

{ #category : 'visiting' }
OSSDL3InterruptHandler >> doInterrupt [

	UserInterruptHandler new handleUserInterrupt
]

{ #category : 'visiting' }
OSSDL3InterruptHandler >> visitKeyboardDownEvent: anEvent [
	
	((anEvent mod bitAnd: SDL_KMOD_RALT) = 0 "ignore all if AltGr is pressed"
		and: ((anEvent mod anyMask: 1344) "This mask is for meta/cmd"
		and: [ anEvent key = SDLK_PERIOD asInteger ]))
			ifTrue: [ ^ self doInterrupt ].

	self forwardToNextHandler: anEvent
]
