Extension { #name : 'SDL3TouchFingerEvent' }

{ #category : '*SDL3-Own' }
SDL3TouchFingerEvent class >> eventTypeSelectors [

	^ #(#fingerDown #fingerMotion #fingerCanceled #fingerUp)
]
