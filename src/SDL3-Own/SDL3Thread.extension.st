Extension { #name : 'SDL3Thread' }

{ #category : '*SDL3-Own' }
SDL3Thread class >> unsafeNewFn: fn name: aString data: data [

	^ (self ffiLibrary newThreadFn: fn name: aString data: data)
		  assertNotNullReturn;
		  yourself
]
