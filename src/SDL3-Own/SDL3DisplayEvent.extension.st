Extension { #name : 'SDL3DisplayEvent' }

{ #category : '*SDL3-Own' }
SDL3DisplayEvent class >> eventTypeSelectors [

	^ #(#displayMoved #displayUsableBoundsChanged #displayRemoved #displayCurrentModeChanged #displayAdded #displayOrientation #displayContentScaleChanged #displayDesktopModeChanged)
]
