"
I manage the camera for a tiled map demo.
"
Class {
	#name : 'SDL3TiledMapCamera',
	#superclass : 'Object',
	#instVars : [
		'zoomLevel',
		'center',
		'viewportExtent'
	],
	#category : 'SDL3-GPU-Demos-TiledMap',
	#package : 'SDL3-GPU-Demos',
	#tag : 'TiledMap'
}

{ #category : 'accessing' }
SDL3TiledMapCamera >> center [

	^ center
]

{ #category : 'accessing' }
SDL3TiledMapCamera >> center: aPoint [

	center := aPoint
]

{ #category : 'conversion' }
SDL3TiledMapCamera >> fractalToLogical: aPoint [
	"Convert a point in fractal space to logical screen space (0..1).
	Fractal space is Y-DOWN (matches screen)."

	| fractalWidth fractalHeight relativePos |
	fractalWidth := 4.0 / zoomLevel.
	fractalHeight := fractalWidth * (viewportExtent y / viewportExtent x).

	relativePos := (aPoint - center) / (fractalWidth @ fractalHeight).
	^ relativePos + (0.5 @ 0.5)
]

{ #category : 'conversion' }
SDL3TiledMapCamera >> fractalToLogicalRect: aRect [
	"Convert a rectangle in fractal space to logical screen space (0..1)."

	| p1 p2 |
	p1 := self fractalToLogical: aRect origin.
	p2 := self fractalToLogical: aRect corner.

	^ Rectangle origin: (p1 min: p2) corner: (p1 max: p2)
]

{ #category : 'initialization' }
SDL3TiledMapCamera >> initialize [

	super initialize.
	zoomLevel := 1.0.
	center := 0 @ 0.
	viewportExtent := 1 @ 1
]

{ #category : 'conversion' }
SDL3TiledMapCamera >> logicalToFractal: aPoint [
	"Convert a logical screen point to fractal space.
	Fractal space is Y-UP."

	| relativePos fractalWidth fractalHeight |
	fractalWidth := 4.0 / zoomLevel.
	fractalHeight := fractalWidth * (viewportExtent y / viewportExtent x).

	"x: 0 (left) -> -0.5, 1 (right) -> 0.5
	y: 0 (top)  -> 0.5, 1 (bottom) -> -0.5"
	relativePos := (aPoint x / viewportExtent x - 0.5) @ (0.5 - (aPoint y / viewportExtent y)).
	^ center + (relativePos * (fractalWidth @ fractalHeight))
]

{ #category : 'conversion' }
SDL3TiledMapCamera >> normalizedToFractal: aNormalizedPoint [
	"Convert a normalized screen point (0..1) to fractal space.
	SDL screen Y is 0 at top, 1 at bottom.
	The visual fractal currently has smaller Y at bottom, larger Y at top.
	So we invert the Y mapping here."

	| relativePos fractalWidth fractalHeight |
	fractalWidth := 4.0 / zoomLevel.
	fractalHeight := fractalWidth * (viewportExtent y / viewportExtent x).

	"x: 0 (left) -> -0.5, 1 (right) -> 0.5
	y: 0 (top)  -> 0.5, 1 (bottom) -> -0.5"
	relativePos := (aNormalizedPoint x - 0.5) @ (0.5 - aNormalizedPoint y).
	^ center + (relativePos * (fractalWidth @ fractalHeight))
]

{ #category : 'actions' }
SDL3TiledMapCamera >> panByNormalized: aDeltaNormalized [
	"Pan the camera by a normalized delta (0..1)."

	| fractalWidth fractalHeight dxFractal dyFractal |
	fractalWidth := 4.0 / zoomLevel.
	fractalHeight := fractalWidth * (viewportExtent y / viewportExtent x).

	dxFractal := aDeltaNormalized x * fractalWidth.
	dyFractal := aDeltaNormalized y * fractalHeight.

	"Standard drag-to-pan:
	Mouse moves right (+dx) -> Camera moves left (-dx)
	Mouse moves down (+dy) -> Camera moves up (+dy) since fractal math Y is up"
	center := center + (dxFractal negated @ dyFractal).
]

{ #category : 'accessing' }
SDL3TiledMapCamera >> viewportExtent [

	^ viewportExtent
]

{ #category : 'accessing' }
SDL3TiledMapCamera >> viewportExtent: aPoint [

	viewportExtent := aPoint
]

{ #category : 'actions' }
SDL3TiledMapCamera >> zoomBy: aFactor [

	zoomLevel := (zoomLevel * aFactor) min: 131072.0 max: 0.5
]

{ #category : 'actions' }
SDL3TiledMapCamera >> zoomBy: aFactor aroundNormalizedPoint: aNormalizedPoint [
	"Zoom by a factor while keeping the fractal point under the normalized screen cursor (0..1) stationary."

	| fractalBefore fractalAfter |
	fractalBefore := self normalizedToFractal: aNormalizedPoint.
	self zoomBy: aFactor.
	fractalAfter := self normalizedToFractal: aNormalizedPoint.
	center := center + (fractalBefore - fractalAfter)
]

{ #category : 'actions' }
SDL3TiledMapCamera >> zoomBy: aFactor aroundScreenPoint: aPoint [
	"Zoom by a factor while keeping the fractal point under the screen cursor stationary."

	| fractalBefore fractalAfter |
	fractalBefore := self logicalToFractal: aPoint.
	self zoomBy: aFactor.
	fractalAfter := self logicalToFractal: aPoint.
	center := center + (fractalBefore - fractalAfter)
]

{ #category : 'accessing' }
SDL3TiledMapCamera >> zoomLevel [

	^ zoomLevel
]

{ #category : 'accessing' }
SDL3TiledMapCamera >> zoomLevel: aNumber [

	zoomLevel := aNumber
]
