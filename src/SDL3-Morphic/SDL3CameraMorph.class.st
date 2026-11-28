Class {
	#name : 'SDL3CameraMorph',
	#superclass : 'SystemWindow',
	#instVars : [
		'camera',
		'frameMorph'
	],
	#category : 'SDL3-Morphic',
	#package : 'SDL3-Morphic'
}

{ #category : 'as yet unclassified' }
SDL3CameraMorph class >> open [
	"Open a Morphic camera window in the world, showing the frames of the first available camera."

	| morph |
	morph := self new openInWorld.
	morph currentWorld
		startStepping: morph
		at: Time millisecondClockValue
		selector: #step
		arguments: #(  )
		stepTime: 40.
	^ morph
]

{ #category : 'as yet unclassified' }
SDL3CameraMorph class >> windowMenuOn: aBuilder [

	<windowMenu>
	(aBuilder item: #'Fit to frame') action: [ aBuilder model fitToFrame ]
]

{ #category : 'as yet unclassified' }
SDL3CameraMorph >> camera [

	^ camera
]

{ #category : 'as yet unclassified' }
SDL3CameraMorph >> camera: aCamera [

	camera := aCamera
]

{ #category : 'as yet unclassified' }
SDL3CameraMorph >> close [
	"Close the camera and delete the morph from the world."

	self closeCamera.
	self delete
]

{ #category : 'as yet unclassified' }
SDL3CameraMorph >> closeCamera [
	"Close the camera, if there is one."

	camera ifNotNil: [
			camera close.
			camera := nil ]
]

{ #category : 'as yet unclassified' }
SDL3CameraMorph >> delete [
	"Close the camera when the window is deleted, since the UI close paths call #delete without #close."

	self closeCamera.
	^ super delete
]

{ #category : 'as yet unclassified' }
SDL3CameraMorph >> fitToFrame [
	"Resize the window so the camera frame is shown at native size."

	| frame form |
	camera ifNil: [ ^ self ].
	frame := camera acquireFrameTimestampNS: nil ifNotAvailable: [ nil ].
	frame ifNil: [ ^ self ].
	form := frame asForm.
	camera releaseFrame: frame.
	self extent: form extent
]

{ #category : 'as yet unclassified' }
SDL3CameraMorph >> frameMorph [

	^ frameMorph
]

{ #category : 'as yet unclassified' }
SDL3CameraMorph >> initialize [

	super initialize.
	camera := nil.
	frameMorph := ImageMorph new basicExtent: 640 @ 480.
	self addMorph: frameMorph.
	self openCamera
]

{ #category : 'as yet unclassified' }
SDL3CameraMorph >> openCamera [
	"Open the first available camera, if any."

	| ids cameraId flags |
	camera := nil.
	"SDL_INIT_CAMERA is 0x00010000 -- see the SDL3InitFlags #define"
	flags := 65536.
	SDL3Library uniqueInstance initSubSystem: flags.
	ids := SDL3Library uniqueInstance allCameraIDs.
	ids ifEmpty: [ ^ self ].
	cameraId := ids first.
	camera := SDL3Camera unownedOpenInstanceID: cameraId spec: nil
]

{ #category : 'as yet unclassified' }
SDL3CameraMorph >> step [
	"Acquire a frame if one is available and update the shown image."

	| frame form |
	camera ifNil: [ ^ self ].
	frame := camera acquireFrameTimestampNS: nil ifNotAvailable: [ nil ].
	frame ifNil: [ ^ self ].
	form := frame asForm scaledToSize: self extent.
	camera releaseFrame: frame.
	self frameMorph image: form
]
