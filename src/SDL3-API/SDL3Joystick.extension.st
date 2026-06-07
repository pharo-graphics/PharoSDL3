Extension { #name : 'SDL3Joystick' }

{ #category : '*SDL3-API' }
SDL3Joystick >> close [

	self ffiLibrary closeJoystick: self
]

{ #category : '*SDL3-API' }
SDL3Joystick >> connected [

	^ self ffiLibrary joystickConnected: self
]

{ #category : '*SDL3-API' }
SDL3Joystick >> connectionState [

	^ self ffiLibrary getJoystickConnectionState: self
]

{ #category : '*SDL3-API' }
SDL3Joystick >> firmwareVersion [

	^ self ffiLibrary getJoystickFirmwareVersion: self
]

{ #category : '*SDL3-API' }
SDL3Joystick >> getAxisInitialStateIntoAxis: axis state: state [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			getJoystickAxisInitialStateJoystick: self
			axis: axis
			state: state)
]

{ #category : '*SDL3-API' }
SDL3Joystick >> getAxisInto: axis [

	^ self ffiLibrary getJoystickAxisJoystick: self axis: axis
]

{ #category : '*SDL3-API' }
SDL3Joystick >> getBallInto: ball dx: dx dy: dy [

	self ffiLibrary assertSuccess: (self ffiLibrary
			 getJoystickBallJoystick: self
			 ball: ball
			 dx: dx
			 dy: dy)
]

{ #category : '*SDL3-API' }
SDL3Joystick >> getButtonInto: button [

	self ffiLibrary assertSuccess: (self ffiLibrary getJoystickButtonJoystick: self button: button)
]

{ #category : '*SDL3-API' }
SDL3Joystick >> getHatInto: hat [

	^ self ffiLibrary getJoystickHatJoystick: self hat: hat
]

{ #category : '*SDL3-API' }
SDL3Joystick >> getPowerInfoIntoPercent: percent [

	^ self ffiLibrary getJoystickPowerInfoJoystick: self percent: percent
]

{ #category : '*SDL3-API' }
SDL3Joystick >> guid [

	^ self ffiLibrary getJoystickGUID: self
]

{ #category : '*SDL3-API' }
SDL3Joystick >> id [

	^ self ffiLibrary getJoystickID: self
]

{ #category : '*SDL3-API' }
SDL3Joystick >> isHaptic [

	^ self ffiLibrary isJoystickHaptic: self
]

{ #category : '*SDL3-API' }
SDL3Joystick >> ledRed: red green: green blue: blue [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			setJoystickLEDJoystick: self
			red: red
			green: green
			blue: blue)
]

{ #category : '*SDL3-API' }
SDL3Joystick >> name [

	^ self ffiLibrary getJoystickName: self
]

{ #category : '*SDL3-API' }
SDL3Joystick >> numAxes [

	^ self ffiLibrary getNumJoystickAxes: self
]

{ #category : '*SDL3-API' }
SDL3Joystick >> numBalls [

	^ self ffiLibrary getNumJoystickBalls: self
]

{ #category : '*SDL3-API' }
SDL3Joystick >> numButtons [

	^ self ffiLibrary getNumJoystickButtons: self
]

{ #category : '*SDL3-API' }
SDL3Joystick >> numHats [

	^ self ffiLibrary getNumJoystickHats: self
]

{ #category : '*SDL3-API' }
SDL3Joystick >> openHapticFrom [

	^ (self ffiLibrary openHapticFromJoystick: self)
		  assertNotNullReturn;
		  yourself
]

{ #category : '*SDL3-API' }
SDL3Joystick >> path [

	^ self ffiLibrary getJoystickPath: self
]

{ #category : '*SDL3-API' }
SDL3Joystick >> playerIndex [

	^ self ffiLibrary getJoystickPlayerIndex: self
]

{ #category : '*SDL3-API' }
SDL3Joystick >> playerIndexPlayerIndex: playerIndex [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			setJoystickPlayerIndexJoystick: self
			playerIndex: playerIndex)
]

{ #category : '*SDL3-API' }
SDL3Joystick >> product [

	^ self ffiLibrary getJoystickProduct: self
]

{ #category : '*SDL3-API' }
SDL3Joystick >> productVersion [

	^ self ffiLibrary getJoystickProductVersion: self
]

{ #category : '*SDL3-API' }
SDL3Joystick >> propertiesID [

	^ self ffiLibrary getJoystickProperties: self
]

{ #category : '*SDL3-API' }
SDL3Joystick >> rumbleLowFrequencyRumble: lowFrequencyRumble highFrequencyRumble: highFrequencyRumble durationMs: durationMs [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			rumbleJoystick: self
			lowFrequencyRumble: lowFrequencyRumble
			highFrequencyRumble: highFrequencyRumble
			durationMs: durationMs)
]

{ #category : '*SDL3-API' }
SDL3Joystick >> rumbleTriggersLeftRumble: leftRumble rightRumble: rightRumble durationMs: durationMs [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			rumbleJoystickTriggersJoystick: self
			leftRumble: leftRumble
			rightRumble: rightRumble
			durationMs: durationMs)
]

{ #category : '*SDL3-API' }
SDL3Joystick >> sendEffectData: data size: size [

	self ffiLibrary assertSuccess:
		(self ffiLibrary sendJoystickEffectJoystick: self data: data size: size)
]

{ #category : '*SDL3-API' }
SDL3Joystick >> sendVirtualSensorDataType: type sensorTimestamp: sensorTimestamp data: data numValues: numValues [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			sendJoystickVirtualSensorDataJoystick: self
			type: type
			sensorTimestamp: sensorTimestamp
			data: data
			numValues: numValues)
]

{ #category : '*SDL3-API' }
SDL3Joystick >> serial [

	^ self ffiLibrary getJoystickSerial: self
]

{ #category : '*SDL3-API' }
SDL3Joystick >> type [

	^ self ffiLibrary getJoystickType: self
]

{ #category : '*SDL3-API' }
SDL3Joystick >> vendor [

	^ self ffiLibrary getJoystickVendor: self
]

{ #category : '*SDL3-API' }
SDL3Joystick >> virtualAxis: axis value: value [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			setJoystickVirtualAxisJoystick: self
			axis: axis
			value: value)
]

{ #category : '*SDL3-API' }
SDL3Joystick >> virtualBall: ball xrel: xRel yrel: yRel [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			setJoystickVirtualBallJoystick: self
			ball: ball
			xrel: xRel
			yrel: yRel)
]

{ #category : '*SDL3-API' }
SDL3Joystick >> virtualButton: button down: down [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			setJoystickVirtualButtonJoystick: self
			button: button
			down: down)
]

{ #category : '*SDL3-API' }
SDL3Joystick >> virtualHat: hat value: value [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			setJoystickVirtualHatJoystick: self
			hat: hat
			value: value)
]

{ #category : '*SDL3-API' }
SDL3Joystick >> virtualTouchpad: touchpad finger: finger down: down x: x y: y pressure: pressure [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			setJoystickVirtualTouchpadJoystick: self
			touchpad: touchpad
			finger: finger
			down: down
			x: x
			y: y
			pressure: pressure)
]
