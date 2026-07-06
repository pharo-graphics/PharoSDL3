Extension { #name : 'SDL3Camera' }

{ #category : '*SDL3-Own' }
SDL3Camera >> acquireFrameTimestampNS: timestampNS [

	^ self ffiLibrary acquireCameraFrameCamera: self timestampNS: timestampNS
]

{ #category : '*SDL3-Own' }
SDL3Camera >> acquireFrameTimestampNS: timestampNS ifNotAvailable: aBlock [

	| acquiredFrame |
	acquiredFrame := self ffiLibrary
		acquireCameraFrameCamera: self
		timestampNS: timestampNS.

	"NULL means no available frame"
	^ acquiredFrame isNull
		ifTrue: [ aBlock value ]
		ifFalse: [ acquiredFrame ]
]

{ #category : '*SDL3-Own' }
SDL3Camera >> close [

	self ffiLibrary closeCamera: self
]

{ #category : '*SDL3-Own' }
SDL3Camera >> formatSpec [

	| spec |
	spec := SDL_CameraSpec new.

	self ffiLibrary assertSuccess: (self getFormatIntoSpec: spec).
	
	^ spec
]

{ #category : '*SDL3-Own' }
SDL3Camera >> getFormatIntoSpec: spec [

	self ffiLibrary assertSuccess:
		(self ffiLibrary getCameraFormatCamera: self spec: spec)
]

{ #category : '*SDL3-Own' }
SDL3Camera >> id [

	^ self ffiLibrary getCameraID: self
]

{ #category : '*SDL3-Own' }
SDL3Camera >> name [

	^ self ffiLibrary getCameraName: self id
]

{ #category : '*SDL3-Own' }
SDL3Camera >> permissionState [

	^ self ffiLibrary getCameraPermissionState: self
]

{ #category : '*SDL3-Own' }
SDL3Camera >> propertiesID [

	^ self ffiLibrary getCameraProperties: self
]

{ #category : '*SDL3-Own' }
SDL3Camera >> propertyGroup [

	^ SDL3PropertyGroup id: self propertiesID
]

{ #category : '*SDL3-Own' }
SDL3Camera >> releaseFrame: frame [

	self ffiLibrary releaseCameraFrameCamera: self frame: frame
]

{ #category : '*SDL3-Own' }
SDL3Camera class >> unsafeOpenInstanceId: instanceId spec: spec [

	^ (self ffiLibrary openCameraInstanceId: instanceId spec: spec)
		  assertNotNullReturn;
		  yourself
]
