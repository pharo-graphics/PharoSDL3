Extension { #name : 'OSSDL2BackendWindow' }

{ #category : '*SDL3-OSWindow' }
OSSDL2BackendWindow >> shouldRegisterAfterRestart [

	^ sdl2Window isNotNil
]
