"
I am a SDL3 FFI binding for `SDL_AudioStream`.

The opaque handle that represents an audio stream.

See: https://wiki.libsdl.org/SDL3/SDL_AudioStream
"
Class {
	#name : 'SDL3AudioStream',
	#superclass : 'SDL3BaseObject',
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'instance creation' }
SDL3AudioStream class >> unownedNewSrcSpec: srcSpec dstSpec: dstSpec [

	^ (self ffiLibrary
		   createAudioStreamSrcSpec: srcSpec
		   dstSpec: dstSpec)
		  assertNotNullReturn;
		  yourself
]

{ #category : 'instance creation' }
SDL3AudioStream class >> unownedOpenDeviceStreamID: id spec: spec [
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

{ #category : 'accessing' }
SDL3AudioStream >> available [

	^ self ffiLibrary getAudioStreamAvailable: self
]

{ #category : 'operations' }
SDL3AudioStream >> clear [

	self ffiLibrary assertSuccess: (self ffiLibrary clearAudioStream: self)
]

{ #category : 'finalization' }
SDL3AudioStream >> destroy [

	self ffiLibrary destroyAudioStream: self
]

{ #category : 'accessing' }
SDL3AudioStream >> device [

	| audioDeviceID |
	audioDeviceID := self deviceID.
	audioDeviceID = 0 ifTrue: [ SDL3Error signalFromLibraryErrorMessage ].
	^ SDL3AudioDevice id: audioDeviceID
]

{ #category : 'accessing' }
SDL3AudioStream >> deviceID [

	^ self ffiLibrary getAudioStreamDevice: self
]

{ #category : 'operations' }
SDL3AudioStream >> flush [

	self ffiLibrary assertSuccess: (self ffiLibrary flushAudioStream: self)
]

{ #category : 'accessing' }
SDL3AudioStream >> formatSrcSpec: srcSpec dstSpec: dstSpec [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			setAudioStreamFormatStream: self
			srcSpec: srcSpec
			dstSpec: dstSpec)
]

{ #category : 'accessing' }
SDL3AudioStream >> frequencyRatio [

	^ self ffiLibrary getAudioStreamFrequencyRatio: self
]

{ #category : 'accessing' }
SDL3AudioStream >> frequencyRatio: ratio [

	self ffiLibrary assertSuccess:
		(self ffiLibrary setAudioStreamFrequencyRatioStream: self ratio: ratio)
]

{ #category : 'accessing' }
SDL3AudioStream >> gain [

	^ self ffiLibrary getAudioStreamGain: self
]

{ #category : 'accessing' }
SDL3AudioStream >> gain: gain [

	self ffiLibrary assertSuccess:
		(self ffiLibrary setAudioStreamGainStream: self gain: gain)
]

{ #category : 'accessing' }
SDL3AudioStream >> getCallback: callback userdata: userdata [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			setAudioStreamGetCallbackStream: self
			callback: callback
			userdata: userdata)
]

{ #category : 'accessing' }
SDL3AudioStream >> getDataIntoBuf: buf len: len [

	^ self ffiLibrary getAudioStreamDataStream: self buf: buf len: len
]

{ #category : 'accessing' }
SDL3AudioStream >> getFormatIntoSrcSpec: srcSpec dstSpec: dstSpec [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			getAudioStreamFormatStream: self
			srcSpec: srcSpec
			dstSpec: dstSpec)
]

{ #category : 'accessing' }
SDL3AudioStream >> getInputChannelMapIntoCount: count [

	^ self ffiLibrary getAudioStreamInputChannelMapStream: self count: count
]

{ #category : 'accessing' }
SDL3AudioStream >> getOutputChannelMapIntoCount: count [

	^ self ffiLibrary getAudioStreamOutputChannelMapStream: self count: count
]

{ #category : 'accessing' }
SDL3AudioStream >> inputChannelMapChmap: chmap count: count [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			setAudioStreamInputChannelMapStream: self
			chmap: chmap
			count: count)
]

{ #category : 'accessing' }
SDL3AudioStream >> inputFormatSpec [

	| spec |
	spec := SDL_AudioSpec new.

	self getFormatIntoSrcSpec: spec dstSpec: nil.

	^ spec
]

{ #category : 'testing' }
SDL3AudioStream >> isDevicePaused [

	^ self ffiLibrary audioStreamDevicePaused: self
]

{ #category : 'operations' }
SDL3AudioStream >> lock [

	self ffiLibrary assertSuccess: (self ffiLibrary lockAudioStream: self)
]

{ #category : 'accessing' }
SDL3AudioStream >> outputChannelMapChmap: chmap count: count [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			setAudioStreamOutputChannelMapStream: self
			chmap: chmap
			count: count)
]

{ #category : 'accessing' }
SDL3AudioStream >> outputFormatSpec [

	| spec |
	spec := SDL_AudioSpec new.

	self getFormatIntoSrcSpec: nil dstSpec: spec.

	^ spec
]

{ #category : 'operations' }
SDL3AudioStream >> pauseDevice [

	self ffiLibrary assertSuccess:
		(self ffiLibrary pauseAudioStreamDevice: self)
]

{ #category : 'accessing' }
SDL3AudioStream >> propertiesID [

	^ self ffiLibrary getAudioStreamProperties: self
]

{ #category : 'accessing' }
SDL3AudioStream >> propertyGroup [

	^ SDL3PropertyGroup id: self propertiesID
]

{ #category : 'accessing' }
SDL3AudioStream >> putCallback: callback userdata: userdata [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			setAudioStreamPutCallbackStream: self
			callback: callback
			userdata: userdata)
]

{ #category : 'accessing' }
SDL3AudioStream >> putDataBuf: buf len: len [
	"Copy data into the audio stream's internal ring buffer.

	This is the preferred method for continuous streaming, small chunks, or Smalltalk heap buffers (e.g. ByteArray) that might move during garbage collection. For large, static external buffers (like SDL3Array in C memory), consider #putDataNoCopyBuf:len: instead."

	self ffiLibrary assertSuccess:
		(self ffiLibrary putAudioStreamDataStream: self buf: buf len: len)
]

{ #category : 'accessing' }
SDL3AudioStream >> putDataNoCopyBuf: buf len: len [
	"Add external data to an audio stream without copying it. The memory must remain available until the stream is done with it.

	Prefer #putDataBuf:len: for small chunks, continuous streaming, or Smalltalk heap buffers (ByteArray) that can move during GC. Use #putDataNoCopyBuf:len: for large, static external buffers (like SDL3Array in C memory) and send #flush when done.

	The C completion callback and userdata parameters are omitted (bound to NULL) because invoking Pharo FFICallbacks from native OS audio threads causes VM thread-safety conflicts and stack corruption. Ensure the buffer remains valid until the stream is cleared or destroyed."

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			putAudioStreamDataNoCopyStream: self
			buf: buf
			len: len
			callback: ExternalAddress null
			userdata: ExternalAddress null)
]

{ #category : 'accessing' }
SDL3AudioStream >> putPlanarDataChannelBuffers: channelBuffers numChannels: numChannels numSamples: numSamples [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			putAudioStreamPlanarDataStream: self
			channelBuffers: channelBuffers
			numChannels: numChannels
			numSamples: numSamples)
]

{ #category : 'accessing' }
SDL3AudioStream >> queued [

	^ self ffiLibrary getAudioStreamQueued: self
]

{ #category : 'operations' }
SDL3AudioStream >> resumeDevice [

	self ffiLibrary assertSuccess:
		(self ffiLibrary resumeAudioStreamDevice: self)
]

{ #category : 'operations' }
SDL3AudioStream >> unbind [

	self ffiLibrary unbindAudioStream: self
]

{ #category : 'operations' }
SDL3AudioStream >> unbindsNumStreams: numStreams [

	self ffiLibrary unbindAudioStreams: self numStreams: numStreams
]

{ #category : 'operations' }
SDL3AudioStream >> unlock [

	self ffiLibrary assertSuccess: (self ffiLibrary unlockAudioStream: self)
]
