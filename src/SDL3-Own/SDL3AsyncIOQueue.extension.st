Extension { #name : 'SDL3AsyncIOQueue' }

{ #category : '*SDL3-Own' }
SDL3AsyncIOQueue class >> unownedNew [

	^ (self ffiLibrary createAsyncIOQueue)
		  assertNotNullReturn;
		  yourself
]
