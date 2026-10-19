"
I am a SDL3 FFI binding for `SDL_Sensor`.

The opaque structure used to identify an opened SDL sensor.

See: https://wiki.libsdl.org/SDL3/SDL_Sensor
"
Class {
	#name : 'SDL3Sensor',
	#superclass : 'SDL3BaseObject',
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'instance creation' }
SDL3Sensor class >> unownedOpen: instanceId [

	^ (self ffiLibrary openSensor: instanceId)
		  assertNotNullReturn;
		  yourself
]

{ #category : 'finalization' }
SDL3Sensor >> close [

	self ffiLibrary closeSensor: self
]

{ #category : 'accessing' }
SDL3Sensor >> getDataInto: data numValues: numValues [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			getSensorDataSensor: self
			data: data
			numValues: numValues)
]

{ #category : 'accessing' }
SDL3Sensor >> id [

	^ self ffiLibrary getSensorID: self
]

{ #category : 'accessing' }
SDL3Sensor >> name [

	^ self ffiLibrary getSensorName: self
]

{ #category : 'accessing' }
SDL3Sensor >> nonPortableType [

	^ self ffiLibrary getSensorNonPortableType: self
]

{ #category : 'accessing' }
SDL3Sensor >> propertiesID [

	^ self ffiLibrary getSensorProperties: self
]

{ #category : 'accessing' }
SDL3Sensor >> propertyGroup [

	^ SDL3PropertyGroup id: self propertiesID
]

{ #category : 'accessing' }
SDL3Sensor >> type [

	^ self ffiLibrary getSensorType: self
]
