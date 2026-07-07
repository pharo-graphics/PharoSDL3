"
I demonstrate how to use the SDL3 Camera API in Pharo.

I capture frames from a connected camera and render them to a texture. I'm a simplified adaptation of SDL3's `test/testcamera.c`.
"
Class {
	#name : 'SDL3CameraDemoApp',
	#superclass : 'SDL3ConsoleDemoApp',
	#instVars : [
		'camera',
		'texture',
		'currentFrame'
	],
	#category : 'SDL3-Demos-API',
	#package : 'SDL3-Demos',
	#tag : 'API'
}

{ #category : 'rendering' }
SDL3CameraDemoApp >> acquireFrameIfAvailable: aBlock [

	| acquiredFrame |
	camera ifNil: [ ^ self ].

	acquiredFrame := camera acquireFrameTimestampNS: nil ifNotAvailable: [ ^ self ].

	"testcamera.c says:
		It's not needed to keep the frame once updated the texture is updated.
		But in case of 0-copy, it's needed to have the frame while using the texture."
	(currentFrame notNil and: [ currentFrame isNull not ]) ifTrue: [
		camera releaseFrame: currentFrame ].

	currentFrame := acquiredFrame.
	aBlock value

]

{ #category : 'rendering' }
SDL3CameraDemoApp >> adjustWindowToNewFrameExtent [

	window
		extent: currentFrame extent;
		centerBoth
]

{ #category : 'lifecycle' }
SDL3CameraDemoApp >> chooseCamera [

	| ids cameraId |
	ids := sdl allCameraIDs.
	
	ids ifEmpty: [
		^ console addLine: 'No available cameras!' ].

	console addLine: 'Available cameras:'.
	ids do: [ :each |
		console addLine: (self descriptionForCameraId: each) ].

	camera
		ifNil: [ cameraId := ids first ]
		ifNotNil: [
			| currentId |
			"Return now if there isn't another camera"
			ids size > 1 ifFalse: [ ^ self ].

			"Close current camera and will look for next camera"
			currentId := ids indexOf: camera id.
			cameraId := ids atWrap: currentId + 1.
			camera close.
			camera := nil ].

	console addLine: 'Opening camera: ', (self descriptionForCameraId: cameraId).

"	specs := sdl allCameraSupportedFormatsOf: cameraId."
	camera := SDL3Camera unsafeOpenInstanceId: cameraId spec: nil.
	camera isNull ifTrue: [
		console addLine: 'Opening camera ERROR: ', sdl getError asString.
		^ camera := nil ].

	console addLine: 'Opening camera SUCCESS'
]

{ #category : 'lifecycle' }
SDL3CameraDemoApp >> close [

	(currentFrame notNil and: [ currentFrame isNull not ]) ifTrue: [
		camera releaseFrame: currentFrame ].

	camera ifNotNil: [
		camera close.
		camera := nil ].

	texture ifNotNil: [
		texture destroy.
		texture := nil ].

	super close
]

{ #category : 'printing' }
SDL3CameraDemoApp >> descriptionForCameraId: cameraId [

	^ '[{1}] "{2}"' format: { cameraId. sdl getCameraName: cameraId }
]

{ #category : 'accessing' }
SDL3CameraDemoApp >> initialExtent [

	^ 640 @ 480
]

{ #category : 'accessing' }
SDL3CameraDemoApp >> initialWindowFlags [

	^ SDL_WINDOW_RESIZABLE
]

{ #category : 'lifecycle' }
SDL3CameraDemoApp >> prepareToLoop [

	super prepareToLoop.

	self chooseCamera
]

{ #category : 'rendering' }
SDL3CameraDemoApp >> render [
	
	renderer renderDrawColor: Color black.
	renderer renderClear.
	texture ifNotNil: [
		renderer renderTexture: texture srcrect: nil dstrect: nil ].
	console renderOn: renderer.
	renderer renderPresent
]

{ #category : 'hooks' }
SDL3CameraDemoApp >> step [

	self acquireFrameIfAvailable: [
		self updateTextureFromCurrentFrame ].
	self render
]

{ #category : 'hooks' }
SDL3CameraDemoApp >> subsystemInitFlags [

	^ super subsystemInitFlags | SDL_INIT_CAMERA
]

{ #category : 'rendering' }
SDL3CameraDemoApp >> updateTextureFromCurrentFrame [

	"Create texture if it's the first frame or frame extent changed"
	(texture isNil or: [ texture extent ~= currentFrame extent ]) ifTrue: [
		| propertyGroup |
		propertyGroup := SDL3PropertyGroup unsafeNew
			numberAt: SDL_PROP_TEXTURE_CREATE_FORMAT_NUMBER
				put: currentFrame format;
			numberAt: SDL_PROP_TEXTURE_CREATE_COLORSPACE_NUMBER
				put: currentFrame colorspace;
			numberAt: SDL_PROP_TEXTURE_CREATE_ACCESS_NUMBER
				put: SDL_TEXTUREACCESS_STREAMING;
			numberAt: SDL_PROP_TEXTURE_CREATE_WIDTH_NUMBER
				put: currentFrame w;
			numberAt: SDL_PROP_TEXTURE_CREATE_HEIGHT_NUMBER
				put: currentFrame h;
			yourself.
		texture ifNotNil: [ texture destroy ].
		texture := renderer newTextureWithProperties: propertyGroup.
		propertyGroup destroy.

		self adjustWindowToNewFrameExtent ].
	texture updateRect: nil pixels: currentFrame pixels pitch: currentFrame pitch
]

{ #category : 'accessing' }
SDL3CameraDemoApp >> updatedTitle [

	^ super updatedTitle, ' - SPACE to toggle camera'
]

{ #category : 'visiting - concrete' }
SDL3CameraDemoApp >> visitCameraDeviceApprovedEvent: aCameraDeviceApprovedEvent [

	super visitCameraDeviceApprovedEvent: aCameraDeviceApprovedEvent.

	console addLine: 'Camera permission approved: ', (self descriptionForCameraId: aCameraDeviceApprovedEvent which)
]

{ #category : 'visiting - concrete' }
SDL3CameraDemoApp >> visitCameraDeviceDeniedEvent: aCameraDeviceDeniedEvent [

	super visitCameraDeviceDeniedEvent: aCameraDeviceDeniedEvent.

	console addLine: 'Camera permission denied: ', (self descriptionForCameraId: aCameraDeviceDeniedEvent which)
]

{ #category : 'hooks' }
SDL3CameraDemoApp >> visitKeyboardDownEvent: aKeyboardDownEvent [

	super visitKeyboardDownEvent: aKeyboardDownEvent.

	aKeyboardDownEvent key = SDLK_SPACE asInteger ifTrue: [ self chooseCamera ]
]
