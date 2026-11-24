"
This demo shows mouse control features, including mouse grab, relative mouse mode, cursor visibility, warping, and system cursors.
"
Class {
	#name : 'SDL3MouseDemoApp',
	#superclass : 'SDL3RendererDemoApp',
	#instVars : [
		'cursorIdGenerator',
		'cursorId',
		'cursor'
	],
	#category : 'SDL3-Demos-API',
	#package : 'SDL3-Demos',
	#tag : 'API'
}

{ #category : 'private' }
SDL3MouseDemoApp >> activateNextSystemCursor [

	cursorId := cursorIdGenerator next.
	cursor ifNotNil: [ cursor dispose ].
	DiScope own: (cursor := SDL3Cursor unownedNewSystemCursor: cursorId).
	cursor setActive
]

{ #category : 'accessing' }
SDL3MouseDemoApp >> initialExtent [

	^ 800 @ 240
]

{ #category : 'initialization' }
SDL3MouseDemoApp >> initializeKeybindings [

	self
		bindKey: SDLK_M
		description: 'Toggle mouse grab'
		action: [ window mouseGrabbed: window isMouseGrabbed not ];
		bindKey: SDLK_R
		description: 'Toggle relative mouse mode'
		action: [ window relativeMouseModeEnabled: window isRelativeMouseMode not ];
		bindKey: SDLK_C
		description: 'Toggle cursor visibility'
		action: [ SDL3Cursor toggleVisible ];
		bindKey: SDLK_W
		description: 'Warp mouse to (10, 10)'
		action: [ window warpMouseInX: 10 y: 10 ];
		bindKey: SDLK_L
		description: 'Toggle locked mouse rectangle'
		action: [ self toggleLockedMouseRectangle ];
		bindKey: SDLK_N
		description: 'Activate next system cursor'
		action: [ self activateNextSystemCursor ].
	super initializeKeybindings
]

{ #category : 'lifecycle' }
SDL3MouseDemoApp >> setUp [

	super setUp.

	cursorIdGenerator := Generator on: [ :g |
		[ (SDL3SystemCursor allValues
				sorted: [ :a :b | a value < b value ])
				do: [ :each | g yield: each ]
		] repeat ].

	self activateNextSystemCursor
]

{ #category : 'hooks' }
SDL3MouseDemoApp >> step [

	| x y mousePosition globalMousePosition pressedButtons mouseSDLRect isMouseLocked |
	self clearColor: Color black.

	x := 20.
	y := 20.

	self showText: ('M: Mouse Grabbed: ', window isMouseGrabbed asString, ' - Confines the cursor within the window boundaries.')
		x: x y: y
		color: (window isMouseGrabbed ifTrue: [ Color green ] ifFalse: [ Color white ]).

	self showText: ('R: Relative Mouse Mode: ', window isRelativeMouseMode asString, ' - Hides cursor; sends motion as deltas.')
		x: x y: y + 15
		color: (window isRelativeMouseMode ifTrue: [ Color green ] ifFalse: [ Color white ]).

	self showText: ('C: Cursor Visible: ', SDL3Cursor isVisible asString, ' - Toggles the visibility of the system mouse cursor.')
		x: x y: y + 30
		color: (SDL3Cursor isVisible ifTrue: [ Color green ] ifFalse: [ Color white ]).

	mouseSDLRect := window mouseRect.
	isMouseLocked := mouseSDLRect isNull not.
	isMouseLocked ifTrue: [
		renderer renderDrawColor: Color yellow.
		renderer renderRect: (SDL3FRect newFrom: mouseSDLRect) ].
	self showText: ('L: Mouse Locked to Rect: ', isMouseLocked asString, ' - Confines mouse to a specific sub-area.')
		x: x y: y + 45
		color: (isMouseLocked ifTrue: [ Color green ] ifFalse: [ Color white ]).

	self showText: 'W: Warp Mouse - Move mouse cursor to the specified position.'
		x: x y: y + 60
		color: Color white.

	self showText: ('N: Current system cursor: ', cursorId item)
		x: x y: y + 75
		color: Color cyan.

	mousePosition := sdl mousePosition.
	self showText: ('Local Position: ', (mousePosition x printShowingDecimalPlaces: 2), ' @ ', (mousePosition y printShowingDecimalPlaces: 2))
		x: x y: y + 100
		color: Color lightYellow.

	globalMousePosition := sdl globalMousePosition.
	self showText: ('Global Position: ', (globalMousePosition x printShowingDecimalPlaces: 2), ' @ ', (globalMousePosition y printShowingDecimalPlaces: 2))
		x: x y: y + 115
		color: Color lightYellow.

	pressedButtons := (SDL3MouseButtonFlagsMask allValuesIn:
		(sdl getMouseStateX: ExternalAddress null y: ExternalAddress null))
			collect: [ :e | e item ].
	self showText: ('Buttons: ', (pressedButtons ifEmpty: [ 'None' ] ifNotEmpty: [ ', ' join: pressedButtons ]))
		x: x y: y + 130
		color: Color lightYellow.

	self present
]

{ #category : 'private' }
SDL3MouseDemoApp >> toggleLockedMouseRectangle [

	window mouseRect isNull
		ifTrue: [ 
			| extent lockRect |
			extent := window extent.
			lockRect := (extent // 4) extent: (extent // 2).
			window mouseRect: (SDL3Rect newFrom: lockRect) ]
		ifFalse: [
			window mouseRect: ExternalAddress null ]
]
