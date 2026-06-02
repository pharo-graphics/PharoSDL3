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
	#category : 'SDL3-Own-IDObjects',
	#package : 'SDL3-Own',
	#tag : 'IDObjects'
}

{ #category : 'as yet unclassified' }
SDL3AudioDevice class >> defaultPlayback [

	^ DefaultPlaybackAudioDevice
]

{ #category : 'class initialization' }
SDL3AudioDevice class >> defaultPlaybackAudioDeviceID [

	^ 16rFFFFFFFF
]

{ #category : 'as yet unclassified' }
SDL3AudioDevice class >> defaultRecording [

	^ DefaultRecordingAudioDevice
]

{ #category : 'class initialization' }
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

{ #category : 'accessing - generated' }
SDL3AudioDevice >> audioPostmixCallback: callback userdata: userdata [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			setAudioPostmixCallbackDevid: id
			callback: callback
			userdata: userdata)
]

{ #category : 'accessing - generated' }
SDL3AudioDevice >> bindAudioStream: stream [

	self ffiLibrary assertSuccess:
		(self ffiLibrary bindAudioStreamDevid: id stream: stream)
]

{ #category : 'accessing - generated' }
SDL3AudioDevice >> bindAudioStreams: streams numStreams: numStreams [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			bindAudioStreamsDevid: id
			streams: streams
			numStreams: numStreams)
]

{ #category : 'accessing - generated' }
SDL3AudioDevice >> close [
	"Close an opened device. This may block while pending audio data is played by the
	hardware, so that applications don't drop the last buffer of data they supplied if
	terminating immediately afterwards."

	^ self ffiLibrary closeAudioDevice: id
]

{ #category : 'accessing' }
SDL3AudioDevice >> formatSpec [

	| spec |
	spec := SDL_AudioSpec new.

	self ffiLibrary assertSuccess:
		(self ffiLibrary getAudioDeviceFormatDevid: id spec: spec sampleFrames: nil).
	
	^ spec
]

{ #category : 'accessing - generated' }
SDL3AudioDevice >> gain [

	^ self ffiLibrary getAudioDeviceGain: id
]

{ #category : 'accessing - generated' }
SDL3AudioDevice >> gain: gain [

	self ffiLibrary assertSuccess:
		(self ffiLibrary setAudioDeviceGainDevid: id gain: gain)
]

{ #category : 'accessing - generated' }
SDL3AudioDevice >> getChannelMapIntoCount: count [

	^ self ffiLibrary getAudioDeviceChannelMapDevid: id count: count
]

{ #category : 'accessing - generated' }
SDL3AudioDevice >> getFormatIntoSpec: spec sampleFrames: sampleFrames [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			getAudioDeviceFormatDevid: id
			spec: spec
			sampleFrames: sampleFrames)
]

{ #category : 'accessing - generated' }
SDL3AudioDevice >> isPaused [
	"Answer whether this audio device is paused. This query only applies to logical devices (non-physical)."

	^ self ffiLibrary audioDevicePaused: id
]

{ #category : 'accessing - generated' }
SDL3AudioDevice >> isPhysical [

	^ self ffiLibrary isAudioDevicePhysical: id
]

{ #category : 'accessing - generated' }
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

{ #category : 'accessing - generated' }
SDL3AudioDevice >> name [

	^ self ffiLibrary getAudioDeviceName: id
]

{ #category : 'accessing - generated' }
SDL3AudioDevice >> openSpec: spec [

	^ self ffiLibrary openAudioDeviceDevid: id spec: spec
]

{ #category : 'accessing - generated' }
SDL3AudioDevice >> openStreamSpec: spec callback: callback userdata: userdata [

	^ self ffiLibrary
		 openAudioDeviceStreamDevid: id
		 spec: spec
		 callback: callback
		 userdata: userdata
]

{ #category : 'accessing - generated' }
SDL3AudioDevice >> pause [

	self ffiLibrary assertSuccess: (self ffiLibrary pauseAudioDevice: id)
]

{ #category : 'printing' }
SDL3AudioDevice >> printOn: aStream [

	super printOn: aStream.

	aStream
		nextPutAll: '(id: ';
		print: id.

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
		print: self name.

	aStream nextPut: $)
]

{ #category : 'accessing - generated' }
SDL3AudioDevice >> resume [

	self ffiLibrary assertSuccess: (self ffiLibrary resumeAudioDevice: id)
]
