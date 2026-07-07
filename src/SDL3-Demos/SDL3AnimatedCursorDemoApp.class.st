"
I demonstrate the usage of animated cursors in SDL3.
"
Class {
	#name : 'SDL3AnimatedCursorDemoApp',
	#superclass : 'SDL3RendererDemoApp',
	#instVars : [
		'cursors',
		'cursorFrames',
		'cursorTextures',
		'hotspots'
	],
	#category : 'SDL3-Demos-API',
	#package : 'SDL3-Demos',
	#tag : 'API'
}

{ #category : 'lifecycle' }
SDL3AnimatedCursorDemoApp >> close [
	"Cleanup cursors, textures and surfaces"

	| allSurfaces allTextures |
	cursors ifNotNil: [ 
		cursors do: [ :each | each destroy ].
		cursors := nil ].

	allTextures := IdentitySet new.
	cursorTextures ifNotNil: [ 
		cursorTextures do: [ :eachArray | allTextures addAll: eachArray ] ].
	allTextures do: [ :each | each destroy ].
	cursorTextures := nil.

	allSurfaces := IdentitySet new.
	cursorFrames ifNotNil: [ 
		cursorFrames do: [ :eachArray | allSurfaces addAll: eachArray ] ].
	allSurfaces do: [ :each | each destroy ].
	cursorFrames := nil.

	super close
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
SDL3AnimatedCursorDemoApp >> drawCrosshairOn: surface corner: aSymbol [

	| cSize crosshairColor h |
	cSize := self crosshairSize.
	crosshairColor := surface mapRGBAR: 255 g: 255 b: 255 a: 255.

	h := self hotspotOffsetForCorner: aSymbol.

	surface fillRectDstRect: (SDL_Rect new
			 x: h x - (cSize // 2);
			 y: h y;
			 w: cSize;
			 h: 1) color: crosshairColor.
	surface fillRectDstRect: (SDL_Rect new
			 x: h x;
			 y: h y - (cSize // 2);
			 w: 1;
			 h: cSize) color: crosshairColor.
			
	^ h
]

{ #category : 'initialization' }
SDL3AnimatedCursorDemoApp >> generateCursorPulsingIcon: iconSurface corner: aSymbol [

	| frames textures baseSurface extent h |
	extent := self cursorExtent.
	baseSurface := iconSurface
		               scaleWidth: 40
		               height: 40
		               scaleMode: SDL_SCALEMODE_LINEAR.

	frames := (0 to: self numberOfFrames - 1) collect: [ :i | 
		          | final dstRect alpha |
		          final := SDL3Surface
			                   unsafeNewWidth: extent x
			                   height: extent y
			                   format: SDL_PIXELFORMAT_BGRA32.
		          final clearColor: Color transparent.
		          h := self drawCrosshairOn: final corner: aSymbol.

		          alpha := (i * 360 / self numberOfFrames) degreeSin abs.
		          baseSurface alphaModAlpha: (alpha * 255) asInteger.

		          dstRect := self iconRectForCorner: aSymbol rotated: baseSurface.
		          baseSurface blitSrcrect: nil dst: final dstrect: dstRect.
		          final ].
	baseSurface destroy.

	cursorFrames add: frames.
	textures := frames collect: [ :each | renderer newTextureFromSurface: each ].
	cursorTextures add: textures.
	hotspots add: h.
	cursors add: (self
			 newAnimatedCursorFromFrames: frames
			 delays: ((1 to: self numberOfFrames) collect: [ :i | 33 ])
			 hotspot: h)
]

{ #category : 'initialization' }
SDL3AnimatedCursorDemoApp >> generateCursorRotatingAndPulsingIcon: iconSurface corner: aSymbol [

	| frames textures baseSurface extent h |
	extent := self cursorExtent.
	baseSurface := iconSurface
		               scaleWidth: 32 "Smaller to allow rotation"
		               height: 32
		               scaleMode: SDL_SCALEMODE_LINEAR.

	frames := (0 to: self numberOfFrames - 1) collect: [ :i | 
		          | final dstRect alpha rotated |
		          final := SDL3Surface
			                   unsafeNewWidth: extent x
			                   height: extent y
			                   format: SDL_PIXELFORMAT_BGRA32.
		          final clearColor: Color transparent.
		          h := self drawCrosshairOn: final corner: aSymbol.

		          alpha := (i * 360 / self numberOfFrames) degreeSin abs.
		          baseSurface alphaModAlpha: (alpha * 255) asInteger.
		          rotated := baseSurface rotateAngle:
			                     (i * 360 / self numberOfFrames) asFloat.

		          dstRect := self iconRectForCorner: aSymbol rotated: rotated.
		          rotated blitSrcrect: nil dst: final dstrect: dstRect.
		          rotated destroy.
		          final ].
	baseSurface destroy.

	cursorFrames add: frames.
	textures := frames collect: [ :each | renderer newTextureFromSurface: each ].
	cursorTextures add: textures.
	hotspots add: h.
	cursors add: (self
			 newAnimatedCursorFromFrames: frames
			 delays: ((1 to: self numberOfFrames) collect: [ :i | 33 ])
			 hotspot: h)
]

{ #category : 'initialization' }
SDL3AnimatedCursorDemoApp >> generateCursorRotatingIcon: iconSurface corner: aSymbol [

	| frames textures baseSurface extent h |
	extent := self cursorExtent.
	baseSurface := iconSurface
		               scaleWidth: 40
		               height: 40
		               scaleMode: SDL_SCALEMODE_LINEAR.

	frames := (0 to: self numberOfFrames - 1) collect: [ :i | 
		          | final dstRect rotated |
		          final := SDL3Surface
			                   unsafeNewWidth: extent x
			                   height: extent y
			                   format: SDL_PIXELFORMAT_BGRA32.
		          final clearColor: Color transparent.
		          h := self drawCrosshairOn: final corner: aSymbol.

		          rotated := baseSurface rotateAngle:
			                     (i * 360 / self numberOfFrames) asFloat.

		          dstRect := self iconRectForCorner: aSymbol rotated: rotated.
		          rotated blitSrcrect: nil dst: final dstrect: dstRect.
		          rotated destroy.
		          final ].
	baseSurface destroy.

	cursorFrames add: frames.
	textures := frames collect: [ :each | renderer newTextureFromSurface: each ].
	cursorTextures add: textures.
	hotspots add: h.
	cursors add: (self
			 newAnimatedCursorFromFrames: frames
			 delays: ((1 to: self numberOfFrames) collect: [ :i | 33 ])
			 hotspot: h)
]

{ #category : 'initialization' }
SDL3AnimatedCursorDemoApp >> generateCursorScalingIcon: iconSurface corner: aSymbol [

	| frames textures extent h |
	extent := self cursorExtent.

	frames := (0 to: self numberOfFrames - 1) collect: [ :i | 
		          | final dstRect scale baseSurface |
		          final := SDL3Surface
			                   unsafeNewWidth: extent x
			                   height: extent y
			                   format: SDL_PIXELFORMAT_BGRA32.
		          final clearColor: Color transparent.
		          h := self drawCrosshairOn: final corner: aSymbol.

		          scale := (i * 360 / self numberOfFrames) degreeSin abs * 10 + 30.
		          baseSurface := iconSurface
			                         scaleWidth: scale asInteger
			                         height: scale asInteger
			                         scaleMode: SDL_SCALEMODE_LINEAR.

		          dstRect := self iconRectForCorner: aSymbol rotated: baseSurface.
		          baseSurface blitSrcrect: nil dst: final dstrect: dstRect.
		          baseSurface destroy.
		          final ].

	cursorFrames add: frames.
	textures := frames collect: [ :each | renderer newTextureFromSurface: each ].
	cursorTextures add: textures.
	hotspots add: h.
	cursors add: (self
			 newAnimatedCursorFromFrames: frames
			 delays: ((1 to: self numberOfFrames) collect: [ :i | 33 ])
			 hotspot: h)
]

{ #category : 'initialization' }
SDL3AnimatedCursorDemoApp >> generateCursors [

	| iconSurface |
	cursors := OrderedCollection new.
	cursorFrames := OrderedCollection new.
	cursorTextures := OrderedCollection new.
	hotspots := OrderedCollection new.

	iconSurface := (self iconNamed: #pharoBig) unsafeNewAsSDL3Surface.

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
SDL3AnimatedCursorDemoApp >> iconRectForCorner: aSymbol rotated: rotated [

	| extent x y |
	extent := self cursorExtent.
	"TL: icon at (10, 10)"
	aSymbol == #TL ifTrue: [ 
		x := (extent x - rotated w) // 2 + 5.
		y := (extent y - rotated h) // 2 + 5 ].
	"TR: icon at (left side)"
	aSymbol == #TR ifTrue: [ 
		x := (extent x - rotated w) // 2 - 5.
		y := (extent y - rotated h) // 2 + 5 ].
	"BL: icon at (top side)"
	aSymbol == #BL ifTrue: [ 
		x := (extent x - rotated w) // 2 + 5.
		y := (extent y - rotated h) // 2 - 5 ].
	"BR: icon at (top left side)"
	aSymbol == #BR ifTrue: [ 
		x := (extent x - rotated w) // 2 - 5.
		y := (extent y - rotated h) // 2 - 5 ].

	^ SDL_Rect new
		  x: x;
		  y: y;
		  w: rotated w;
		  h: rotated h
]

{ #category : 'accessing' }
SDL3AnimatedCursorDemoApp >> initialExtent [

	^ 720 @ 720
]

{ #category : 'initialization' }
SDL3AnimatedCursorDemoApp >> newAnimatedCursorFromFrames: frames delays: anArray hotspot: h [

	| frameInfos |
	frameInfos := SDL_CursorFrameInfo safeNewArray: frames size.

	frames doWithIndex: [ :surface :i | 
		| info |
		info := frameInfos at: i.
		info surface: surface.
		info duration: (anArray at: i) ].

	^ SDL3Cursor
		  unsafeNewAnimatedFrames: frameInfos
		  frameCount: frames size
		  hotX: h x
		  hotY: h y
]

{ #category : 'accessing' }
SDL3AnimatedCursorDemoApp >> numberOfFrames [

	^ 20
]

{ #category : 'lifecycle' }
SDL3AnimatedCursorDemoApp >> prepareToLoop [

	super prepareToLoop.
	self generateCursors
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
