Extension { #name : 'SDL3AudioStream' }

{ #category : '*SDL3-Own' }
SDL3AudioStream >> device [

	| audioDeviceID |
	audioDeviceID := self deviceID.

	audioDeviceID = 0 ifTrue: [
		SDL3Error new signal: '0 if not bound or invalid' ].

	^ SDL3AudioDevice id: audioDeviceID
]
