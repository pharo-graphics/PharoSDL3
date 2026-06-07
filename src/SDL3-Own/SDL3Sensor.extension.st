Extension { #name : 'SDL3Sensor' }

{ #category : '*SDL3-Own' }
SDL3Sensor >> propertyGroup [

	^ SDL3PropertyGroup id: self propertiesID
]

{ #category : '*SDL3-Own' }
SDL3Sensor class >> unsafeOpen: instanceId [

	^ (self ffiLibrary openSensor: instanceId)
		  assertNotNullReturn;
		  yourself
]
