"
I log various SDL3 state values to an on-screen console.
"
Class {
	#name : 'SDL3LogStateDemo',
	#superclass : 'SDL3ConsoleDemoApp',
	#category : 'SDL3-Demos-API',
	#package : 'SDL3-Demos',
	#tag : 'API'
}

{ #category : 'hooks' }
SDL3LogStateDemo >> step [

	self console clear.
	
	self log: #SYSTEM.
	#(#allCameraIDs #allKeyboardIDs #allMouseIDs #getBasePath #currentDirectory #getCurrentVideoDriver
	#getRevision #getSystemPageSize #getSystemTheme
	#gpuDrivers #renderDrivers #videoDrivers) do: [ :each |
		self log: each -> (sdl perform: each) ].

	self log: ''.
	self log: #DISPLAYS.
	sdl displays
		do: [ :eachDisplay |
			#(id name isPrimary contentScale bounds usableBounds desktopDisplayMode currentDisplayMode fullscreenDisplayModes currentDisplayOrientation naturalDisplayOrientation) do: [ :each |
				self log: each -> (eachDisplay perform: each) ] ]
		separatedBy: [ self log: '' ].

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
	self log: #MOUSE.
	self log: #position -> sdl mousePosition.
	self log: #state -> (SDL3MouseButtonFlags allValuesIn: (sdl getMouseStateX: ExternalAddress null y: ExternalAddress null)).

	sdl getModState in: [ :modState |
		modState > 0 ifTrue: [ 
			self log: ''.
			self log: #getModState.
			self log: (SDL3Keymod allValuesIn: modState) ] ].

	(sdl getKeyboardState: nil) in: [ :booleanArray |
		self log: ''.
		self log: #getKeyboardState:.

		SDL3Scancode allValues
			select: [ :each | booleanArray boolean8AtOffset: each value ]
			thenDo: [ :each |
				| key |
				key := sdl
					getKeyFromScancode: each
					modstate: sdl getModState
					keyEvent: true.
				self log:
					('Scancode: {1} Key: {2}' format: {
						each item.
						SDL3Keycode itemAt: key ifAbsent: [ 'Unknown' ] }) ] ].

	self clearColor: Color blue muchDarker.
	self present
]
