"
I hold the generated texture data for a set of glyphs and a map from characters to their UV coordinates/bounds within the atlas.
"
Class {
	#name : 'SDL3TextAtlas',
	#superclass : 'Object',
	#instVars : [
		'width',
		'height',
		'dataPtr',
		'glyphMap',
		'fontMetrics',
		'surface',
		'deviceScale'
	],
	#category : 'SDL3-GPUDemos-TextScroll',
	#package : 'SDL3-GPUDemos',
	#tag : 'TextScroll'
}

{ #category : 'accessing' }
SDL3TextAtlas >> dataPtr [

	^ dataPtr
]

{ #category : 'accessing' }
SDL3TextAtlas >> dataPtr: anObject [

	dataPtr := anObject
]

{ #category : 'accessing' }
SDL3TextAtlas >> deviceScale [

	^ deviceScale
]

{ #category : 'accessing' }
SDL3TextAtlas >> deviceScale: anObject [

	deviceScale := anObject
]

{ #category : 'accessing' }
SDL3TextAtlas >> fontMetrics [

	^ fontMetrics
]

{ #category : 'accessing' }
SDL3TextAtlas >> fontMetrics: anObject [

	fontMetrics := anObject
]

{ #category : 'accessing' }
SDL3TextAtlas >> glyphMap [

	^ glyphMap
]

{ #category : 'accessing' }
SDL3TextAtlas >> glyphMap: anObject [

	glyphMap := anObject
]

{ #category : 'accessing' }
SDL3TextAtlas >> height [

	^ height
]

{ #category : 'accessing' }
SDL3TextAtlas >> height: anObject [

	height := anObject
]

{ #category : 'accessing' }
SDL3TextAtlas >> surface [

	^ surface
]

{ #category : 'accessing' }
SDL3TextAtlas >> surface: anObject [

	surface := anObject
]

{ #category : 'accessing' }
SDL3TextAtlas >> width [

	^ width
]

{ #category : 'accessing' }
SDL3TextAtlas >> width: anObject [

	width := anObject
]
