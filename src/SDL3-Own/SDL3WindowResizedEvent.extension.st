Extension { #name : 'SDL3WindowResizedEvent' }

{ #category : '*SDL3-Own' }
SDL3WindowResizedEvent >> extent [
	"Answer the new extent"

	^ self width @ self height
]

{ #category : '*SDL3-Own' }
SDL3WindowResizedEvent >> height [
	"Answer the new height"

	^ self data2
]

{ #category : '*SDL3-Own' }
SDL3WindowResizedEvent >> width [
	"Answer the new width"

	^ self data1
]
