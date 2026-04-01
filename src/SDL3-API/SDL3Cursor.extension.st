Extension { #name : 'SDL3Cursor' }

{ #category : '*SDL3-API' }
SDL3Cursor >> destroy [

	^ self ffiLibrary destroyCursor: self
]

{ #category : '*SDL3-API' }
SDL3Cursor >> setActive [

	^ self ffiLibrary setCursor: self
]
