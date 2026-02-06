Extension { #name : 'Color' }

{ #category : '*SDL3-Own' }
Color >> asSDL3FColor [

	^ SDL3FColor r: self red g: self green b: self blue a: self alpha
]
