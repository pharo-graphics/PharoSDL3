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

	^ 720 @ 720
]

{ #category : 'initialization' }
SDL3TouchpadFingersDemo >> initialize [

	super initialize.
	colorWheel := Color wheel: 20
]

{ #category : 'lifecycle' }
SDL3TouchpadFingersDemo >> sdlInit [

	"Disable touch-to-mouse emulation and enable trackpad touch"
	sdl setHintName: SDL_HINT_TOUCH_MOUSE_EVENTS value: '0'.
	sdl setHintName: SDL_HINT_TRACKPAD_IS_TOUCH_ONLY value: '1'.

	super sdlInit
]

{ #category : 'hooks' }
SDL3TouchpadFingersDemo >> step [

	| extent touchIDs |
	self clearColor: Color black.
	
	touchIDs := sdl allTouchIDs.
	touchIDs ifEmpty: [ self log: 'No touch devices found' ].
	
	extent := window pixelExtent.
	
	touchIDs do: [ :eachID |
		(sdl allFingersOf: eachID) do: [ :eachFinger |
			| position size rectangle |

			"Color based on finger ID"
			self color: (colorWheel at: (eachFinger id \\ colorWheel size + 1)).

			"Scale size based on pressure (0.0 to 1.0). Minimum size is 30px."
			position := (eachFinger x * extent x) @ (eachFinger y * extent y).
			size := (30 + (eachFinger pressure * 50)) rounded.
			rectangle := Rectangle center: position extent: size @ size.
			renderer renderFillRect: (SDL_FRect newFrom: rectangle).

			self
				showText: ('F{1} P:{2}' format: {
					eachFinger id.
					eachFinger pressure printShowingDecimalPlaces: 2 })
				x: position x
				y: position y
				color: Color white ] ].

	self present
]

{ #category : 'visiting - concrete' }
SDL3TouchpadFingersDemo >> visitTouchFingerDownEvent: anEvent [

	self log: ('Finger DOWN: {1} (Touch:{2})' format: { anEvent fingerID . anEvent touchID })
]

{ #category : 'visiting - concrete' }
SDL3TouchpadFingersDemo >> visitTouchFingerMotionEvent: anEvent [

	self log: ('Finger MOVE: {1} x:{2} y:{3}' format: { 
		anEvent fingerID . 
		anEvent x printShowingDecimalPlaces: 2 . 
		anEvent y printShowingDecimalPlaces: 2 })
]

{ #category : 'visiting - concrete' }
SDL3TouchpadFingersDemo >> visitTouchFingerUpEvent: anEvent [

	self log: ('Finger UP: {1}' format: { anEvent fingerID })
]
