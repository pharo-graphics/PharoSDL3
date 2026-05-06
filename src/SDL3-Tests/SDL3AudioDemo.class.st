"
I'm a demo of SDL3 recording and playing from/to default audio devices. I'm based on SDL's `test/testaudiorecording.c`.
"
Class {
	#name : 'SDL3AudioDemo',
	#superclass : 'SDL3Demo',
	#instVars : [
		'playbackStream',
		'recordingStream',
		'recordingBuffer'
	],
	#category : 'SDL3-Tests-Library',
	#package : 'SDL3-Tests',
	#tag : 'Library'
}

{ #category : 'lifecycle' }
SDL3AudioDemo >> close [

	recordingStream ifNotNil: [
		recordingStream destroy.
		recordingStream := nil ].

	playbackStream ifNotNil: [
		playbackStream destroy.
		playbackStream := nil ]
]

{ #category : 'running' }
SDL3AudioDemo >> iterateUntilQuit [

	| quit |
	quit := false.

	[ quit ] whileFalse: [
		self pollEventsDo: [ :evt |
			evt type = SDL_EVENT_QUIT ifTrue: [ quit := true ].

			evt type = SDL_EVENT_KEY_DOWN ifTrue: [

				evt key = SDLK_ESCAPE asInteger ifTrue: [ quit := true ].

				(evt key = SDLK_SPACE asInteger and: [ evt isRepeat not ]) ifTrue: [
					playbackStream
						pauseDevice;
						flush.
					recordingStream resumeDevice ] ].

			evt type = SDL_EVENT_KEY_UP ifTrue: [
				evt key = SDLK_SPACE asInteger ifTrue: [
					recordingStream
						pauseDevice;
						flush.
					playbackStream resumeDevice ] ]
			].

		self putAllAvailableRecording.
		self render.

		16 milliSeconds wait ]
]

{ #category : 'lifecycle' }
SDL3AudioDemo >> open [

	self ensureInitSDL3.

	window := sdl
		newWindowTitle: 'SDL3 Audio Recording Demo'
		w: 480
		h: 240
		flags: 0.
	window assertNotNullReturn.

	renderer := window newRendererFor: nil.
	renderer assertNotNullReturn.
	
	recordingBuffer := ByteArray new: 1024.
	self openPlaybackStream.
	self openRecordingStream
]

{ #category : 'playback' }
SDL3AudioDemo >> openPlaybackStream [
	"Open a stream at the the default playback device, with it's default format."

	playbackStream := sdl
		openAudioDeviceStreamDevid: SDL3AudioDevice defaultPlaybackAudioDeviceID
		spec: ExternalAddress null
		callback: ExternalAddress null
		userdata: ExternalAddress null.

	playbackStream assertNotNullReturn
]

{ #category : 'initialization' }
SDL3AudioDemo >> openRecordingStream [
	"Open a stream at the the default recording device. Use the same format as the playback device"

	recordingStream := sdl
		openAudioDeviceStreamDevid: SDL3AudioDevice defaultRecordingAudioDeviceID
		spec: playbackStream outputFormatSpec
		callback: ExternalAddress null
		userdata: ExternalAddress null.

	recordingStream assertNotNullReturn
]

{ #category : 'recording' }
SDL3AudioDemo >> putAllAvailableRecording [

	[ recordingStream available > 0 ] whileTrue: [
		| readCount |
		readCount := recordingStream getDataIntoBuf: recordingBuffer len: recordingBuffer size.
		sdl assertSuccess: readCount >= 0.
		sdl assertSuccess: (playbackStream putDataBuf: recordingBuffer len: readCount) ]
]

{ #category : 'lifecycle' }
SDL3AudioDemo >> render [

	(recordingStream isDevicePaused
		ifFalse: [
			self
				color: Color red;
				clear;
				color: Color white;
				showText: 'RECORDING' x: 20 y: 40;
				showText: 'Available bytes: ', playbackStream available asString x: 20 y: 80 color: Color white ]
		ifTrue: [
			playbackStream available > 0
				ifTrue: [
					self
						color: Color green;
						clear;
						color: Color black;
						showText: 'PLAYING' x: 20 y: 40;
						showText: 'Available bytes: ', playbackStream available asString x: 20 y: 80 color: Color black ]
				ifFalse: [
					self
						color: Color blue;
						clear;
						color: Color white;
						showText: 'IDLE' x: 20 y: 40;
						showText: 'Press SPACE to RECORD' x: 20 y: 80;
						showText: 'Release SPACE to PLAY' x: 20 y: 100.
				] ]).

	self showText: 'Recording device: ', recordingStream device name x: 20 y: 140.
	self showText: 'Playback device:  ', playbackStream device name x: 20 y: 160.

	self present
]

{ #category : 'running' }
SDL3AudioDemo >> run [
	"Run headless with:
	./pharo Pharo.image eval 'SDL3AudioDemo new run'
	"

	[ 
		self open.
		self iterateUntilQuit
	] ensure: [ self close ]
]
