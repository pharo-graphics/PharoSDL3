Extension { #name : 'SDL3Sensor' }

{ #category : '*SDL3-API' }
SDL3Sensor >> close [

	^ self ffiLibrary closeSensor: self
]

{ #category : '*SDL3-API' }
SDL3Sensor >> getDataInto: data numValues: num_values [

	^ self ffiLibrary getSensorDataSensor: self data: data numValues: num_values
]

{ #category : '*SDL3-API' }
SDL3Sensor >> id [

	^ self ffiLibrary getSensorID: self
]

{ #category : '*SDL3-API' }
SDL3Sensor >> name [

	^ self ffiLibrary getSensorName: self
]

{ #category : '*SDL3-API' }
SDL3Sensor >> nonPortableType [

	^ self ffiLibrary getSensorNonPortableType: self
]

{ #category : '*SDL3-API' }
SDL3Sensor >> propertiesID [

	^ self ffiLibrary getSensorProperties: self
]

{ #category : '*SDL3-API' }
SDL3Sensor >> type [

	^ self ffiLibrary getSensorType: self
]
