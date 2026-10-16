Extension { #name : 'SDL3Condition' }

{ #category : '*SDL3-Additions' }
SDL3Condition class >> unownedNew [

	^ (self ffiLibrary createCondition)
		  assertNotNullReturn;
		  yourself
]
