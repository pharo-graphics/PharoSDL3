"
I generate a texture atlas from a set of characters using Athens.
"
Class {
	#name : 'SDL3TextAtlasGenerator',
	#superclass : 'Object',
	#instVars : [
		'fontSize',
		'familyName'
	],
	#category : 'SDL3-GPUDemos-TextScroll',
	#package : 'SDL3-GPUDemos',
	#tag : 'TextScroll'
}

{ #category : 'accessing' }
SDL3TextAtlasGenerator >> familyName [

	^ familyName
]

{ #category : 'accessing' }
SDL3TextAtlasGenerator >> familyName: anObject [

	familyName := anObject
]

{ #category : 'accessing' }
SDL3TextAtlasGenerator >> fontSize [

	^ fontSize
]

{ #category : 'accessing' }
SDL3TextAtlasGenerator >> fontSize: anObject [

	fontSize := anObject
]

{ #category : 'generating' }
SDL3TextAtlasGenerator >> generateAtlasFor: aCollectionOfCharacters [

	^ self generateAtlasFor: aCollectionOfCharacters deviceScale: 1 @ 1
]

{ #category : 'generating' }
SDL3TextAtlasGenerator >> generateAtlasFor: aCollectionOfCharacters deviceScale: deviceScale [
	| font totalWidth maxHeight atlasSurface glyphMap currentX padding |
	font := LogicalFont familyName: familyName pointSize: fontSize.

	padding := 2. "Add padding to prevent texture bleeding"

	"Calculate dimensions considering the device scale"
	totalWidth := ((aCollectionOfCharacters sum: [ :char | (font widthOfString: char asString) ceiling + padding ]) * deviceScale x) ceiling.
	"Align width to 4 bytes to match Cairo's A8 stride, preventing GPU upload skew"
	totalWidth := (totalWidth + 3) bitAnd: (3 bitInvert).
	maxHeight := (font height ceiling * deviceScale y) ceiling.

	atlasSurface := AthensCairoSurface extent: totalWidth @ maxHeight format: 2. "CAIRO_FORMAT_A8"
	atlasSurface deviceScale: deviceScale.

	glyphMap := Dictionary new.
	currentX := 0.

	atlasSurface drawDuring: [ :canvas |
		atlasSurface clear: Color transparent.
		canvas setFont: font.
		canvas setPaint: Color black.

		aCollectionOfCharacters do: [ :char | | charWidth |
			charWidth := (font widthOfString: char asString) ceiling.
			canvas pathTransform 
				loadIdentity;
				translateX: currentX Y: font getPreciseAscent.
			canvas drawString: char asString.

			glyphMap at: char put: (Rectangle 
				left: (currentX * deviceScale x) 
				right: ((currentX + charWidth) * deviceScale x) 
				top: 0 
				bottom: (font height ceiling * deviceScale y)).
			currentX := currentX + charWidth + padding.
		].
	].
	atlasSurface flush.

	^ SDL3TextAtlas new
		width: totalWidth;
		height: maxHeight;
		dataPtr: atlasSurface getDataPtr;
		surface: atlasSurface;
		deviceScale: deviceScale;
		glyphMap: glyphMap;
		fontMetrics: font;
		yourself
]

{ #category : 'initialization' }
SDL3TextAtlasGenerator >> initialize [

	super initialize.

	fontSize := 10.
	familyName := 'Source Sans Pro'.
]
