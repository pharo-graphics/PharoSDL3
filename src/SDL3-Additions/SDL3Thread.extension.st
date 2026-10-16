Extension { #name : 'SDL3Thread' }

{ #category : '*SDL3-Additions' }
SDL3Thread class >> unownedNewFn: fn name: aString data: data [

	^ (self ffiLibrary createThreadFn: fn name: aString data: data)
		  assertNotNullReturn;
		  yourself
]
