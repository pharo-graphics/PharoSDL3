Extension { #name : 'SDL3Semaphore' }

{ #category : '*SDL3-Additions' }
SDL3Semaphore class >> unownedNew: initialValue [

	^ (self ffiLibrary createSemaphore: initialValue)
		  assertNotNullReturn;
		  yourself
]
