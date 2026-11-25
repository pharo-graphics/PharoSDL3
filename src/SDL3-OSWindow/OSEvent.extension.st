Extension { #name : 'OSEvent' }

{ #category : '*SDL3-OSWindow' }
OSEvent >> deliverForOSSDL3BackendWindow: aBackendWindow [
	"Bind this event to the backend window's OSWindow and deliver it."

	self window: aBackendWindow osWindow.
	self deliver
]
