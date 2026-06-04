Extension { #name : 'SDL3Semaphore' }

{ #category : '*SDL3-Own' }
SDL3Semaphore class >> unsafeNew: initialValue [

	^ (self ffiLibrary newSemaphore: initialValue)
		  assertNotNullReturn;
		  yourself
]
