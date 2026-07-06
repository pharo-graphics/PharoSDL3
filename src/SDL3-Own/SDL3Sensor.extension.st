Extension { #name : 'SDL3Sensor' }

{ #category : '*SDL3-Own' }
SDL3Sensor >> close [

	self ffiLibrary closeSensor: self
]

{ #category : '*SDL3-Own' }
SDL3Sensor >> getDataInto: data numValues: numValues [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			getSensorDataSensor: self
			data: data
			numValues: numValues)
]

{ #category : '*SDL3-Own' }
SDL3Sensor >> id [

	^ self ffiLibrary getSensorID: self
]

{ #category : '*SDL3-Own' }
SDL3Sensor >> name [

	^ self ffiLibrary getSensorName: self
]

{ #category : '*SDL3-Own' }
SDL3Sensor >> nonPortableType [

	^ self ffiLibrary getSensorNonPortableType: self
]

{ #category : '*SDL3-Own' }
SDL3Sensor >> propertiesID [

	^ self ffiLibrary getSensorProperties: self
]

{ #category : '*SDL3-Own' }
SDL3Sensor >> propertyGroup [

	^ SDL3PropertyGroup id: self propertiesID
]

{ #category : '*SDL3-Own' }
SDL3Sensor >> type [

	^ self ffiLibrary getSensorType: self
]

{ #category : '*SDL3-Own' }
SDL3Sensor class >> unsafeOpen: instanceId [

	^ (self ffiLibrary openSensor: instanceId)
		  assertNotNullReturn;
		  yourself
]
