Extension { #name : 'SDL3BaseObject' }

{ #category : '*SDL3-Own' }
SDL3BaseObject >> assertSuccess [

	^ self ffiLibrary assertSuccess: self
]
