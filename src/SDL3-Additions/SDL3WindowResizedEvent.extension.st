Extension { #name : 'SDL3WindowResizedEvent' }

{ #category : '*SDL3-Additions' }
SDL3WindowResizedEvent >> extent [
	"Answer the new extent"

	^ self width @ self height
]

{ #category : '*SDL3-Additions' }
SDL3WindowResizedEvent >> height [
	"Answer the new height"

	^ self data2
]

{ #category : '*SDL3-Additions' }
SDL3WindowResizedEvent >> width [
	"Answer the new width"

	^ self data1
]
