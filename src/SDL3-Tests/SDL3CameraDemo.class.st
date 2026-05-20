"
I demonstrate how to use the SDL3 Camera API in Pharo.

I capture frames from a connected camera and render them to a texture. I'm a simplified adaptation of SDL3's `test/testcamera.c`.
"
Class {
	#name : 'SDL3CameraDemo',
	#superclass : 'SDL3Demo',
	#instVars : [
		'camera',
		'texture',
		'currentFrameSurface'
	],
	#category : 'SDL3-Tests-Camera',
	#package : 'SDL3-Tests',
	#tag : 'Camera'
}

{ #category : 'lifecycle' }
SDL3CameraDemo >> close [

	(currentFrameSurface notNil and: [ currentFrameSurface isNull not ]) ifTrue: [
		camera releaseFrame: currentFrameSurface ].

	camera ifNotNil: [
		camera close.
		camera := nil ].

	texture ifNotNil: [
		texture destroy.
		texture := nil ].

	super close
]

{ #category : 'initialization' }
SDL3CameraDemo >> initialize [

	super initialize.
	initialExtent := 640 @ 480.
	initialWindowFlags := SDL3WindowFlags resizable
]

{ #category : 'running' }
SDL3CameraDemo >> iterateUntilQuit [

	| quit |
	quit := false.

	[ quit ] whileFalse: [
		self pollEventsDo: [ :evt |
			evt type = SDL_EVENT_QUIT ifTrue: [ quit := true ].
			evt type = SDL_EVENT_KEY_DOWN ifTrue: [
				evt key = SDLK_ESCAPE asInteger ifTrue: [ quit := true ].
				evt key = SDLK_SPACE asInteger ifTrue: [ self nextCamera ] ].
				
			evt type = SDL_EVENT_CAMERA_DEVICE_APPROVED ifTrue: [
				Stdio stdout << 'Camera Approved!'; lf.
				"self nextCamera" ].
			evt type = SDL_EVENT_CAMERA_DEVICE_DENIED ifTrue: [
				Stdio stdout << 'Camera Denied!'; lf.
				sdl showSimpleMessageBoxFlags: SDL_MESSAGEBOX_ERROR title: 'Camera Error' message: 'Camera permission denied!' window: window.
				quit := true ].
		].
		
		self render.
		
		24 milliSeconds wait
	]
]

{ #category : 'initialization' }
SDL3CameraDemo >> nextCamera [

	| ids cameraId |
	ids := sdl allCameraIDs.
	
	ids ifEmpty: [
		Stdio stdout << 'No available cameras'; lf.
		^ self ].

	window title: ('Available cameras: {1}' format: { ids }).

	camera
		ifNil: [ cameraId := ids first ]
		ifNotNil: [
			| currentId |
			"Return now if there isn't another camera"
			ids size > 1 ifFalse: [ ^ self ].

			"Close current camera and will try to seach next camera"
			currentId := ids indexOf: camera id.
			cameraId := ids atWrap: currentId + 1.
			camera close.
			camera := nil ].

	window title: ('Opening camera: {1}' format: { cameraId }).

"	specs := sdl allCameraSupportedFormatsOf: cameraId."
	camera := sdl openCameraInstanceId: cameraId spec: nil.
	camera isNull ifTrue: [ ^ camera := nil ].

	window title: ('SDL3 Camera Demo: {1} - ESC to quit' format: { camera name } )
]

{ #category : 'lifecycle' }
SDL3CameraDemo >> open [

	sdl initSubSystem: SDL_INIT_CAMERA.
	super open.
	self nextCamera
]

{ #category : 'rendering' }
SDL3CameraDemo >> render [

	| nextFrameSurface props |
	camera ifNil: [ ^ self ].

	nextFrameSurface := camera acquireFrameTimestampNS: nil.

	"NULL means no available frame"
	nextFrameSurface isNull ifTrue: [ ^ self ].

	"testcamera.c says:
		It's not needed to keep the frame once updated the texture is updated.
		But in case of 0-copy, it's needed to have the frame while using the texture."
	(currentFrameSurface notNil and: [ currentFrameSurface isNull not ]) ifTrue: [
		camera releaseFrame: currentFrameSurface ].
	currentFrameSurface := nextFrameSurface.

	(texture isNil or: [ texture w ~= nextFrameSurface w or: [ texture h ~= nextFrameSurface h ] ]) ifTrue: [
		window
			extent: nextFrameSurface extent;
			centerBoth.

		texture ifNotNil: [ texture destroy ].
		
		props := sdl newPropertyGroup.
		props numberAt: SDL_PROP_TEXTURE_CREATE_FORMAT_NUMBER put: nextFrameSurface format.
		props numberAt: SDL_PROP_TEXTURE_CREATE_COLORSPACE_NUMBER put: nextFrameSurface colorspace.
		props numberAt: SDL_PROP_TEXTURE_CREATE_ACCESS_NUMBER put: SDL_TEXTUREACCESS_STREAMING.
		props numberAt: SDL_PROP_TEXTURE_CREATE_WIDTH_NUMBER put: nextFrameSurface w.
		props numberAt: SDL_PROP_TEXTURE_CREATE_HEIGHT_NUMBER put: nextFrameSurface h.
		texture := renderer newTextureWithProperties: props.
		props destroy.
		texture assertNotNullReturn ].
	
	texture updateRect: nil pixels: nextFrameSurface pixels pitch: nextFrameSurface pitch.
	
	renderer renderDrawColor: Color black.
	renderer renderClear.
	renderer renderTexture: texture srcrect: nil dstrect: nil.
	renderer renderPresent
]

{ #category : 'running' }
SDL3CameraDemo >> run [
	"Run headless with:
	./pharo Pharo.image eval 'SDL3CameraDemo new run'
	"

	[ 
		self open.
		self iterateUntilQuit
	] ensure: [ self close ]
]
