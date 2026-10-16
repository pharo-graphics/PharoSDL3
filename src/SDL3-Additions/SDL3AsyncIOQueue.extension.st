Extension { #name : 'SDL3AsyncIOQueue' }

{ #category : '*SDL3-Additions' }
SDL3AsyncIOQueue class >> unownedNew [

	^ (self ffiLibrary createAsyncIOQueue)
		  assertNotNullReturn;
		  yourself
]
