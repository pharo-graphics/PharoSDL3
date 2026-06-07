Extension { #name : 'SDL3Mutex' }

{ #category : '*SDL3-Own' }
SDL3Mutex class >> unsafeNew [

	^ (self ffiLibrary newMutex)
		  assertNotNullReturn;
		  yourself
]
