"
I demonstrate system queries provided by SDL3.
"
Class {
	#name : 'SDL3SystemQueryDemo',
	#superclass : 'SDL3ConsoleDemoApp',
	#category : 'SDL3-Demos-API',
	#package : 'SDL3-Demos',
	#tag : 'API'
}

{ #category : 'hooks' }
SDL3SystemQueryDemo >> step [

	self console clear.
	
	self log: #SYSTEM.
	#(#allCameraIDs #allKeyboardIDs #allMouseIDs #getBasePath #currentDirectory #getCurrentVideoDriver
	#getRevision #getSystemPageSize #getSystemTheme
	#gpuDrivers #renderDrivers #videoDrivers) do: [ :each |
		self log: each -> (sdl perform: each) ].

	self log: ''.
	self log: #WINDOW.
	#(title extent displayID displayScale pixelDensity pixelFormat isKeyboardGrabbed isMouseGrabbed) do: [ :each |
		self log: each -> (window perform: each) ].

	self log: ''.
	self log: #AUDIO.
	#(getCurrentAudioDriver allAudioDrivers) do: [ :each |
		self log: each -> (sdl perform: each) ].
	self log: ''.
	sdl allAudioPlaybackDevices, sdl allAudioRecordingDevices do: [ :eachAudioDevice |
		self log: (String streamContents: [ :stream |
			#(id name isPlayback isPhysical formatSpec gain millisecondsBufferSize) do: [ :each |
				stream
					nextPutAll: each;
					nextPutAll: ': ';
					print: (eachAudioDevice perform: each);
					space ] ]) ].

	self log: ''.
	self log: #DISPLAYS.
	sdl displays
		do: [ :eachDisplay |
			#(id name isPrimary contentScale bounds usableBounds desktopDisplayMode currentDisplayMode fullscreenDisplayModes currentDisplayOrientation naturalDisplayOrientation) do: [ :each |
				self log: each -> (eachDisplay perform: each) ] ]
		separatedBy: [ self log: '' ].

	self clearColor: Color blue muchDarker.
	self present
]
