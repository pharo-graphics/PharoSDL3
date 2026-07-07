"
I'm a demo of SDL3 recording and playing from/to default audio devices. I'm based on SDL's `test/testaudiorecording.c`.
"
Class {
	#name : 'SDL3AudioRecorderDemoApp',
	#superclass : 'SDL3RendererDemoApp',
	#instVars : [
		'playbackStream',
		'recordingStream',
		'recordingBuffer',
		'frequencyRatio'
	],
	#category : 'SDL3-Demos-API',
	#package : 'SDL3-Demos',
	#tag : 'API'
}

{ #category : 'lifecycle' }
SDL3AudioRecorderDemoApp >> close [

	recordingStream ifNotNil: [
		recordingStream destroy.
		recordingStream := nil ].

	playbackStream ifNotNil: [
		playbackStream destroy.
		playbackStream := nil ].

	super close
]

{ #category : 'accessing' }
SDL3AudioRecorderDemoApp >> initialExtent [

	^ 480 @ 240
]

{ #category : 'accessing' }
SDL3AudioRecorderDemoApp >> initialWindowFlags [

	^ 0
]

{ #category : 'initialization' }
SDL3AudioRecorderDemoApp >> initialize [

	super initialize.
	frequencyRatio := 1.0
]

{ #category : 'playback' }
SDL3AudioRecorderDemoApp >> openPlaybackStream [
	"Open a stream at the the default playback device, with it's default format."

	playbackStream := SDL_AudioStream
		unsafeOpenDeviceStreamDevid: SDL3AudioDevice defaultPlaybackAudioDeviceID
		spec: ExternalAddress null
		callback: ExternalAddress null
		userdata: ExternalAddress null
]

{ #category : 'initialization' }
SDL3AudioRecorderDemoApp >> openRecordingStream [
	"Open a stream at the the default recording device. Use the same format as the playback device"

	recordingStream := SDL_AudioStream
		unsafeOpenDeviceStreamDevid: SDL3AudioDevice defaultRecordingAudioDeviceID
		spec: playbackStream outputFormatSpec
		callback: ExternalAddress null
		userdata: ExternalAddress null
]

{ #category : 'lifecycle' }
SDL3AudioRecorderDemoApp >> prepareToLoop [

	super prepareToLoop.

	recordingBuffer := ByteArray new: 1024.
	self openPlaybackStream.
	self openRecordingStream
]

{ #category : 'recording' }
SDL3AudioRecorderDemoApp >> putAllAvailableRecording [

	[ recordingStream available > 0 ] whileTrue: [
		| readCount |
		readCount := recordingStream getDataIntoBuf: recordingBuffer len: recordingBuffer size.
		sdl assertSuccess: readCount >= 0.
		playbackStream putDataBuf: recordingBuffer len: readCount ]
]

{ #category : 'lifecycle' }
SDL3AudioRecorderDemoApp >> render [

	(recordingStream isDevicePaused
		ifFalse: [
			self
				clearColor: Color red;
				showText: 'RECORDING' x: 20 y: 40 color: Color white;
				showText: 'Available bytes: ', playbackStream available asString x: 20 y: 80 color: Color white ]
		ifTrue: [
			playbackStream available > 0
				ifTrue: [
					self
						clearColor: Color green;
						showText: 'PLAYING' x: 20 y: 40 color: Color black;
						showText: 'Available bytes: ', playbackStream available asString x: 20 y: 80 color: Color black ]
				ifFalse: [
					self
						clearColor: Color blue;
						showText: 'IDLE' x: 20 y: 40 color: Color white;
						showText: 'Press SPACE to RECORD' x: 20 y: 80 color: Color white;
						showText: 'Release SPACE to PLAY' x: 20 y: 100 color: Color white.
				] ]).

	self showText: 'Recording device: ', recordingStream device name x: 20 y: 140.
	self showText: 'Playback device:  ', playbackStream device name x: 20 y: 160.
	self showText: 'Frequency ratio (UP/DOWN): ', (frequencyRatio printShowingDecimalPlaces: 2) x: 20 y: 180.

	self present
]

{ #category : 'hooks' }
SDL3AudioRecorderDemoApp >> step [

	self putAllAvailableRecording.
	self render
]

{ #category : 'hooks' }
SDL3AudioRecorderDemoApp >> subsystemInitFlags [

	^ super subsystemInitFlags | SDL_INIT_AUDIO
]

{ #category : 'hooks' }
SDL3AudioRecorderDemoApp >> visitKeyboardDownEvent: aKeyboardDownEvent [

	super visitKeyboardDownEvent: aKeyboardDownEvent.
	
	(aKeyboardDownEvent key = SDLK_SPACE asInteger and: [ aKeyboardDownEvent isRepeat not ]) ifTrue: [
		playbackStream
			pauseDevice;
			flush.
		recordingStream resumeDevice.
		^ self ].

	aKeyboardDownEvent key = SDLK_UP asInteger ifTrue: [ 
		frequencyRatio := (frequencyRatio + 0.05) min: 2.5.
		playbackStream frequencyRatio: frequencyRatio ].
		
	aKeyboardDownEvent key = SDLK_DOWN asInteger ifTrue: [ 
		frequencyRatio := (frequencyRatio - 0.05) max: 0.5.
		playbackStream frequencyRatio: frequencyRatio ]
]

{ #category : 'visiting - concrete' }
SDL3AudioRecorderDemoApp >> visitKeyboardUpEvent: aKeyboardUpEvent [

	super visitKeyboardUpEvent: aKeyboardUpEvent.
	
	aKeyboardUpEvent key = SDLK_SPACE asInteger ifTrue: [
		recordingStream
			pauseDevice;
			flush.
		playbackStream resumeDevice ]
]
