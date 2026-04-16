Extension { #name : 'LibSDL3' }

{ #category : '*SDL3-OSWindow' }
LibSDL3 >> isAvailable [

	^ [ self libraryName. true ]
		on: Error 
		do: [ :e | false ]
]
