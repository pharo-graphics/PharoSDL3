Extension { #name : 'SDL3Camera' }

{ #category : '*SDL3-Own' }
SDL3Camera >> formatSpec [

	| spec |
	spec := SDL_CameraSpec new.

	self ffiLibrary assertSuccess: (self getFormatIntoSpec: spec).
	
	^ spec
]

{ #category : '*SDL3-Own' }
SDL3Camera >> name [

	^ self ffiLibrary getCameraName: self id
]

{ #category : '*SDL3-Own' }
SDL3Camera >> propertyGroup [

	^ SDL3PropertyGroup id: self propertiesID
]
