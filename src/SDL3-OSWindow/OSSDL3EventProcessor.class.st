"
I'm responsible of converting a `SDL3Event` into a `OSEvent` using Visitor design pattern.
"
Class {
	#name : 'OSSDL3EventProcessor',
	#superclass : 'Object',
	#traits : 'TSDL3HierarchicalEventVisitor',
	#classTraits : 'TSDL3HierarchicalEventVisitor classTrait',
	#instVars : [
		'eventMap'
	],
	#classVars : [
		'CharacterByKeycodeMapping'
	],
	#pools : [
		'SDL3Keymod',
		'SDL3MouseButtonFlagsMask'
	],
	#category : 'SDL3-OSWindow-Events',
	#package : 'SDL3-OSWindow',
	#tag : 'Events'
}

{ #category : 'class initialization' }
OSSDL3EventProcessor class >> initialize [

	CharacterByKeycodeMapping := Dictionary newFromPairs: {
		SDLK_RETURN . Character cr.
		SDLK_KP_ENTER. Character cr.
		SDLK_BACKSPACE . Character backspace.
		SDLK_TAB . Character tab.
		SDLK_HOME . Character home.
		SDLK_LEFT . Character arrowLeft.
		SDLK_UP . Character arrowUp.
		SDLK_RIGHT . Character arrowRight.
		SDLK_DOWN . Character arrowDown.
		SDLK_END . Character end.
		SDLK_INSERT . Character insert.
		SDLK_PAGEUP . Character pageUp.
		SDLK_PAGEDOWN . Character pageDown.
		SDLK_DELETE. Character delete }
]

{ #category : 'private' }
OSSDL3EventProcessor >> convertButtonState: mouseStateOrNil modifiers: modifiers [
	"Update the modifiers object based on the current mouse and modifier key states."

	| mouseState modState |
	mouseState := mouseStateOrNil ifNil: [
		LibSDL3 uniqueInstance
			getMouseStateX: ExternalAddress null
			y: ExternalAddress null ].

	modifiers buttons
		button1: (SDL_BUTTON_LMASK anyMask: mouseState);
		button2: (SDL_BUTTON_MMASK anyMask: mouseState);
		button3: (SDL_BUTTON_RMASK anyMask: mouseState);
		button4: (SDL_BUTTON_X1MASK anyMask: mouseState);
		button5: (SDL_BUTTON_X2MASK anyMask: mouseState).

	modState := LibSDL3 uniqueInstance getModState.

	modifiers
		leftShift: (SDL_KMOD_LSHIFT anyMask: modState);
		rightShift: (SDL_KMOD_RSHIFT anyMask: modState);
		leftCtrl: (SDL_KMOD_LCTRL anyMask: modState);
		rightCtrl: (SDL_KMOD_RCTRL anyMask: modState);
		leftAlt: (SDL_KMOD_LALT anyMask: modState);
		rightAlt: (SDL_KMOD_RALT anyMask: modState);
		leftCmd: (SDL_KMOD_LGUI anyMask: modState);
		rightCmd: (SDL_KMOD_RGUI anyMask: modState);
		numLock: (SDL_KMOD_NUM anyMask: modState)
]

{ #category : 'events' }
OSSDL3EventProcessor >> deliver: aSDL3Event on: aSDL3Driver [

	| mappedEvent osEvent |
	mappedEvent := eventMap value: aSDL3Event.
	
	osEvent := mappedEvent accept: self.
	osEvent ifNil: [ ^ nil ]. "Some events are discarded"

	mappedEvent windowID
		ifNil: [
			aSDL3Driver deliverGlobalEvent: osEvent ]
		ifNotNil: [
			aSDL3Driver
				deliverEvent: osEvent
				windowID: mappedEvent windowID ]
]

{ #category : 'initialization' }
OSSDL3EventProcessor >> initialize [

	super initialize.

	"SDL3Event union -> SDL3MappedEvent"
	eventMap := SDL3EventMap new
]

{ #category : 'private' }
OSSDL3EventProcessor >> mousePosition [
	"Answer the current mouse position relative to this window."

	^ LibSDL3 uniqueInstance mousePosition
]

{ #category : 'private' }
OSSDL3EventProcessor >> updateKeyboardEvent: osEvent from: anSDLKeyboardEvent [

	osEvent 
		scanCode: anSDLKeyboardEvent scancode;
		symbol: anSDLKeyboardEvent key;
		repeat: anSDLKeyboardEvent repeat;
		position: self mousePosition;
		character:
			(CharacterByKeycodeMapping
				at: anSDLKeyboardEvent key
				ifAbsent: [ nil ]).

	self convertButtonState: nil modifiers: osEvent modifiers
]

{ #category : 'visiting - conversion' }
OSSDL3EventProcessor >> visitDropFileEvent: anSDLEvent [

	^ OSWindowDropEvent new
		timestamp: anSDLEvent timestamp;
		filePath: anSDLEvent data utf8StringFromCString;
		yourself
]

{ #category : 'visiting - conversion' }
OSSDL3EventProcessor >> visitKeyboardDownEvent: anEvent [

	| osEvent |
	osEvent := OSKeyDownEvent new.
	self updateKeyboardEvent: osEvent from: anEvent.
	^ osEvent
]

{ #category : 'visiting - conversion' }
OSSDL3EventProcessor >> visitKeyboardUpEvent: anEvent [

	| osEvent |
	osEvent := OSKeyUpEvent new.
	self updateKeyboardEvent: osEvent from: anEvent.
	^ osEvent
]

{ #category : 'visiting - conversion' }
OSSDL3EventProcessor >> visitMappedEvent: aVisitor [

	^ nil
]

{ #category : 'visiting - conversion' }
OSSDL3EventProcessor >> visitMouseButtonDownEvent: anEvent [

	| osEvent |
	osEvent := OSMouseButtonPressEvent new.
	osEvent
		button: anEvent button;
		position: anEvent x @ anEvent y.

	self
		convertButtonState: nil
		modifiers: osEvent modifiers.

	^ osEvent
]

{ #category : 'visiting - conversion' }
OSSDL3EventProcessor >> visitMouseButtonUpEvent: anEvent [

	| osEvent |
	osEvent := OSMouseButtonReleaseEvent new.
	osEvent
		button: anEvent button;
		position: anEvent x @ anEvent y.

	self
		convertButtonState: nil
		modifiers: osEvent modifiers.

	^ osEvent
]

{ #category : 'visiting - conversion' }
OSSDL3EventProcessor >> visitMouseMotionEvent: anSDLEvent [

	| osEvent |
	osEvent := OSMouseMoveEvent new.
	osEvent
		position: anSDLEvent x @ anSDLEvent y;
		delta: anSDLEvent xrel @ anSDLEvent yrel.

	self
		convertButtonState: anSDLEvent state
		modifiers: osEvent modifiers.

	^ osEvent
]

{ #category : 'visiting - conversion' }
OSSDL3EventProcessor >> visitMouseWheelEvent: anSDLEvent [

	| osEvent |
	osEvent := OSMouseWheelEvent new.
	osEvent
		position: self mousePosition;
		scrollHorizontal: anSDLEvent x;
		scrollVertical: anSDLEvent y.

	self
		convertButtonState: nil
		modifiers: osEvent modifiers.

	^ osEvent
]

{ #category : 'visiting - conversion' }
OSSDL3EventProcessor >> visitTextEditingEvent: anEvent [

	^ OSTextEditingEvent new
		text: anEvent text utf8StringFromCString;
		position: self mousePosition;
		start: anEvent start;
		length: anEvent length;
		yourself
]

{ #category : 'visiting - conversion' }
OSSDL3EventProcessor >> visitTextInputEvent: anEvent [

	^ OSTextInputEvent new
		text: anEvent text utf8StringFromCString;
		position: self mousePosition;
		yourself
]

{ #category : 'visiting - conversion' }
OSSDL3EventProcessor >> visitWindowCloseRequestedEvent: anEvent [
	"Handle the window close request from SDL."

	^ OSWindowCloseEvent new
]

{ #category : 'visiting - conversion' }
OSSDL3EventProcessor >> visitWindowDisplayScaleChangedEvent: anEvent [
	"Handle the window display scale change."

	^ OSWindowResolutionChangeEvent new
		screenScaleFactor: anEvent window displayScale;
		yourself
]

{ #category : 'visiting - conversion' }
OSSDL3EventProcessor >> visitWindowExposedEvent: anEvent [
	"Handle the window expose event."

	^ OSWindowExposeEvent new
		timestamp: anEvent timestamp;
		yourself
]

{ #category : 'visiting - conversion' }
OSSDL3EventProcessor >> visitWindowFocusGainedEvent: anEvent [
	"Handle the window gaining input focus."

	^ OSWindowFocusInEvent new
]

{ #category : 'visiting - conversion' }
OSSDL3EventProcessor >> visitWindowFocusLostEvent: anEvent [
	"Handle the window losing input focus."

	^ OSWindowFocusOutEvent new
]

{ #category : 'visiting - conversion' }
OSSDL3EventProcessor >> visitWindowHiddenEvent: anEvent [
	"Handle the window becoming hidden."

	^ OSWindowHiddenEvent new
]

{ #category : 'visiting - conversion' }
OSSDL3EventProcessor >> visitWindowMaximizedEvent: anEvent [
	"Handle the window being maximized."

	^ OSWindowMaximizedEvent new
]

{ #category : 'visiting - conversion' }
OSSDL3EventProcessor >> visitWindowMinimizedEvent: anEvent [
	"Handle the window being minimized."

	^ OSWindowMinimizedEvent new
]

{ #category : 'visiting - conversion' }
OSSDL3EventProcessor >> visitWindowMouseEnterEvent: anEvent [
	"Handle the mouse cursor entering the window."

	^ OSWindowMouseEnterEvent new
]

{ #category : 'visiting - conversion' }
OSSDL3EventProcessor >> visitWindowMouseLeaveEvent: anEvent [
	"Handle the mouse cursor leaving the window."

	^ OSWindowMouseLeaveEvent new
]

{ #category : 'visiting - conversion' }
OSSDL3EventProcessor >> visitWindowMovedEvent: anEvent [
	"Handle the window being moved."

	^ OSWindowMoveEvent new
]

{ #category : 'visiting - conversion' }
OSSDL3EventProcessor >> visitWindowPixelSizeChangedEvent: anEvent [
	"Handle the window pixel size change."

	^ OSWindowResolutionChangeEvent new
		screenScaleFactor: anEvent window displayScale;
		yourself
]

{ #category : 'visiting - conversion' }
OSSDL3EventProcessor >> visitWindowResizedEvent: anEvent [
	"Handle the window being resized."

	^ OSWindowResizeEvent new
		width: anEvent data1;
		height: anEvent data2;
		yourself
]

{ #category : 'visiting - conversion' }
OSSDL3EventProcessor >> visitWindowShownEvent: anEvent [
	"Handle the window being shown."

	^ OSWindowShownEvent new
		timestamp: anEvent timestamp;
		yourself
]
