Extension { #name : 'SDL3WindowPixelSizeChangedEvent' }

{ #category : '*SDL3-Own' }
SDL3WindowPixelSizeChangedEvent >> extent [
	"Answer the new extent"

	^ self width @ self height
]

{ #category : '*SDL3-Own' }
SDL3WindowPixelSizeChangedEvent >> height [
	"Answer the new height"

	^ self data2
]

{ #category : '*SDL3-Own' }
SDL3WindowPixelSizeChangedEvent >> width [
	"Answer the new width"

	^ self data1
]
