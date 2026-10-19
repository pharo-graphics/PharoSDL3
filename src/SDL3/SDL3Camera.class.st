"
I am a SDL3 FFI binding for `SDL_Camera`.

The opaque structure used to identify an opened SDL camera.

See: https://wiki.libsdl.org/SDL3/SDL_Camera
"
Class {
	#name : 'SDL3Camera',
	#superclass : 'SDL3BaseObject',
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'instance creation' }
SDL3Camera class >> unownedOpenInstanceID: instanceId spec: spec [

	^ (self ffiLibrary openCameraInstanceId: instanceId spec: spec)
		  assertNotNullReturn;
		  yourself
]

{ #category : 'accessing' }
SDL3Camera >> acquireFrameTimestampNS: timestampNS [

	^ self ffiLibrary acquireCameraFrameCamera: self timestampNS: timestampNS
]

{ #category : 'accessing' }
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

{ #category : 'finalization' }
SDL3Camera >> close [

	self ffiLibrary closeCamera: self
]

{ #category : 'finalization' }
SDL3Camera >> destroy [

	self close
]

{ #category : 'accessing' }
SDL3Camera >> formatSpec [

	| spec |
	spec := SDL_CameraSpec new.

	self ffiLibrary assertSuccess: (self getFormatIntoSpec: spec).

	^ spec
]

{ #category : 'accessing' }
SDL3Camera >> getFormatIntoSpec: spec [

	self ffiLibrary assertSuccess:
		(self ffiLibrary getCameraFormatCamera: self spec: spec)
]

{ #category : 'accessing' }
SDL3Camera >> id [

	^ self ffiLibrary getCameraID: self
]

{ #category : 'accessing' }
SDL3Camera >> name [

	^ self ffiLibrary getCameraName: self id
]

{ #category : 'accessing' }
SDL3Camera >> permissionState [

	^ self ffiLibrary getCameraPermissionState: self
]

{ #category : 'accessing' }
SDL3Camera >> propertiesID [

	^ self ffiLibrary getCameraProperties: self
]

{ #category : 'accessing' }
SDL3Camera >> propertyGroup [

	^ SDL3PropertyGroup id: self propertiesID
]

{ #category : 'operations' }
SDL3Camera >> releaseFrame: frame [

	self ffiLibrary releaseCameraFrameCamera: self frame: frame
]
