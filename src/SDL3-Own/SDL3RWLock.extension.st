Extension { #name : 'SDL3RWLock' }

{ #category : '*SDL3-Own' }
SDL3RWLock class >> unsafeNew [

	^ (self ffiLibrary createRWLock)
		  assertNotNullReturn;
		  yourself
]
