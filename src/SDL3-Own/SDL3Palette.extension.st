Extension { #name : 'SDL3Palette' }

{ #category : '*SDL3-Own' }
SDL3Palette >> colors: colors firstcolor: firstcolor ncolors: ncolors [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			setPaletteColorsPalette: self
			colors: colors
			firstcolor: firstcolor
			ncolors: ncolors)
]

{ #category : '*SDL3-Own' }
SDL3Palette >> destroy [

	self ffiLibrary destroyPalette: self
]

{ #category : '*SDL3-Own' }
SDL3Palette class >> unsafeNew: ncolors [

	^ (self ffiLibrary newPalette: ncolors)
		  assertNotNullReturn;
		  yourself
]
