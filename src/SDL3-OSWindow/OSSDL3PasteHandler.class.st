"
I am an event handler that detects the paste shortcut (Cmd+V).

This isssue was first detected in OSX, but we have seen the other platforms code in SDL and it is
possible the issue will happen in all platforms.

This filter will handle the case when an external Clipboard handling tool is used.
When an external tool modifies the clipboard and send a virtual paste command, it sends three events:

1) SDL_CLIPBOARDUPDATEEVENT
2) SDL_KEYDOWN with $v as the key
3) SDL KEYUP with $v as the keysym

If we find these three events, we need to modify the last two events to include defaul system modifier.
Check #changeEventsToIncludeModifier.

This is implemented with a 3 state machine.

State 1: This is the default state. All events are passed to the next filter (or the driver if there is not filter).
        If we found a Clipboard Update event, we store the event for the future, and change the state to 2. We don't dispatch the event.

State 2: It will check if the event is a KeyDown with a $V and if it is, it will store the event and change to state 3.
        If the event is other one, it will go to error state and flush all pending events, change to state one and dispatch current event.

State 3: It will check if the event is a KeyUp with a $V and if it is, it will update pending events to have the virtual modifier.
	     Then pending events are flushed.
        If the event is other one, it will go to error state and flush all pending events, change to state one and dispatch current event.

See: https://github.com/pharo-project/pharo/issues/9571
"
Class {
	#name : 'OSSDL3PasteHandler',
	#superclass : 'OSSDL3EventHandler',
	#instVars : [
		'lastEvents',
		'currentState'
	],
	#category : 'SDL3-OSWindow-Events',
	#package : 'SDL3-OSWindow',
	#tag : 'Events'
}

{ #category : 'private' }
OSSDL3PasteHandler >> changeEventsToIncludeModifier [

	| modifierToUse defaultModifier |

	"We modify the KeyUp/KeyDown events to include the correct modifier.
	This is because tools to handle copy/paste use virtual events, and SDL is dropping the modifier.

	The correct modifier is calculated depending of the current platform modifier"

	modifierToUse := 0.
	defaultModifier := OSPlatform current defaultModifier.

	defaultModifier = KMModifier command ifTrue: [ modifierToUse := SDL_KMOD_GUI ].
	defaultModifier = KMModifier alt ifTrue: [ 	modifierToUse := SDL_KMOD_LALT ].
	defaultModifier = KMModifier ctrl ifTrue: [ modifierToUse := SDL_KMOD_LCTRL ].

	lastEvents do: [ :anEvent |
		(anEvent type = SDL_EVENT_KEY_UP or: [ anEvent type = SDL_EVENT_KEY_DOWN ])
			ifTrue: [ anEvent keysym mod: (anEvent keysym mod bitOr: modifierToUse) ] ]
]

{ #category : 'private' }
OSSDL3PasteHandler >> flushEvents [

	lastEvents do: [ :aSDLEvent | self forwardToNextHandler: aSDLEvent ].
	lastEvents removeAll
]

{ #category : 'event management' }
OSSDL3PasteHandler >> handle: aSDL3MappedEvent [

	(currentState = 1 and: [ aSDL3MappedEvent type ~= SDL_EVENT_CLIPBOARD_UPDATE ])
		ifTrue: [ ^ self forwardToNextHandler: aSDL3MappedEvent ].

	(currentState = 1 and: [ aSDL3MappedEvent type = SDL_EVENT_CLIPBOARD_UPDATE ])
		ifTrue: [
			lastEvents add: aSDL3MappedEvent.
			^ currentState := 2 ].

	(currentState = 2 and: [
		aSDL3MappedEvent type = SDL_EVENT_KEY_DOWN and: [
			aSDL3MappedEvent key = SDLK_V asInteger ] ])
		ifTrue: [
			lastEvents add: aSDL3MappedEvent.
			^ currentState := 3 ].

	(currentState = 3 and: [
		aSDL3MappedEvent type = SDL_EVENT_KEY_UP and: [
			aSDL3MappedEvent key = SDLK_V asInteger ] ])
		ifTrue: [
			lastEvents add: aSDL3MappedEvent.
			self changeEventsToIncludeModifier.
			self flushEvents.
			^ currentState := 1 ].

	self flushEvents.
	currentState := 1.
	^ self forwardToNextHandler: aSDL3MappedEvent
]

{ #category : 'initialization' }
OSSDL3PasteHandler >> initialize [

	super initialize.
	
	currentState := 1.
	lastEvents := OrderedCollection new
]
