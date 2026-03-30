Extension { #name : 'SDL3AudioStream' }

{ #category : '*SDL3-API' }
SDL3AudioStream >> audioDevicePaused [

	^ self ffiLibrary audioStreamDevicePaused: self
]

{ #category : '*SDL3-API' }
SDL3AudioStream >> available [

	^ self ffiLibrary getAudioStreamAvailable: self
]

{ #category : '*SDL3-API' }
SDL3AudioStream >> clear [

	^ self ffiLibrary clearAudioStream: self
]

{ #category : '*SDL3-API' }
SDL3AudioStream >> destroy [

	^ self ffiLibrary destroyAudioStream: self
]

{ #category : '*SDL3-API' }
SDL3AudioStream >> deviceID [

	^ self ffiLibrary getAudioStreamDevice: self
]

{ #category : '*SDL3-API' }
SDL3AudioStream >> flush [

	^ self ffiLibrary flushAudioStream: self
]

{ #category : '*SDL3-API' }
SDL3AudioStream >> formatSrcSpec: src_spec dstSpec: dst_spec [

	^ self ffiLibrary setAudioStreamFormatStream: self srcSpec: src_spec dstSpec: dst_spec
]

{ #category : '*SDL3-API' }
SDL3AudioStream >> frequencyRatio [

	^ self ffiLibrary getAudioStreamFrequencyRatio: self
]

{ #category : '*SDL3-API' }
SDL3AudioStream >> frequencyRatio: ratio [

	^ self ffiLibrary setAudioStreamFrequencyRatioStream: self ratio: ratio
]

{ #category : '*SDL3-API' }
SDL3AudioStream >> gain [

	^ self ffiLibrary getAudioStreamGain: self
]

{ #category : '*SDL3-API' }
SDL3AudioStream >> gain: gain [

	^ self ffiLibrary setAudioStreamGainStream: self gain: gain
]

{ #category : '*SDL3-API' }
SDL3AudioStream >> getCallback: callback userdata: userdata [

	^ self ffiLibrary setAudioStreamGetCallbackStream: self callback: callback userdata: userdata
]

{ #category : '*SDL3-API' }
SDL3AudioStream >> getDataIntoBuf: buf len: len [

	^ self ffiLibrary getAudioStreamDataStream: self buf: buf len: len
]

{ #category : '*SDL3-API' }
SDL3AudioStream >> getFormatIntoSrcSpec: src_spec dstSpec: dst_spec [

	^ self ffiLibrary getAudioStreamFormatStream: self srcSpec: src_spec dstSpec: dst_spec
]

{ #category : '*SDL3-API' }
SDL3AudioStream >> getInputChannelMapIntoCount: count [

	^ self ffiLibrary getAudioStreamInputChannelMapStream: self count: count
]

{ #category : '*SDL3-API' }
SDL3AudioStream >> getOutputChannelMapIntoCount: count [

	^ self ffiLibrary getAudioStreamOutputChannelMapStream: self count: count
]

{ #category : '*SDL3-API' }
SDL3AudioStream >> inputChannelMapChmap: chmap count: count [

	^ self ffiLibrary setAudioStreamInputChannelMapStream: self chmap: chmap count: count
]

{ #category : '*SDL3-API' }
SDL3AudioStream >> lock [

	^ self ffiLibrary lockAudioStream: self
]

{ #category : '*SDL3-API' }
SDL3AudioStream >> outputChannelMapChmap: chmap count: count [

	^ self ffiLibrary setAudioStreamOutputChannelMapStream: self chmap: chmap count: count
]

{ #category : '*SDL3-API' }
SDL3AudioStream >> pauseDevice [

	^ self ffiLibrary pauseAudioStreamDevice: self
]

{ #category : '*SDL3-API' }
SDL3AudioStream >> properties [

	^ self ffiLibrary getAudioStreamProperties: self
]

{ #category : '*SDL3-API' }
SDL3AudioStream >> putCallback: callback userdata: userdata [

	^ self ffiLibrary setAudioStreamPutCallbackStream: self callback: callback userdata: userdata
]

{ #category : '*SDL3-API' }
SDL3AudioStream >> putDataBuf: buf len: len [

	^ self ffiLibrary putAudioStreamDataStream: self buf: buf len: len
]

{ #category : '*SDL3-API' }
SDL3AudioStream >> putDataNoCopyBuf: buf len: len callback: callback userdata: userdata [

	^ self ffiLibrary
		  putAudioStreamDataNoCopyStream: self
		  buf: buf
		  len: len
		  callback: callback
		  userdata: userdata
]

{ #category : '*SDL3-API' }
SDL3AudioStream >> putPlanarDataChannelBuffers: channel_buffers numChannels: num_channels numSamples: num_samples [

	^ self ffiLibrary
		  putAudioStreamPlanarDataStream: self
		  channelBuffers: channel_buffers
		  numChannels: num_channels
		  numSamples: num_samples
]

{ #category : '*SDL3-API' }
SDL3AudioStream >> queued [

	^ self ffiLibrary getAudioStreamQueued: self
]

{ #category : '*SDL3-API' }
SDL3AudioStream >> resumeDevice [

	^ self ffiLibrary resumeAudioStreamDevice: self
]

{ #category : '*SDL3-API' }
SDL3AudioStream >> unbind [

	^ self ffiLibrary unbindAudioStream: self
]

{ #category : '*SDL3-API' }
SDL3AudioStream >> unbindsNumStreams: num_streams [

	^ self ffiLibrary unbindAudioStreams: self numStreams: num_streams
]

{ #category : '*SDL3-API' }
SDL3AudioStream >> unlock [

	^ self ffiLibrary unlockAudioStream: self
]
