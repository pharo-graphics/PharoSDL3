Extension { #name : 'SDL3GamepadDeviceEvent' }

{ #category : '*SDL3-Own' }
SDL3GamepadDeviceEvent class >> eventTypeSelectors [

	^ #(#gamepadRemapped #gamepadSteamHandleUpdated #gamepadAdded #gamepadRemoved #gamepadUpdateComplete)
]
