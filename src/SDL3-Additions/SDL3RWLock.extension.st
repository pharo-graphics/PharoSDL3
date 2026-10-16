Extension { #name : 'SDL3RWLock' }

{ #category : '*SDL3-Additions' }
SDL3RWLock class >> unownedNew [

	^ (self ffiLibrary createRWLock)
		  assertNotNullReturn;
		  yourself
]
