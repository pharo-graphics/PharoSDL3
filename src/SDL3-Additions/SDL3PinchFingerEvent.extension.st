Extension { #name : 'SDL3PinchFingerEvent' }

{ #category : '*SDL3-Additions' }
SDL3PinchFingerEvent >> printOn: aStream [

	super printOn: aStream.
	aStream
		nextPutAll: ' scale: ';
		print: self scale
]
