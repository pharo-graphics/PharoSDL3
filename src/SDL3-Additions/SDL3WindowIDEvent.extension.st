Extension { #name : 'SDL3WindowIDEvent' }

{ #category : '*SDL3-Additions' }
SDL3WindowIDEvent >> printOn: aStream [

	super printOn: aStream.
	aStream
		nextPutAll: ' windowID: ';
		print: self windowID
]

{ #category : '*SDL3-Additions' }
SDL3WindowIDEvent >> window [

	^ self ffiLibrary getWindowFromEvent: self
]
