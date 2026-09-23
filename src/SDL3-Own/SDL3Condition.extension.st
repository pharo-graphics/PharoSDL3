Extension { #name : 'SDL3Condition' }

{ #category : '*SDL3-Own' }
SDL3Condition class >> unsafeNew [

	^ (self ffiLibrary createCondition)
		  assertNotNullReturn;
		  yourself
]
