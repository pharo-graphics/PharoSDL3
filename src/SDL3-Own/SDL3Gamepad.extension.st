Extension { #name : 'SDL3Gamepad' }

{ #category : '*SDL3-Own' }
SDL3Gamepad >> propertyGroup [

	^ SDL3PropertyGroup id: self propertiesID
]

{ #category : '*SDL3-Own' }
SDL3Gamepad class >> unsafeOpen: instanceId [

	^ (self ffiLibrary openGamepad: instanceId)
		  assertNotNullReturn;
		  yourself
]
