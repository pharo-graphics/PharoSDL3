Extension { #name : 'SDL3Mutex' }

{ #category : '*SDL3-Additions' }
SDL3Mutex class >> unownedNew [

	^ (self ffiLibrary createMutex)
		  assertNotNullReturn;
		  yourself
]
