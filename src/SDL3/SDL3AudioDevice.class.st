"
I represent an audio device. SDL3 doesn't provide an equivalent to me, just my id (a `SDL_AudioDeviceID`).
"
Class {
	#name : 'SDL3AudioDevice',
	#superclass : 'SDL3BaseIDObject',
	#classVars : [
		'DefaultPlaybackAudioDevice',
		'DefaultRecordingAudioDevice'
	],
	#category : 'SDL3-IDObjects',
	#package : 'SDL3',
	#tag : 'IDObjects'
}

{ #category : 'accessing' }
SDL3AudioDevice class >> defaultPlayback [

	^ DefaultPlaybackAudioDevice
]

{ #category : 'accessing' }
SDL3AudioDevice class >> defaultPlaybackAudioDeviceID [

	^ 16rFFFFFFFF
]

{ #category : 'accessing' }
SDL3AudioDevice class >> defaultRecording [

	^ DefaultRecordingAudioDevice
]

{ #category : 'accessing' }
SDL3AudioDevice class >> defaultRecordingAudioDeviceID [

	^ 16rFFFFFFFE
]

{ #category : 'class initialization' }
SDL3AudioDevice class >> initialize [
	"Why are constants harccoded here?
	See: https://github.com/pharo-cig/pharo-libsdl3/issues/5"

	"/**
	* A value used to request a default playback audio device.
	*
	* Several functions that require an SDL_AudioDeviceID will accept this value
	* to signify the app just wants the system to choose a default device instead
	* of the app providing a specific one.
	*
	* \since This macro is available since SDL 3.2.0.
	*/
	#define SDL_AUDIO_DEVICE_DEFAULT_PLAYBACK ((SDL_AudioDeviceID) 0xFFFFFFFFu)"

	DefaultPlaybackAudioDevice := self id: self defaultPlaybackAudioDeviceID.

	"/**
	* A value used to request a default recording audio device.
	*
	* Several functions that require an SDL_AudioDeviceID will accept this value
	* to signify the app just wants the system to choose a default device instead
	* of the app providing a specific one.
	*
	* \since This macro is available since SDL 3.2.0.
	*/
	#define SDL_AUDIO_DEVICE_DEFAULT_RECORDING ((SDL_AudioDeviceID) 0xFFFFFFFEu)
	"
	DefaultRecordingAudioDevice := self id: self defaultRecordingAudioDeviceID
]

{ #category : 'instance creation' }
SDL3AudioDevice class >> unownedOpenID: devid spec: spec [

	| openedID |
	openedID := self ffiLibrary openAudioDeviceDevid: devid spec: spec.
	openedID = 0 ifTrue: [ SDL3Error signalFromLibraryErrorMessage ].
	^ self id: openedID
]

{ #category : 'accessing' }
SDL3AudioDevice >> audioPostmixCallback: callback userdata: userdata [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			setAudioPostmixCallbackDevid: id
			callback: callback
			userdata: userdata)
]

{ #category : 'operations' }
SDL3AudioDevice >> bindAudioStream: stream [

	self ffiLibrary assertSuccess:
		(self ffiLibrary bindAudioStreamDevid: id stream: stream)
]

{ #category : 'operations' }
SDL3AudioDevice >> bindAudioStreams: streams numStreams: numStreams [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			bindAudioStreamsDevid: id
			streams: streams
			numStreams: numStreams)
]

{ #category : 'finalization' }
SDL3AudioDevice >> close [
	"Close an opened device. This may block while pending audio data is played by the
	hardware, so that applications don't drop the last buffer of data they supplied if
	terminating immediately afterwards."

	^ self ffiLibrary closeAudioDevice: id
]

{ #category : 'finalization' }
SDL3AudioDevice >> dispose [

	id ifNil: [ ^ self ].
	self close.
	id := nil
]

{ #category : 'accessing' }
SDL3AudioDevice >> formatSpec [

	| spec |
	spec := SDL_AudioSpec new.

	self ffiLibrary assertSuccess:
		(self ffiLibrary getAudioDeviceFormatDevid: id spec: spec sampleFrames: nil).

	^ spec
]

{ #category : 'accessing' }
SDL3AudioDevice >> gain [

	^ self ffiLibrary getAudioDeviceGain: id
]

{ #category : 'accessing' }
SDL3AudioDevice >> gain: gain [

	self ffiLibrary assertSuccess:
		(self ffiLibrary setAudioDeviceGainDevid: id gain: gain)
]

{ #category : 'accessing' }
SDL3AudioDevice >> getChannelMapIntoCount: count [

	^ self ffiLibrary getAudioDeviceChannelMapDevid: id count: count
]

{ #category : 'accessing' }
SDL3AudioDevice >> getFormatIntoSpec: spec sampleFrames: sampleFrames [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			getAudioDeviceFormatDevid: id
			spec: spec
			sampleFrames: sampleFrames)
]

{ #category : 'testing' }
SDL3AudioDevice >> isPaused [
	"Answer whether this audio device is paused. This query only applies to logical devices (non-physical)."

	^ self ffiLibrary audioDevicePaused: id
]

{ #category : 'testing' }
SDL3AudioDevice >> isPhysical [

	^ self ffiLibrary isAudioDevicePhysical: id
]

{ #category : 'testing' }
SDL3AudioDevice >> isPlayback [

	^ self ffiLibrary isAudioDevicePlayback: id
]

{ #category : 'accessing' }
SDL3AudioDevice >> millisecondsBufferSize [
	"Answer how many milliseconds are buffered by this device"

	| spec valueHolder |
	valueHolder := FFIInt32 newValueHolder.
	spec := SDL_AudioSpec new.

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			getAudioDeviceFormatDevid: id
			spec: spec
			sampleFrames: valueHolder).

	^ (valueHolder value * 1000) // spec freq
]

{ #category : 'accessing' }
SDL3AudioDevice >> name [

	^ self ffiLibrary getAudioDeviceName: id
]

{ #category : 'playback' }
SDL3AudioDevice >> pause [

	self ffiLibrary assertSuccess: (self ffiLibrary pauseAudioDevice: id)
]

{ #category : 'printing' }
SDL3AudioDevice >> printPropertiesOn: aStream [

	self isPlayback
		ifTrue: [ aStream nextPutAll: ' playback' ]
		ifFalse: [ aStream nextPutAll: ' recording' ].

	"Only logical devices can be paused/unpaused"
	self isPhysical
		ifFalse: [
			aStream nextPutAll: ' logical'.
			self isPaused ifTrue: [ aStream nextPutAll: ' paused' ] ]
		ifTrue: [ aStream nextPutAll: ' physical' ].

	aStream
		nextPutAll: ' name: ';
		print: self name
]

{ #category : 'playback' }
SDL3AudioDevice >> resume [

	self ffiLibrary assertSuccess: (self ffiLibrary resumeAudioDevice: id)
]

{ #category : 'instance creation' }
SDL3AudioDevice >> unownedOpenSpec: spec [

	| openedID |
	openedID := self ffiLibrary openAudioDeviceDevid: id spec: spec.
	openedID = 0 ifTrue: [ SDL3Error signalFromLibraryErrorMessage ].
	^ self class id: openedID
]

{ #category : 'instance creation' }
SDL3AudioDevice >> unownedOpenStreamSpec: spec [
	"Open a new audio device stream for playback or recording. The sender is responsible for destroying the returned stream via #destroy.

	In SDL3, audio streams are thread-safe push/pull queues. The C callback and userdata parameters are omitted (bound to NULL) because invoking Pharo FFICallbacks from native OS audio threads causes VM thread-safety conflicts and stack corruption. Use #putDataBuf:len: and #getDataIntoBuf:len: instead."

	^ (self ffiLibrary
		openAudioDeviceStreamDevid: id
		spec: spec
		callback: ExternalAddress null
		userdata: ExternalAddress null)
		assertNotNullReturn;
		yourself
]
