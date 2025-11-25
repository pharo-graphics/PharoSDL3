Extension { #name : 'SDL3JoyDeviceEvent' }

{ #category : '*SDL3-Own' }
SDL3JoyDeviceEvent class >> eventTypeSelectors [

	^ #(#joystickAdded #joystickRemoved #joystickUpdateComplete)
]
