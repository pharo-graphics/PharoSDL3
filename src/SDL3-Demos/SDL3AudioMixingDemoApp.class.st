"
I'm a demo of SDL3 multi-stream audio mixing and polyphonic playback using a single playback device. I'm based on SDL's `examples/audio/04-multiple-streams`.
"
Class {
	#name : 'SDL3AudioMixingDemoApp',
	#superclass : 'SDL3RendererDemoApp',
	#instVars : [
		'playbackDevice',
		'shotArray',
		'shotSpec',
		'activeStreams'
	],
	#category : 'SDL3-Demos-API',
	#package : 'SDL3-Demos',
	#tag : 'API'
}

{ #category : 'playback' }
SDL3AudioMixingDemoApp >> cleanupFinishedStreams [
	"Destroy and remove any playback streams whose queued audio has been fully consumed by the mixer."

	activeStreams copy do: [ :eachStream |
		eachStream queued = 0 ifTrue: [
			eachStream destroy.
			activeStreams remove: eachStream ] ]
]

{ #category : 'initialization' }
SDL3AudioMixingDemoApp >> generateShotArray [
	"Synthesize a 750 ms laser pluck sound with a sharp instantaneous attack and exponential decay.
	Allocated in external C memory using SDL3Array."

	| sampleRate duration totalFrames phase |
	sampleRate := 44100.
	duration := 0.75.
	totalFrames := (sampleRate * duration) asInteger.
	phase := 0.0.

	^ SDL3Array
		unownedNewType: FFIFloat32
		size: totalFrames
		collect: [ :frame1BasedIndex |
			| frameIndex time progress frequency envelope sample |
			frameIndex := frame1BasedIndex - 1.
			time := frameIndex / sampleRate.
			progress := frameIndex / totalFrames.
			frequency := 220.0 + (660.0 * ((1.0 - progress) squared)).
			phase := phase + (2.0 * Float pi * frequency / sampleRate).
			envelope := (-6.0 * time) exp.
			sample := (0.25 * envelope * phase sin) asFloat ]
]

{ #category : 'accessing' }
SDL3AudioMixingDemoApp >> initialExtent [

	^ 520 @ 240
]

{ #category : 'accessing' }
SDL3AudioMixingDemoApp >> initialWindowFlags [

	^ 0
]

{ #category : 'initialization' }
SDL3AudioMixingDemoApp >> initialize [

	super initialize.
	activeStreams := OrderedCollection new
]

{ #category : 'playback' }
SDL3AudioMixingDemoApp >> openPlaybackDevice [
	"Open the default audio playback device. In SDL3, devices opened with SDL_OpenAudioDevice
	start in an unpaused state and mix all bound streams concurrently."

	playbackDevice := DiScope own: (SDL3AudioDevice
		unownedOpenID: SDL3AudioDevice defaultPlaybackAudioDeviceID
		spec: ExternalAddress null)
]

{ #category : 'playback' }
SDL3AudioMixingDemoApp >> playShot [
	"Create a new independent audio stream, bind it to the shared playback device, and queue the shot sound using zero-copy streaming.
	SDL3 automatically mixes all streams bound to the same device simultaneously."

	| stream |
	stream := SDL3AudioStream
		unownedNewSrcSpec: shotSpec
		dstSpec: ExternalAddress null.
	playbackDevice bindAudioStream: stream.

	"Little randomization"
	stream frequencyRatio: (SharedRandom globalGenerator nextBetween: 0.9 and: 1.1).
	stream gain: (SharedRandom globalGenerator nextBetween: 0.9 and: 1.1).

	"Zero-copy is safe here because shotArray is an SDL3Array in external C memory that outlives the stream."
	stream
		putDataNoCopyBuf: shotArray
		len: shotArray byteSize.

	"Signals end of input for this track so SDL pops and completes the zero-copy track once played."
	stream flush.

	activeStreams add: stream
]

{ #category : 'lifecycle' }
SDL3AudioMixingDemoApp >> render [

	self
		clearColor: (Color r: 0.1 g: 0.35 b: 0.3);
		showText: 'PLAYING' x: 20 y: 30 color: Color white;
		showText: ('Active overlapping voices: {1}' format: { activeStreams size }) x: 20 y: 60 color: Color yellow.

	self
		showText: 'Press SPACE to trigger shot (press repeatedly to overlap)' x: 20 y: 100 color: Color white;
		showText: 'Playback device: ', playbackDevice name x: 20 y: 160 color: Color lightGray.

	self present
]

{ #category : 'lifecycle' }
SDL3AudioMixingDemoApp >> setUp [

	super setUp.

	shotArray := DiScope own: self generateShotArray.
	shotSpec := SDL_AudioSpec new
		format: SDL3AudioFormat f32le;
		channels: 1;
		freq: 44100;
		yourself.

	self openPlaybackDevice
]

{ #category : 'hooks' }
SDL3AudioMixingDemoApp >> step [

	self cleanupFinishedStreams.
	self render
]

{ #category : 'hooks' }
SDL3AudioMixingDemoApp >> subsystemInitFlags [

	^ super subsystemInitFlags | SDL_INIT_AUDIO
]

{ #category : 'lifecycle' }
SDL3AudioMixingDemoApp >> tearDown [
	"Destroy dynamically allocated playback streams before DiScope tears down the shared playback device and frees the external shot buffer in C memory."

	activeStreams ifNotNil: [
		activeStreams do: [ :eachStream | eachStream destroy ].
		activeStreams removeAll ].

	super tearDown
]

{ #category : 'visiting - concrete' }
SDL3AudioMixingDemoApp >> visitKeyboardDownEvent: aKeyboardDownEvent [

	super visitKeyboardDownEvent: aKeyboardDownEvent.

	aKeyboardDownEvent key = SDLK_SPACE asInteger ifTrue: [ self playShot ]
]
