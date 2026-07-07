"
I demonstrate SDL3's multi-display API capabilities.
"
Class {
	#name : 'SDL3DisplayDemoApp',
	#superclass : 'SDL3RendererDemoApp',
	#instVars : [
		'windowsByDisplay',
		'frontierPairs',
		'lastDisplayInfo',
		'displayColors'
	],
	#category : 'SDL3-Demos-API',
	#package : 'SDL3-Demos',
	#tag : 'API'
}

{ #category : 'private' }
SDL3DisplayDemoApp >> checkAndSpawnFrontierBetween: firstDisplay and: secondDisplay [

	| firstRect secondRect color1 color2 |
	firstRect := firstDisplay bounds asRectangle.
	secondRect := secondDisplay bounds asRectangle.
	
	"Color of target display"
	color1 := displayColors at: secondDisplay id.
	color2 := displayColors at: firstDisplay id.
	
	self 
		spawnFrontierIfAdjacentBetween: firstRect and: secondRect 
		color1: color1 color2: color2
]

{ #category : 'lifecycle' }
SDL3DisplayDemoApp >> close [

	self destroyChildWindows.
	super close
]

{ #category : 'private' }
SDL3DisplayDemoApp >> destroyChildWindows [

	windowsByDisplay ifNotNil: [ 
		windowsByDisplay valuesDo: [ :windows | 
			windows do: [ :each | 
				each renderer destroy.
				each destroy ] ].
		windowsByDisplay := Dictionary new ].
		
	frontierPairs ifNotNil: [ 
		frontierPairs do: [ :eachPair | 
			| eachWindow1 eachWindow2 |
			eachWindow1 := eachPair at: #childWindow1.
			eachWindow2 := eachPair at: #childWindow2.
			eachWindow1 renderer destroy.
			eachWindow1 destroy.
			eachWindow2 renderer destroy.
			eachWindow2 destroy ].
		frontierPairs := OrderedCollection new ]
]

{ #category : 'private' }
SDL3DisplayDemoApp >> drawMinimap: currentDisplays [

	| minX minY maxX maxY mapWidth mapHeight mapScale mapOffsetX mapOffsetY |
	currentDisplays ifEmpty: [ ^ self ].

	minX := (currentDisplays collect: [ :eachDisplay | eachDisplay bounds x ]) min.
	minY := (currentDisplays collect: [ :eachDisplay | eachDisplay bounds y ]) min.
	maxX := (currentDisplays collect: [ :eachDisplay | eachDisplay bounds asRectangle right ]) max.
	maxY := (currentDisplays collect: [ :eachDisplay | eachDisplay bounds asRectangle bottom ]) max.

	mapWidth := 300.0.
	mapHeight := 200.0.
	mapScale := (mapWidth / (maxX - minX max: 1)) min: (mapHeight / (maxY - minY max: 1)).

	"Position minimap on the right side"
	mapOffsetX := 450.
	mapOffsetY := 50.

	currentDisplays do: [ :eachDisplay |
		| rect scaledX scaledY scaledW scaledH frect color |
		rect := eachDisplay bounds asRectangle.
		scaledX := mapOffsetX + ((rect left - minX) * mapScale).
		scaledY := mapOffsetY + ((rect top - minY) * mapScale).
		scaledW := rect width * mapScale.
		scaledH := rect height * mapScale.
		frect := SDL3FRect x: scaledX y: scaledY width: scaledW height: scaledH.
		
		color := displayColors at: eachDisplay id ifAbsent: [ Color gray ].
		renderer renderDrawColor: (color alpha: 0.5).
		
		renderer renderFillRect: frect.
		
		renderer renderDrawColor: Color white.
		renderer renderRect: frect.
		
		self showText: eachDisplay id asString x: scaledX + 5 y: scaledY + 5 color: Color white ]
]

{ #category : 'accessing' }
SDL3DisplayDemoApp >> initialExtent [

	^ 800 @ 600
]

{ #category : 'accessing' }
SDL3DisplayDemoApp >> initialWindowFlags [

	^ super initialWindowFlags | SDL_WINDOW_ALWAYS_ON_TOP
]

{ #category : 'initialization' }
SDL3DisplayDemoApp >> initialize [

	super initialize.
	windowsByDisplay := Dictionary new.
	frontierPairs := OrderedCollection new.
	lastDisplayInfo := #().
	displayColors := Dictionary new
]

{ #category : 'private' }
SDL3DisplayDemoApp >> prepareToLoop [

	super prepareToLoop.
	self updateWindows
]

{ #category : 'private' }
SDL3DisplayDemoApp >> renderChild: childWindow color: aColor labels: aCollectionOfStrings [

	| currentRenderer |
	"Safely query renderer from the window object"
	currentRenderer := childWindow renderer.
	currentRenderer
		renderDrawColor: aColor;
		renderClear;
		renderDrawColor: Color white.
	
	aCollectionOfStrings doWithIndex: [ :line :idx |
		currentRenderer renderDebugTextX: 10 y: 10 + ((idx - 1) * 15) str: line ].
		
	currentRenderer renderPresent
]

{ #category : 'private' }
SDL3DisplayDemoApp >> renderChildWindows [

	"Render corner windows"
	windowsByDisplay keysAndValuesDo: [ :displayID :eachWindowCollection |
		| titles color |
		titles := #('TOP-LEFT' 'TOP-RIGHT' 'BOTTOM-LEFT' 'BOTTOM-RIGHT').
		color := displayColors at: displayID ifAbsent: [ Color gray ].
		eachWindowCollection doWithIndex: [ :each :idx |
			self 
				renderChild: each 
				color: color 
				labels: { titles at: idx . 'Display ', displayID asString } ] ].
			
	"Render frontier windows"
	frontierPairs do: [ :eachPair |
		self renderChild: (eachPair at: #childWindow1) color: (eachPair at: #color1) labels: #().
		self renderChild: (eachPair at: #childWindow2) color: (eachPair at: #color2) labels: #() ]
]

{ #category : 'private' }
SDL3DisplayDemoApp >> spawnCornerWindowsFor: aDisplay [

	| bounds windowsForDisplay size |
	size := 150 @ 150.
	bounds := aDisplay usableBounds asRectangle.
	windowsForDisplay := Array new: 4.
	
	"Top-Left"
	windowsForDisplay at: 1 put: (self spawnWindowAt: bounds origin extent: size).
	"Top-Right"
	windowsForDisplay at: 2 put: (self spawnWindowAt: (bounds right - size x) @ bounds top extent: size).
	"Bottom-Left"
	windowsForDisplay at: 3 put: (self spawnWindowAt: bounds left @ (bounds bottom - size y) extent: size).
	"Bottom-Right"
	windowsForDisplay at: 4 put: (self spawnWindowAt: (bounds right - size x) @ (bounds bottom - size y) extent: size).
	
	windowsForDisplay do: [ :each | each opacity: 0.75 ].
	
	windowsByDisplay at: aDisplay id put: windowsForDisplay
]

{ #category : 'private' }
SDL3DisplayDemoApp >> spawnFrontierAt: edgePos rangeStart: start rangeEnd: end thickness: t vertical: isVertical color1: c1 color2: c2 [

	| length childWindow1 childWindow2 opacity |
	length := end - start.
	length <= 0 ifTrue: [ ^ self ]. "No actual overlap"
	opacity := 0.75.

	isVertical 
		ifTrue: [ 
			childWindow1 := self spawnWindowAt: (edgePos - t) @ start extent: t @ length.
			childWindow2 := self spawnWindowAt: edgePos @ start extent: t @ length ]
		ifFalse: [ 
			childWindow1 := self spawnWindowAt: start @ (edgePos - t) extent: length @ t.
			childWindow2 := self spawnWindowAt: start @ edgePos extent: length @ t ].

	childWindow1 opacity: opacity.
	childWindow2 opacity: opacity.

	frontierPairs add: { 
		#childWindow1 -> childWindow1. #color1 -> c1. 
		#childWindow2 -> childWindow2. #color2 -> c2 
	} asDictionary
]

{ #category : 'private' }
SDL3DisplayDemoApp >> spawnFrontierIfAdjacentBetween: r1 and: r2 color1: c1 color2: c2 [

	| thickness |
	thickness := 50.
	
	"Horizontal adjacency"
	r1 right = r2 left ifTrue: [ 
		self spawnFrontierAt: r1 right 
			rangeStart: (r1 top max: r2 top) 
			rangeEnd: (r1 bottom min: r2 bottom) 
			thickness: thickness vertical: true color1: c1 color2: c2 ].
	r2 right = r1 left ifTrue: [ 
		self spawnFrontierAt: r2 right 
			rangeStart: (r1 top max: r2 top) 
			rangeEnd: (r1 bottom min: r2 bottom) 
			thickness: thickness vertical: true color1: c2 color2: c1 ].

	"Vertical adjacency"
	r1 bottom = r2 top ifTrue: [ 
		self spawnFrontierAt: r1 bottom 
			rangeStart: (r1 left max: r2 left) 
			rangeEnd: (r1 right min: r2 right) 
			thickness: thickness vertical: false color1: c1 color2: c2 ].
	r2 bottom = r1 top ifTrue: [ 
		self spawnFrontierAt: r2 bottom 
			rangeStart: (r1 left max: r2 left) 
			rangeEnd: (r1 right min: r2 right) 
			thickness: thickness vertical: false color1: c2 color2: c1 ]
]

{ #category : 'private' }
SDL3DisplayDemoApp >> spawnFrontierWindows: currentDisplays [

	currentDisplays do: [ :firstDisplay |
		currentDisplays do: [ :secondDisplay |
			firstDisplay id < secondDisplay id ifTrue: [ 
				self checkAndSpawnFrontierBetween: firstDisplay and: secondDisplay ] ] ]
]

{ #category : 'private' }
SDL3DisplayDemoApp >> spawnWindowAt: aPoint extent: anExtent [

	| childWindow |
	childWindow := SDL3Window
		unsafeNewTitle: ''
		w: anExtent x
		h: anExtent y
		flags: SDL_WINDOW_BORDERLESS | SDL_WINDOW_NOT_FOCUSABLE | SDL_WINDOW_ALWAYS_ON_TOP.
	childWindow position: aPoint.
	childWindow newRenderer. "Ensure window has an associated renderer"
	childWindow show.
	^ childWindow
]

{ #category : 'hooks' }
SDL3DisplayDemoApp >> step [

	| currentDisplays currentDisplayInfo |
	self clearColor: Color black.
	
	"Poll displays every frame to avoid stale data segfaults"
	currentDisplays := sdl displays.
	
	"Compare IDs and bounds to detect both hot-plug and arrangement changes"
	currentDisplayInfo := currentDisplays collect: [ :eachDisplay | eachDisplay id -> eachDisplay bounds asRectangle ].
	currentDisplayInfo = lastDisplayInfo ifFalse: [ 
		self updateWindows.
		lastDisplayInfo := currentDisplayInfo ].
	
	self showText: 'Corners: Monitor usable bounds' x: 20 y: 20 color: Color white.
	self showText: 'Frontiers: Adjacency (color = target)' x: 20 y: 35 color: Color white.

	currentDisplays withIndexDo: [ :eachDisplay :displayIndex |
		| desktopMode yOffset color |
		"Safely query mode - if display is gone, this returns nil/null"
		desktopMode := eachDisplay desktopDisplayMode.
		desktopMode ifNotNil: [ 
			color := displayColors at: eachDisplay id ifAbsent: [ Color white ].
			yOffset := 70 + ((displayIndex - 1) * 80).
			self showText: ('Display: ', eachDisplay name, ' (', eachDisplay id asString, ')') x: 20 y: yOffset color: color.
			self showText: ('Scale (DPI factor): ', (eachDisplay contentScale printShowingDecimalPlaces: 2)) 
				x: 30 y: yOffset + 15 color: Color white.
			self showText: ('Refresh Rate: ', (desktopMode refreshRate asFloat printShowingDecimalPlaces: 2), ' Hz') 
				x: 30 y: yOffset + 30 color: Color white.
			self showText: ('Format: ', (sdl getPixelFormatName: desktopMode format)) 
				x: 30 y: yOffset + 45 color: Color white ] ].

	self drawMinimap: currentDisplays.
	self renderChildWindows.

	self present
]

{ #category : 'private' }
SDL3DisplayDemoApp >> updateWindows [

	| currentDisplays wheel |
	self destroyChildWindows.
	currentDisplays := sdl displays.
	
	"Assign unique colors"
	displayColors := Dictionary new.
	wheel := Color wheel: currentDisplays size.
	currentDisplays withIndexDo: [ :eachDisplay :i |
		displayColors at: eachDisplay id put: (wheel at: i) ].
	
	currentDisplays do: [ :eachDisplay | self spawnCornerWindowsFor: eachDisplay ].
	self spawnFrontierWindows: currentDisplays
]
