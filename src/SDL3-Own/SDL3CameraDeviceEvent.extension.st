Extension { #name : 'SDL3CameraDeviceEvent' }

{ #category : '*SDL3-Own' }
SDL3CameraDeviceEvent class >> eventTypeSelectors [

	^ #(#cameraDeviceDenied #cameraDeviceAdded #cameraDeviceApproved #cameraDeviceRemoved)
]
