"
Tests for the Tiled Map Camera.
"
Class {
	#name : 'SDL3TiledMapCameraTest',
	#superclass : 'TestCase',
	#category : 'SDL3-GPU-Demos-TiledMap',
	#package : 'SDL3-GPU-Demos',
	#tag : 'TiledMap'
}

{ #category : 'tests' }
SDL3TiledMapCameraTest >> testInitialization [

	| camera |
	camera := SDL3TiledMapCamera new.
	self assert: camera zoomLevel equals: 1.0.
	self assert: camera center equals: 0 @ 0
]

{ #category : 'tests' }
SDL3TiledMapCameraTest >> testLogicalToFractal [

	| camera fractalPos |
	camera := SDL3TiledMapCamera new.
	camera viewportExtent: 1280 @ 720.
	camera center: 0 @ 0.
	camera zoomLevel: 1.0. "Assume width of 4.0 in fractal space"

	"Center of screen should be center of fractal"
	fractalPos := camera logicalToFractal: 640 @ 360.
	self assert: fractalPos x equals: 0.
	self assert: fractalPos y equals: 0.

	"Top left of screen (Y is positive in fractal math)"
	fractalPos := camera logicalToFractal: 0 @ 0.
	self assert: (fractalPos closeTo: -2 @ 1.125)
]

{ #category : 'tests' }
SDL3TiledMapCameraTest >> testPanByNormalized [

	| camera |
	camera := SDL3TiledMapCamera new.
	camera viewportExtent: 1000 @ 1000.
	camera center: 0 @ 0.
	camera zoomLevel: 1.0. "fractal size 4x4"

	"Pan right by 10% (0.1 normalized)"
	camera panByNormalized: 0.1 @ 0.0.
	"Mouse moves +X -> Camera moves -X -> Center should be -0.4"
	self assert: (camera center x closeTo: -0.4).

	"Pan down by 10%"
	camera panByNormalized: 0.0 @ 0.1.
	"Mouse moves +Y (down) -> Camera moves +Y (math up) -> Center Y should be 0.4"
	self assert: (camera center y closeTo: 0.4)
]

{ #category : 'tests' }
SDL3TiledMapCameraTest >> testZoomByAroundNormalizedPoint [

	| camera fractalAtMouse |
	camera := SDL3TiledMapCamera new.
	camera viewportExtent: 1000 @ 1000.
	camera center: 0 @ 0.
	camera zoomLevel: 1.0.

	"Normalized point (0.75, 0.25) is top-right quadrant"
	fractalAtMouse := camera normalizedToFractal: 0.75 @ 0.25.
	self assert: fractalAtMouse equals: 1.0 @ 1.0.

	"Zoom in by 2.0 around that point"
	camera zoomBy: 2.0 aroundNormalizedPoint: 0.75 @ 0.25.

	"The fractal point under the mouse should still be (1.0, 1.0)"
	self assert: (camera zoomLevel closeTo: 2.0).
	self assert: ((camera normalizedToFractal: 0.75 @ 0.25) closeTo: 1.0 @ 1.0)
]

{ #category : 'tests' }
SDL3TiledMapCameraTest >> testZoomLimits [

	| camera |
	camera := SDL3TiledMapCamera new.
	camera zoomLevel: 1.0.

	camera zoomBy: 0.1. "Would be 0.1"
	self assert: camera zoomLevel equals: 0.5. "Min limit"

	camera zoomBy: 1000000.0.
	self assert: camera zoomLevel equals: 131072.0. "Max limit"
]
