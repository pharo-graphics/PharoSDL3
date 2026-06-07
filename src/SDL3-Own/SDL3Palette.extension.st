Extension { #name : 'SDL3Palette' }

{ #category : '*SDL3-Own' }
SDL3Palette class >> unsafeNew: ncolors [

	^ (self ffiLibrary newPalette: ncolors)
		  assertNotNullReturn;
		  yourself
]
