"
I am a SDL3 FFI binding for `SDL_Joystick`.

The joystick structure used to identify an SDL joystick.

See: https://wiki.libsdl.org/SDL3/SDL_Joystick
"
Class {
	#name : 'SDL3Joystick',
	#superclass : 'SDL3BaseObject',
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'instance creation' }
SDL3Joystick class >> unownedOpen: instanceId [

	^ (self ffiLibrary openJoystick: instanceId)
		  assertNotNullReturn;
		  yourself
]

{ #category : 'finalization' }
SDL3Joystick >> close [

	self ffiLibrary closeJoystick: self
]

{ #category : 'testing' }
SDL3Joystick >> connected [

	^ self ffiLibrary joystickConnected: self
]

{ #category : 'accessing' }
SDL3Joystick >> connectionState [

	^ self ffiLibrary getJoystickConnectionState: self
]

{ #category : 'accessing' }
SDL3Joystick >> firmwareVersion [

	^ self ffiLibrary getJoystickFirmwareVersion: self
]

{ #category : 'accessing' }
SDL3Joystick >> getAxisInitialStateIntoAxis: axis state: state [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			getJoystickAxisInitialStateJoystick: self
			axis: axis
			state: state)
]

{ #category : 'accessing' }
SDL3Joystick >> getAxisInto: axis [

	^ self ffiLibrary getJoystickAxisJoystick: self axis: axis
]

{ #category : 'accessing' }
SDL3Joystick >> getBallInto: ball dx: dx dy: dy [

	self ffiLibrary assertSuccess: (self ffiLibrary
			 getJoystickBallJoystick: self
			 ball: ball
			 dx: dx
			 dy: dy)
]

{ #category : 'accessing' }
SDL3Joystick >> getButtonInto: button [

	self ffiLibrary assertSuccess: (self ffiLibrary getJoystickButtonJoystick: self button: button)
]

{ #category : 'accessing' }
SDL3Joystick >> getHatInto: hat [

	^ self ffiLibrary getJoystickHatJoystick: self hat: hat
]

{ #category : 'accessing' }
SDL3Joystick >> getPowerInfoIntoPercent: percent [

	^ self ffiLibrary getJoystickPowerInfoJoystick: self percent: percent
]

{ #category : 'accessing' }
SDL3Joystick >> guid [

	^ self ffiLibrary getJoystickGUID: self
]

{ #category : 'accessing' }
SDL3Joystick >> id [

	^ self ffiLibrary getJoystickID: self
]

{ #category : 'testing' }
SDL3Joystick >> isHaptic [

	^ self ffiLibrary isJoystickHaptic: self
]

{ #category : 'accessing' }
SDL3Joystick >> ledRed: red green: green blue: blue [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			setJoystickLEDJoystick: self
			red: red
			green: green
			blue: blue)
]

{ #category : 'accessing' }
SDL3Joystick >> name [

	^ self ffiLibrary getJoystickName: self
]

{ #category : 'accessing' }
SDL3Joystick >> numAxes [

	^ self ffiLibrary getNumJoystickAxes: self
]

{ #category : 'accessing' }
SDL3Joystick >> numBalls [

	^ self ffiLibrary getNumJoystickBalls: self
]

{ #category : 'accessing' }
SDL3Joystick >> numButtons [

	^ self ffiLibrary getNumJoystickButtons: self
]

{ #category : 'accessing' }
SDL3Joystick >> numHats [

	^ self ffiLibrary getNumJoystickHats: self
]

{ #category : 'accessing' }
SDL3Joystick >> path [

	^ self ffiLibrary getJoystickPath: self
]

{ #category : 'accessing' }
SDL3Joystick >> playerIndex [

	^ self ffiLibrary getJoystickPlayerIndex: self
]

{ #category : 'accessing' }
SDL3Joystick >> playerIndexPlayerIndex: playerIndex [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			setJoystickPlayerIndexJoystick: self
			playerIndex: playerIndex)
]

{ #category : 'accessing' }
SDL3Joystick >> product [

	^ self ffiLibrary getJoystickProduct: self
]

{ #category : 'accessing' }
SDL3Joystick >> productVersion [

	^ self ffiLibrary getJoystickProductVersion: self
]

{ #category : 'accessing' }
SDL3Joystick >> propertiesID [

	^ self ffiLibrary getJoystickProperties: self
]

{ #category : 'accessing' }
SDL3Joystick >> propertyGroup [

	^ SDL3PropertyGroup id: self propertiesID
]

{ #category : 'operations' }
SDL3Joystick >> rumbleLowFrequencyRumble: lowFrequencyRumble highFrequencyRumble: highFrequencyRumble durationMs: durationMs [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			rumbleJoystick: self
			lowFrequencyRumble: lowFrequencyRumble
			highFrequencyRumble: highFrequencyRumble
			durationMs: durationMs)
]

{ #category : 'operations' }
SDL3Joystick >> rumbleTriggersLeftRumble: leftRumble rightRumble: rightRumble durationMs: durationMs [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			rumbleJoystickTriggersJoystick: self
			leftRumble: leftRumble
			rightRumble: rightRumble
			durationMs: durationMs)
]

{ #category : 'operations' }
SDL3Joystick >> sendEffectData: data size: size [

	self ffiLibrary assertSuccess:
		(self ffiLibrary sendJoystickEffectJoystick: self data: data size: size)
]

{ #category : 'operations' }
SDL3Joystick >> sendVirtualSensorDataType: type sensorTimestamp: sensorTimestamp data: data numValues: numValues [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			sendJoystickVirtualSensorDataJoystick: self
			type: type
			sensorTimestamp: sensorTimestamp
			data: data
			numValues: numValues)
]

{ #category : 'accessing' }
SDL3Joystick >> serial [

	^ self ffiLibrary getJoystickSerial: self
]

{ #category : 'accessing' }
SDL3Joystick >> type [

	^ self ffiLibrary getJoystickType: self
]

{ #category : 'instance creation' }
SDL3Joystick >> unownedOpenHapticFrom [

	^ (self ffiLibrary openHapticFromJoystick: self)
		  assertNotNullReturn;
		  yourself
]

{ #category : 'accessing' }
SDL3Joystick >> vendor [

	^ self ffiLibrary getJoystickVendor: self
]

{ #category : 'accessing' }
SDL3Joystick >> virtualAxis: axis value: value [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			setJoystickVirtualAxisJoystick: self
			axis: axis
			value: value)
]

{ #category : 'accessing' }
SDL3Joystick >> virtualBall: ball xrel: xRel yrel: yRel [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			setJoystickVirtualBallJoystick: self
			ball: ball
			xrel: xRel
			yrel: yRel)
]

{ #category : 'accessing' }
SDL3Joystick >> virtualButton: button down: down [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			setJoystickVirtualButtonJoystick: self
			button: button
			down: down)
]

{ #category : 'accessing' }
SDL3Joystick >> virtualHat: hat value: value [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			setJoystickVirtualHatJoystick: self
			hat: hat
			value: value)
]

{ #category : 'accessing' }
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
