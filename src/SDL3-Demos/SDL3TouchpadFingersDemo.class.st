"
I demonstrate how to handle multi-touch finger events.
"
Class {
	#name : 'SDL3TouchpadFingersDemo',
	#superclass : 'SDL3ConsoleDemoApp',
	#instVars : [
		'colorWheel'
	],
	#category : 'SDL3-Demos-API',
	#package : 'SDL3-Demos',
	#tag : 'API'
}

{ #category : 'accessing' }
SDL3TouchpadFingersDemo >> initialExtent [

	^ 800 @ 600
]

{ #category : 'initialization' }
SDL3TouchpadFingersDemo >> initialize [

	super initialize.

	console defaultColor: Color gray.
	colorWheel := Color wheel: 11 "Colors for the fingers"
]

{ #category : 'lifecycle' }
SDL3TouchpadFingersDemo >> sdlInit [

	"Disable touch-to-mouse emulation and enable trackpad touch"
	sdl setHintName: SDL_HINT_TOUCH_MOUSE_EVENTS value: '0'.
	sdl setHintName: SDL_HINT_TRACKPAD_IS_TOUCH_ONLY value: '1'.

	super sdlInit.
	
	SDL3Cursor hide "We draw the fingers instead of the mouse cursor"
]

{ #category : 'hooks' }
SDL3TouchpadFingersDemo >> step [

	| extent touchIDs |
	self clearColor: Color black.
	
	touchIDs := sdl allTouchIDs.
	touchIDs ifEmpty: [ console addLine: 'No touch devices found' ].
	
	extent := window pixelExtent.
	
	touchIDs do: [ :eachID |
		(sdl allFingersOf: eachID) do: [ :eachFinger |
			| position size rectangle |

			"Color based on finger ID"
			renderer renderDrawColor: (colorWheel atWrap: eachFinger id).

			"Scale size based on pressure (0.0 to 1.0). Minimum size is 30px."
			position := (eachFinger x * extent x) @ (eachFinger y * extent y).
			size := (30 + (eachFinger pressure * 50)) rounded.
			rectangle := Rectangle center: position extent: size @ size.
			renderer renderFillRect: (SDL_FRect newFrom: rectangle).

			"Label"
			renderer renderDrawColor: Color white.
			renderer
				renderDebugTextX: position x
				y: position y
				str: ('F{1} P:{2}' format: {
					eachFinger id.
					eachFinger pressure printShowingDecimalPlaces: 2 }) ] ].

	self present
]

{ #category : 'visiting - concrete' }
SDL3TouchpadFingersDemo >> visitTouchFingerDownEvent: anEvent [

	console addLine: ('Finger DOWN: {1} (Touch:{2})' format: { anEvent fingerID. anEvent touchID })
]

{ #category : 'visiting - concrete' }
SDL3TouchpadFingersDemo >> visitTouchFingerMotionEvent: anEvent [

	console addLine: ('Finger MOVE: {1} x:{2} y:{3}' format: { 
		anEvent fingerID. 
		anEvent x printShowingDecimalPlaces: 2. 
		anEvent y printShowingDecimalPlaces: 2 })
]

{ #category : 'visiting - concrete' }
SDL3TouchpadFingersDemo >> visitTouchFingerUpEvent: anEvent [

	console addLine: ('Finger UP: {1}' format: { anEvent fingerID })
]
