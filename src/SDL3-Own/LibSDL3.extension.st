Extension { #name : 'LibSDL3' }

{ #category : '*SDL3-Own' }
LibSDL3 >> renderDrivers [

	| result |
	result := OrderedCollection new.
	0 to: self getNumRenderDrivers - 1 do: [ :zeroBasedIndex |
		result add: (self getRenderDriver: zeroBasedIndex) ].
	^ result
]
