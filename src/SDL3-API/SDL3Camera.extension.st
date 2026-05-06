Extension { #name : 'SDL3Camera' }

{ #category : '*SDL3-API' }
SDL3Camera >> acquireFrameTimestampNS: timestampNS [

	^ self ffiLibrary acquireCameraFrameCamera: self timestampNS: timestampNS
]

{ #category : '*SDL3-API' }
SDL3Camera >> close [

	^ self ffiLibrary closeCamera: self
]

{ #category : '*SDL3-API' }
SDL3Camera >> getFormatIntoSpec: spec [

	^ self ffiLibrary getCameraFormatCamera: self spec: spec
]

{ #category : '*SDL3-API' }
SDL3Camera >> id [

	^ self ffiLibrary getCameraID: self
]

{ #category : '*SDL3-API' }
SDL3Camera >> permissionState [

	^ self ffiLibrary getCameraPermissionState: self
]

{ #category : '*SDL3-API' }
SDL3Camera >> propertiesID [

	^ self ffiLibrary getCameraProperties: self
]

{ #category : '*SDL3-API' }
SDL3Camera >> releaseFrame: frame [

	^ self ffiLibrary releaseCameraFrameCamera: self frame: frame
]
