Extension { #name : 'SDL3WindowExposedEvent' }

{ #category : '*SDL3-Own' }
SDL3WindowExposedEvent >> isLiveResize [
	"data1 is 1 for live-resize expose events, 0 otherwise"

	^ self data1 = 1
]
