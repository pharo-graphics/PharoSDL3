"
I demonstrate the usage of animated cursors in SDL3.
"
Class {
	#name : 'SDL3AnimatedCursorDemoApp',
	#superclass : 'SDL3RendererDemoApp',
	#instVars : [
		'cursors',
		'cursorTextures',
		'hotspots'
	],
	#category : 'SDL3-Demos-API',
	#package : 'SDL3-Demos',
	#tag : 'API'
}

{ #category : 'accessing' }
SDL3AnimatedCursorDemoApp >> angleForFrame: anIndex [

	^ (anIndex * 360 / self numberOfFrames) asFloat
]

{ #category : 'initialization' }
SDL3AnimatedCursorDemoApp >> blitIcon: aSurface on: final corner: aSymbol [

	| dstRect |
	dstRect := self iconRectForCorner: aSymbol surface: aSurface.
	aSurface blitSrcrect: nil dst: final dstrect: dstRect
]

{ #category : 'accessing' }
SDL3AnimatedCursorDemoApp >> crosshairSize [

	^ 16
]

{ #category : 'accessing' }
SDL3AnimatedCursorDemoApp >> cursorExtent [

	^ 64 @ 64
]

{ #category : 'initialization' }
SDL3AnimatedCursorDemoApp >> drawCrosshairOn: surface at: aPoint [

	| cSize crosshairColor |
	cSize := self crosshairSize.
	crosshairColor := surface mapRGBAR: 255 g: 255 b: 255 a: 255.

	surface fillRectDstRect: (SDL_Rect new
		x: aPoint x - (cSize // 2);
		y: aPoint y;
		w: cSize;
		h: 1) color: crosshairColor.
	surface fillRectDstRect: (SDL_Rect new
		x: aPoint x;
		y: aPoint y - (cSize // 2);
		w: 1;
		h: cSize) color: crosshairColor.

	^ aPoint
]

{ #category : 'accessing' }
SDL3AnimatedCursorDemoApp >> frameDelays [

	^ Array new: self numberOfFrames withAll: 33
]

{ #category : 'initialization' }
SDL3AnimatedCursorDemoApp >> generateCursorForCorner: aSymbol during: aBlock [

	| extent h frames textures |
	extent := self cursorExtent.
	h := self hotspotOffsetForCorner: aSymbol.

	frames := (0 to: self numberOfFrames - 1) collect: [ :i |
		| final |
		final := SDL3Surface unownedNewWidth: extent x height: extent y format: SDL_PIXELFORMAT_BGRA32.
		final clearColor: Color transparent.
		self drawCrosshairOn: final at: h.
		aBlock value: i value: final.
		final ].

	[
		textures := frames collect: [ :each | renderer unownedNewTextureFromSurface: each ].
		cursorTextures add: (DiScope ownAll: textures).
		hotspots add: h.
		cursors add: (DiScope own: (self newAnimatedCursorFromFrames: frames delays: self frameDelays hotspot: h))
	] ensure: [
		frames do: [ :each | each destroy ] ]
]

{ #category : 'initialization' }
SDL3AnimatedCursorDemoApp >> generateCursorPulsingIcon: iconSurface corner: aSymbol [

	| baseSurface |
	baseSurface := iconSurface unownedScaledToWidth: 40 height: 40.
	[
		self generateCursorForCorner: aSymbol during: [ :i :final |
			baseSurface alphaModAlpha: ((self pulseForFrame: i) * 255) asInteger.
			self blitIcon: baseSurface on: final corner: aSymbol ]
	] ensure: [ baseSurface destroy ]
]

{ #category : 'initialization' }
SDL3AnimatedCursorDemoApp >> generateCursorRotatingAndPulsingIcon: iconSurface corner: aSymbol [

	| baseSurface |
	baseSurface := iconSurface unownedScaledToWidth: 32 height: 32.
	[
		self generateCursorForCorner: aSymbol during: [ :i :final |
			| rotated |
			baseSurface alphaModAlpha: ((self pulseForFrame: i) * 255) asInteger.
			rotated := baseSurface unownedRotatedByDegrees: (self angleForFrame: i).
			[ self blitIcon: rotated on: final corner: aSymbol ]
				ensure: [ rotated destroy ] ]
	] ensure: [ baseSurface destroy ]
]

{ #category : 'initialization' }
SDL3AnimatedCursorDemoApp >> generateCursorRotatingIcon: iconSurface corner: aSymbol [

	| baseSurface |
	baseSurface := iconSurface unownedScaledToWidth: 40 height: 40.
	[
		self generateCursorForCorner: aSymbol during: [ :i :final |
			| rotated |
			rotated := baseSurface unownedRotatedByDegrees: (self angleForFrame: i).
			[ self blitIcon: rotated on: final corner: aSymbol ]
				ensure: [ rotated destroy ] ]
	] ensure: [ baseSurface destroy ]
]

{ #category : 'initialization' }
SDL3AnimatedCursorDemoApp >> generateCursorScalingIcon: iconSurface corner: aSymbol [

	self generateCursorForCorner: aSymbol during: [ :i :final |
		| scale baseSurface |
		scale := (self pulseForFrame: i) * 10 + 30.
		baseSurface := iconSurface
			unownedScaledToWidth: scale asInteger
			height: scale asInteger.
		[ self blitIcon: baseSurface on: final corner: aSymbol ]
			ensure: [ baseSurface destroy ] ]
]

{ #category : 'initialization' }
SDL3AnimatedCursorDemoApp >> generateCursors [

	| iconSurface |
	cursors := OrderedCollection new.
	cursorTextures := OrderedCollection new.
	hotspots := OrderedCollection new.

	iconSurface := (self iconNamed: #pharoBig) unownedAsSDL3Surface.

	"1. Top-Left: Rotating"
	self generateCursorRotatingIcon: iconSurface corner: #TL.

	"2. Top-Right: Pulsing"
	self generateCursorPulsingIcon: iconSurface corner: #TR.

	"3. Bottom-Left: Rotating & Pulsing"
	self generateCursorRotatingAndPulsingIcon: iconSurface corner: #BL.

	"4. Bottom-Right: Scaling (Breathing)"
	self generateCursorScalingIcon: iconSurface corner: #BR.

	iconSurface destroy
]

{ #category : 'accessing' }
SDL3AnimatedCursorDemoApp >> hotspotOffsetForCorner: aSymbol [

	| extent |
	extent := self cursorExtent.
	aSymbol == #TL ifTrue: [ ^ 8 @ 8 ].
	aSymbol == #TR ifTrue: [ ^ (extent x - 8) @ 8 ].
	aSymbol == #BL ifTrue: [ ^ 8 @ (extent y - 8) ].
	aSymbol == #BR ifTrue: [ ^ (extent x - 8) @ (extent y - 8) ].
	^ 0 @ 0
]

{ #category : 'initialization' }
SDL3AnimatedCursorDemoApp >> iconRectForCorner: aSymbol surface: aSurface [

	| extent x y |
	extent := self cursorExtent.
	"TL: icon at (10, 10)"
	aSymbol == #TL ifTrue: [ 
		x := (extent x - aSurface w) // 2 + 5.
		y := (extent y - aSurface h) // 2 + 5 ].
	"TR: icon at (left side)"
	aSymbol == #TR ifTrue: [ 
		x := (extent x - aSurface w) // 2 - 5.
		y := (extent y - aSurface h) // 2 + 5 ].
	"BL: icon at (top side)"
	aSymbol == #BL ifTrue: [ 
		x := (extent x - aSurface w) // 2 + 5.
		y := (extent y - aSurface h) // 2 - 5 ].
	"BR: icon at (top left side)"
	aSymbol == #BR ifTrue: [ 
		x := (extent x - aSurface w) // 2 - 5.
		y := (extent y - aSurface h) // 2 - 5 ].

	^ SDL_Rect new
		x: x;
		y: y;
		w: aSurface w;
		h: aSurface h
]

{ #category : 'accessing' }
SDL3AnimatedCursorDemoApp >> initialExtent [

	^ 720 @ 720
]

{ #category : 'initialization' }
SDL3AnimatedCursorDemoApp >> newAnimatedCursorFromFrames: frames delays: anArray hotspot: h [

	| frameInfos |
	frameInfos := SDL3Array unownedNewType: SDL_CursorFrameInfo size: frames size.
	^ [
		  frames doWithIndex: [ :surface :i |
				  | info |
				  info := frameInfos at: i.
				  info surface: surface.
				  info duration: (anArray at: i) ].

		  SDL3Cursor
			  unownedNewAnimatedFrames: frameInfos
			  frameCount: frames size
			  hotX: h x
			  hotY: h y ] ensure: [ frameInfos free ]
]

{ #category : 'accessing' }
SDL3AnimatedCursorDemoApp >> numberOfFrames [

	^ 20
]

{ #category : 'accessing' }
SDL3AnimatedCursorDemoApp >> pulseForFrame: anIndex [

	^ (self angleForFrame: anIndex) degreeSin abs
]

{ #category : 'rendering' }
SDL3AnimatedCursorDemoApp >> renderQuadrants [
	"Draw the grid and the source frames for each cursor."

	| extent midX midY frameSize gap framesPerRow |
	extent := window extent.
	midX := extent x // 2.
	midY := extent y // 2.
	frameSize := self cursorExtent // 2.
	gap := 10.
	framesPerRow := 8. "8x4 grid = 32 frames"

	renderer renderDrawColor: Color darkGray.

	"Grid lines"
	renderer
		renderLineX1: midX y1: 0 x2: midX y2: extent y;
		renderLineX1: 0 y1: midY x2: extent x y2: midY.

	cursorTextures doWithIndex: [ :textures :qIndex | 
		| qX qY |
		qX := (qIndex - 1) % 2 * midX.
		qY := (qIndex - 1) // 2 * midY.

		textures doWithIndex: [ :tex :fIndex | 
			| fX fY dstRect |
			fX := qX + ((fIndex - 1) % framesPerRow * (frameSize x + gap)) + gap.
			fY := qY + ((fIndex - 1) // framesPerRow * (frameSize y + gap)) + gap.
			dstRect := SDL_FRect new
				           x: fX;
				           y: fY;
				           w: frameSize x;
				           h: frameSize y.
			renderer renderTexture: tex srcrect: nil dstrect: dstRect ] ]
]

{ #category : 'lifecycle' }
SDL3AnimatedCursorDemoApp >> setUp [

	super setUp.

	self generateCursors
]

{ #category : 'hooks' }
SDL3AnimatedCursorDemoApp >> step [

	renderer
		renderDrawColor: Color black;
		renderClear.

	self renderQuadrants.

	self present
]

{ #category : 'visiting - concrete' }
SDL3AnimatedCursorDemoApp >> visitMouseMotionEvent: aMouseMotionEvent [

	| extent midX midY qX qY qIndex |
	extent := window extent.
	midX := extent x // 2.
	midY := extent y // 2.

	qX := aMouseMotionEvent x < midX
		      ifTrue: [ 0 ]
		      ifFalse: [ 1 ].
	qY := aMouseMotionEvent y < midY
		      ifTrue: [ 0 ]
		      ifFalse: [ 1 ].

	qIndex := qY * 2 + qX + 1.

	(cursors at: qIndex) setActive
]
