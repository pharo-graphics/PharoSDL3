Extension { #name : 'SDL3Mutex' }

{ #category : '*SDL3-Own' }
SDL3Mutex class >> unownedNew [

	^ (self ffiLibrary createMutex)
		  assertNotNullReturn;
		  yourself
]
