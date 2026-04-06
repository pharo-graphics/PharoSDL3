"
I represent an audio device. SDL3 doesn't provide an equivalent to me, just my id (a `SDL_AudioDeviceID`).
"
Class {
	#name : 'SDL3AudioDevice',
	#superclass : 'Object',
	#traits : 'LibTSDL3',
	#classTraits : 'LibTSDL3 classTrait',
	#instVars : [
		'id'
	],
	#classVars : [
		'DefaultPlaybackAudioDeviceID',
		'DefaultRecordingAudioDeviceID'
	],
	#category : 'SDL3-Own',
	#package : 'SDL3-Own'
}

{ #category : 'accessing' }
SDL3AudioDevice class >> defaultPlayback [

	^ DefaultPlaybackAudioDeviceID
]

{ #category : 'accessing' }
SDL3AudioDevice class >> defaultPlaybackAudioDeviceID [

	^ 16rFFFFFFFF
]

{ #category : 'accessing' }
SDL3AudioDevice class >> defaultRecording [

	^ DefaultRecordingAudioDeviceID
]

{ #category : 'accessing' }
SDL3AudioDevice class >> defaultRecordingAudioDeviceID [

	^ 16rFFFFFFFE
]

{ #category : 'instance creation' }
SDL3AudioDevice class >> id: anInteger [

	^ self basicNew
		initializeWithID: anInteger;
		yourself
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

	DefaultPlaybackAudioDeviceID := self id: self defaultPlaybackAudioDeviceID.

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
	DefaultRecordingAudioDeviceID := self id: self defaultRecordingAudioDeviceID
]

{ #category : 'accessing - generated' }
SDL3AudioDevice >> audioPostmixCallback: callback userdata: userdata [

	^ self ffiLibrary setAudioPostmixCallbackDevid: id callback: callback userdata: userdata
]

{ #category : 'accessing - generated' }
SDL3AudioDevice >> bindAudioStream: stream [

	^ self ffiLibrary bindAudioStreamDevid: id stream: stream
]

{ #category : 'accessing - generated' }
SDL3AudioDevice >> bindAudioStreams: streams numStreams: num_streams [

	^ self ffiLibrary bindAudioStreamsDevid: id streams: streams numStreams: num_streams
]

{ #category : 'accessing - generated' }
SDL3AudioDevice >> close [

	^ self ffiLibrary closeAudioDevice: id
]

{ #category : 'accessing - generated' }
SDL3AudioDevice >> gain [

	^ self ffiLibrary getAudioDeviceGain: id
]

{ #category : 'accessing - generated' }
SDL3AudioDevice >> gain: gain [

	^ self ffiLibrary setAudioDeviceGainDevid: id gain: gain
]

{ #category : 'accessing - generated' }
SDL3AudioDevice >> getChannelMapIntoCount: count [

	^ self ffiLibrary getAudioDeviceChannelMapDevid: id count: count
]

{ #category : 'accessing - generated' }
SDL3AudioDevice >> getFormatIntoSpec: spec sampleFrames: sample_frames [

	^ self ffiLibrary getAudioDeviceFormatDevid: id spec: spec sampleFrames: sample_frames
]

{ #category : 'accessing' }
SDL3AudioDevice >> id [

	^ id
]

{ #category : 'initialization' }
SDL3AudioDevice >> initializeWithID: anInteger [

	self initialize.
	id := anInteger
]

{ #category : 'accessing - generated' }
SDL3AudioDevice >> isPaused [

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

	^ self ffiLibrary pauseAudioDevice: id
]

{ #category : 'accessing - generated' }
SDL3AudioDevice >> resume [

	^ self ffiLibrary resumeAudioDevice: id
]
