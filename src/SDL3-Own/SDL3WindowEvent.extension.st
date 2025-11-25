Extension { #name : 'SDL3WindowEvent' }

{ #category : '*SDL3-Own' }
SDL3WindowEvent class >> eventTypeSelectors [

	^ #(#windowShown #windowPixelSizeChanged #windowMinimized #windowMetalViewResized #windowHidden #windowLeaveFullscreen #windowHitTest #windowMoved #windowEnterFullscreen #windowDestroyed #windowHdrStateChanged #windowFocusLost #windowRestored #windowSafeAreaChanged #windowResized #windowMouseLeave #windowMouseEnter #windowDisplayScaleChanged #windowExposed #windowOccluded #windowFocusGained #windowDisplayChanged #windowMaximized #windowIccprofChanged #windowCloseRequested)
]
