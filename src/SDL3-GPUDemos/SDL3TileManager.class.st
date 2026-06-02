"
I manage the visibility and state of tiles in a tiled map.
"
Class {
	#name : 'SDL3TileManager',
	#superclass : 'Object',
	#instVars : [
		'camera',
		'cache'
	],
	#category : 'SDL3-GPUDemos-TiledMap',
	#package : 'SDL3-GPUDemos',
	#tag : 'TiledMap'
}

{ #category : 'accessing' }
SDL3TileManager >> camera: aCamera [

	camera := aCamera
]

{ #category : 'initialization' }
SDL3TileManager >> initialize [

	super initialize.

	cache := Dictionary new
]

{ #category : 'calculating' }
SDL3TileManager >> lod [
	"Calculate LOD based on zoom level. log2(zoomLevel) + 2 for 1:1 pixels at zoom 1.0"

	^ ((camera zoomLevel log: 2) floor + 2) max: 0
]

{ #category : 'calculating' }
SDL3TileManager >> visibleTileKeys [
	"Calculate visible tiles for the current camera state."

	| lod fractalTileSize minFractal maxFractal startX startY endX endY keys |
	lod := self lod.
	fractalTileSize := 4.0 / (2 ** lod). "Width 4.0 is base scale"
	
	"Viewport bounds in fractal space"
	minFractal := camera logicalToFractal: 0 @ 0.
	maxFractal := camera logicalToFractal: camera viewportExtent.
	
	startX := ((minFractal x min: maxFractal x) / fractalTileSize) floor.
	endX := ((minFractal x max: maxFractal x) / fractalTileSize) floor.
	startY := ((minFractal y min: maxFractal y) / fractalTileSize) floor.
	endY := ((minFractal y max: maxFractal y) / fractalTileSize) floor.
	
	keys := OrderedCollection new.
	startX to: endX do: [ :x |
		startY to: endY do: [ :y |
			keys add: {x . y . lod} ] ].
	^ keys
]
