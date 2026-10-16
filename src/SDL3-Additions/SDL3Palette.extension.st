Extension { #name : 'SDL3Palette' }

{ #category : '*SDL3-Additions' }
SDL3Palette >> colors: colors firstcolor: firstcolor ncolors: ncolors [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			setPaletteColorsPalette: self
			colors: colors
			firstcolor: firstcolor
			ncolors: ncolors)
]

{ #category : '*SDL3-Additions' }
SDL3Palette >> destroy [

	self ffiLibrary destroyPalette: self
]

{ #category : '*SDL3-Additions' }
SDL3Palette >> dispose [

	(handle isNil or: [ self isNull ]) ifTrue: [ ^ self ].
	self destroy.
	handle := nil
]

{ #category : '*SDL3-Additions' }
SDL3Palette class >> unownedNew: ncolors [

	^ (self ffiLibrary createPalette: ncolors)
		  assertNotNullReturn;
		  yourself
]
