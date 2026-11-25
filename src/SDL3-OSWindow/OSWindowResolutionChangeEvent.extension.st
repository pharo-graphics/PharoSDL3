Extension { #name : 'OSWindowResolutionChangeEvent' }

{ #category : '*SDL3-OSWindow' }
OSWindowResolutionChangeEvent >> deliverForOSSDL3BackendWindow: aBackendWindow [
	"Populate screenScaleFactor from the backend window (matching SDL2) before delivering."

	self screenScaleFactor: aBackendWindow screenScaleFactor.
	super deliverForOSSDL3BackendWindow: aBackendWindow
]
