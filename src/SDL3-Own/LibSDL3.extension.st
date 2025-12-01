Extension { #name : 'LibSDL3' }

{ #category : '*SDL3-Own' }
LibSDL3 >> gpuDrivers [

	| result |
	result := OrderedCollection new.
	0 to: self getNumGPUDrivers - 1 do: [ :zeroBasedIndex |
		result add: (self getGPUDriver: zeroBasedIndex) ].
	^ result
]

{ #category : '*SDL3-Own' }
LibSDL3 >> renderDrivers [

	| result |
	result := OrderedCollection new.
	0 to: self getNumRenderDrivers - 1 do: [ :zeroBasedIndex |
		result add: (self getRenderDriver: zeroBasedIndex) ].
	^ result
]

{ #category : '*SDL3-Own' }
LibSDL3 >> videoDrivers [

	| result |
	result := OrderedCollection new.
	0 to: self getNumVideoDrivers - 1 do: [ :zeroBasedIndex |
		result add: (self getVideoDriver: zeroBasedIndex) ].
	^ result
]
