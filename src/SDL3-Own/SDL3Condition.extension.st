Extension { #name : 'SDL3Condition' }

{ #category : '*SDL3-Own' }
SDL3Condition class >> unownedNew [

	^ (self ffiLibrary createCondition)
		  assertNotNullReturn;
		  yourself
]
