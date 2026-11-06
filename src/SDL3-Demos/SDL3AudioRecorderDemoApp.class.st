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
	"Open a stream at the default playback device with its default format."

	DiScope own: (playbackStream := SDL_AudioStream
		unownedOpenDeviceStreamID: SDL3AudioDevice defaultPlaybackAudioDeviceID
		spec: ExternalAddress null)
]

{ #category : 'initialization' }
SDL3AudioRecorderDemoApp >> openRecordingStream [
	"Open a stream at the default recording device. Use the same format as the playback device."

	DiScope own: (recordingStream := SDL_AudioStream
		unownedOpenDeviceStreamID: SDL3AudioDevice defaultRecordingAudioDeviceID
		spec: playbackStream outputFormatSpec)
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

{ #category : 'lifecycle' }
SDL3AudioRecorderDemoApp >> setUp [

	super setUp.

	recordingBuffer := ByteArray new: 1024.
	self openPlaybackStream.
	self openRecordingStream
]

{ #category : 'hooks' }
SDL3AudioRecorderDemoApp >> step [

	self transferRecordedAudio.
	self render
]

{ #category : 'hooks' }
SDL3AudioRecorderDemoApp >> subsystemInitFlags [

	^ super subsystemInitFlags | SDL_INIT_AUDIO
]

{ #category : 'recording' }
SDL3AudioRecorderDemoApp >> transferRecordedAudio [
	"Drain available audio from the recording stream and feed it into the playback stream.
	We intentionally use #putDataBuf:len: (copying) rather than zero-copy (#putDataNoCopyBuf:len:)
	because recordingBuffer is a reused Smalltalk ByteArray on the GC heap and chunks are small (1 KB).
	Copying into SDL's internal ring buffer avoids GC pointer hazards and buffer overwrite corruption."

	[ recordingStream available > 0 ] whileTrue: [
		| readCount |
		readCount := recordingStream getDataIntoBuf: recordingBuffer len: recordingBuffer size.
		sdl assertSuccess: readCount >= 0.
		playbackStream putDataBuf: recordingBuffer len: readCount ]
]

{ #category : 'visiting - concrete' }
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
