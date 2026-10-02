Extension { #name : 'SDL3RWLock' }

{ #category : '*SDL3-Own' }
SDL3RWLock class >> unownedNew [

	^ (self ffiLibrary createRWLock)
		  assertNotNullReturn;
		  yourself
]
