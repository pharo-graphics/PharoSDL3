Extension { #name : 'SDL3AudioStream' }

{ #category : '*SDL3-Own' }
SDL3AudioStream >> device [

	| audioDeviceID |
	audioDeviceID := self deviceID.

	audioDeviceID = 0 ifTrue: [
		SDL3Error new signal: 'SDL_AudioStream is invalid or not bound' ].

	^ SDL3AudioDevice id: audioDeviceID
]

{ #category : '*SDL3-Own' }
SDL3AudioStream >> propertyGroup [

	^ SDL3PropertyGroup id: self propertiesID
]
