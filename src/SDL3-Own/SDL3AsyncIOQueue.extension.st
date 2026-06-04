Extension { #name : 'SDL3AsyncIOQueue' }

{ #category : '*SDL3-Own' }
SDL3AsyncIOQueue class >> unsafeNew [

	^ (self ffiLibrary newAsyncIOQueue)
		  assertNotNullReturn;
		  yourself
]
