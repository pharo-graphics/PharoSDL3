"
I demonstrate system queries provided by SDL3.
"
Class {
	#name : 'SDL3SystemQueryDemoApp',
	#superclass : 'SDL3ConsoleDemoApp',
	#category : 'SDL3-Demos-API',
	#package : 'SDL3-Demos',
	#tag : 'API'
}

{ #category : 'hooks' }
SDL3SystemQueryDemoApp >> step [

	self clearColor: Color blue muchDarker.
	console clear.

	console addLine: #SYSTEM color: Color yellow.
	#(#allCameraIDs #allKeyboardIDs #allMouseIDs #getBasePath #currentDirectory #getCurrentVideoDriver
	#getRevision #getSystemPageSize #getSystemTheme
	#gpuDrivers #renderDrivers #videoDrivers) do: [ :each |
		console addLine: (each -> (sdl perform: each)) ].

	console addLine.
	console addLine: #WINDOW color: Color yellow.
	#(title extent displayID displayScale pixelDensity pixelFormat isKeyboardGrabbed isMouseGrabbed) do: [ :each |
		console addLine: (each -> (window perform: each)) ].

	console addLine.
	console addLine: #AUDIO color: Color yellow.
	#(getCurrentAudioDriver allAudioDrivers) do: [ :each |
		console addLine: (each -> (sdl perform: each)) ].
	console addLine.
	sdl allAudioPlaybackDevices, sdl allAudioRecordingDevices do: [ :eachAudioDevice |
		console addLine: (String streamContents: [ :stream |
			#(id name isPlayback isPhysical formatSpec gain millisecondsBufferSize) do: [ :each |
				stream
					nextPutAll: each;
					nextPutAll: ': ';
					print: (eachAudioDevice perform: each);
					space ] ]) ].

	console addLine.
	console addLine: #DISPLAYS color: Color yellow.
	sdl displays
		do: [ :eachDisplay |
			#(id name isPrimary contentScale bounds usableBounds desktopDisplayMode currentDisplayMode fullscreenDisplayModes currentDisplayOrientation naturalDisplayOrientation) do: [ :each |
				console addLine: (each -> (eachDisplay perform: each)) ] ]
		separatedBy: [ console addLine ].

	self present
]
