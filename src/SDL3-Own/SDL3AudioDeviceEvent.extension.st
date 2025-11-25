Extension { #name : 'SDL3AudioDeviceEvent' }

{ #category : '*SDL3-Own' }
SDL3AudioDeviceEvent class >> eventTypeSelectors [

	^ #(#audioDeviceRemoved #audioDeviceFormatChanged #audioDeviceAdded)
]
