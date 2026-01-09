Extension { #name : 'SDL3Rect' }

{ #category : '*SDL3-Own' }
SDL3Rect >> asRectangle [

	^ self origin extent: self extent
]

{ #category : '*SDL3-Own' }
SDL3Rect >> extent [

	^ self w @ self h
]

{ #category : '*SDL3-Own' }
SDL3Rect >> origin [

	^ self x @ self y
]
