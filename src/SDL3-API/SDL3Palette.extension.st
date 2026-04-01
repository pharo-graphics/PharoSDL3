Extension { #name : 'SDL3Palette' }

{ #category : '*SDL3-API' }
SDL3Palette >> colors: colors firstcolor: firstcolor ncolors: ncolors [

	^ self ffiLibrary
		  setPaletteColorsPalette: self
		  colors: colors
		  firstcolor: firstcolor
		  ncolors: ncolors
]

{ #category : '*SDL3-API' }
SDL3Palette >> destroy [

	^ self ffiLibrary destroyPalette: self
]
