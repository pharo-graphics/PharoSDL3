Extension { #name : 'SDL3Gamepad' }

{ #category : '*SDL3-Own' }
SDL3Gamepad >> close [

	self ffiLibrary closeGamepad: self
]

{ #category : '*SDL3-Own' }
SDL3Gamepad >> connected [

	^ self ffiLibrary gamepadConnected: self
]

{ #category : '*SDL3-Own' }
SDL3Gamepad >> connectionState [

	^ self ffiLibrary getGamepadConnectionState: self
]

{ #category : '*SDL3-Own' }
SDL3Gamepad >> firmwareVersion [

	^ self ffiLibrary getGamepadFirmwareVersion: self
]

{ #category : '*SDL3-Own' }
SDL3Gamepad >> getAppleSFSymbolsNameForAxisInto: axis [

	^ self ffiLibrary getGamepadAppleSFSymbolsNameForAxisGamepad: self axis: axis
]

{ #category : '*SDL3-Own' }
SDL3Gamepad >> getAppleSFSymbolsNameForButtonInto: button [

	^ self ffiLibrary getGamepadAppleSFSymbolsNameForButtonGamepad: self button: button
]

{ #category : '*SDL3-Own' }
SDL3Gamepad >> getAxisInto: axis [

	^ self ffiLibrary getGamepadAxisGamepad: self axis: axis
]

{ #category : '*SDL3-Own' }
SDL3Gamepad >> getBindingsIntoCount: count [

	^ self ffiLibrary getGamepadBindingsGamepad: self count: count
]

{ #category : '*SDL3-Own' }
SDL3Gamepad >> getButtonInto: button [

	self ffiLibrary assertSuccess: (self ffiLibrary getGamepadButtonGamepad: self button: button)
]

{ #category : '*SDL3-Own' }
SDL3Gamepad >> getButtonLabelIntoButton: button [

	^ self ffiLibrary getGamepadButtonLabelGamepad: self button: button
]

{ #category : '*SDL3-Own' }
SDL3Gamepad >> getNumTouchpadFingersIntoTouchpad: touchpad [

	^ self ffiLibrary getNumGamepadTouchpadFingersGamepad: self touchpad: touchpad
]

{ #category : '*SDL3-Own' }
SDL3Gamepad >> getPowerInfoIntoPercent: percent [

	^ self ffiLibrary getGamepadPowerInfoGamepad: self percent: percent
]

{ #category : '*SDL3-Own' }
SDL3Gamepad >> getSensorDataIntoType: type data: data numValues: numValues [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			getGamepadSensorDataGamepad: self
			type: type
			data: data
			numValues: numValues)
]

{ #category : '*SDL3-Own' }
SDL3Gamepad >> getSensorDataRateIntoType: type [

	^ self ffiLibrary getGamepadSensorDataRateGamepad: self type: type
]

{ #category : '*SDL3-Own' }
SDL3Gamepad >> getTouchpadFingerIntoTouchpad: touchpad finger: finger down: down x: x y: y pressure: pressure [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			getGamepadTouchpadFingerGamepad: self
			touchpad: touchpad
			finger: finger
			down: down
			x: x
			y: y
			pressure: pressure)
]

{ #category : '*SDL3-Own' }
SDL3Gamepad >> hasAxis: axis [

	^ self ffiLibrary gamepadHasAxisGamepad: self axis: axis
]

{ #category : '*SDL3-Own' }
SDL3Gamepad >> hasButton: button [

	^ self ffiLibrary gamepadHasButtonGamepad: self button: button
]

{ #category : '*SDL3-Own' }
SDL3Gamepad >> hasSensorType: type [

	^ self ffiLibrary gamepadHasSensorGamepad: self type: type
]

{ #category : '*SDL3-Own' }
SDL3Gamepad >> id [

	^ self ffiLibrary getGamepadID: self
]

{ #category : '*SDL3-Own' }
SDL3Gamepad >> joystick [

	^ (self ffiLibrary getGamepadJoystick: self)
		  assertNotNullReturn;
		  yourself
]

{ #category : '*SDL3-Own' }
SDL3Gamepad >> ledRed: red green: green blue: blue [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			setGamepadLEDGamepad: self
			red: red
			green: green
			blue: blue)
]

{ #category : '*SDL3-Own' }
SDL3Gamepad >> mapping [

	^ self ffiLibrary getGamepadMapping: self
]

{ #category : '*SDL3-Own' }
SDL3Gamepad >> name [

	^ self ffiLibrary getGamepadName: self
]

{ #category : '*SDL3-Own' }
SDL3Gamepad >> numberOfTouchpads [

	^ self ffiLibrary getNumGamepadTouchpads: self
]

{ #category : '*SDL3-Own' }
SDL3Gamepad >> path [

	^ self ffiLibrary getGamepadPath: self
]

{ #category : '*SDL3-Own' }
SDL3Gamepad >> playerIndex [

	^ self ffiLibrary getGamepadPlayerIndex: self
]

{ #category : '*SDL3-Own' }
SDL3Gamepad >> playerIndexPlayerIndex: playerIndex [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			setGamepadPlayerIndexGamepad: self
			playerIndex: playerIndex)
]

{ #category : '*SDL3-Own' }
SDL3Gamepad >> product [

	^ self ffiLibrary getGamepadProduct: self
]

{ #category : '*SDL3-Own' }
SDL3Gamepad >> productVersion [

	^ self ffiLibrary getGamepadProductVersion: self
]

{ #category : '*SDL3-Own' }
SDL3Gamepad >> propertiesID [

	^ self ffiLibrary getGamepadProperties: self
]

{ #category : '*SDL3-Own' }
SDL3Gamepad >> propertyGroup [

	^ SDL3PropertyGroup id: self propertiesID
]

{ #category : '*SDL3-Own' }
SDL3Gamepad >> realType [

	^ self ffiLibrary getRealGamepadType: self
]

{ #category : '*SDL3-Own' }
SDL3Gamepad >> rumbleLowFrequencyRumble: lowFrequencyRumble highFrequencyRumble: highFrequencyRumble durationMs: durationMs [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			rumbleGamepad: self
			lowFrequencyRumble: lowFrequencyRumble
			highFrequencyRumble: highFrequencyRumble
			durationMs: durationMs)
]

{ #category : '*SDL3-Own' }
SDL3Gamepad >> rumbleTriggersLeftRumble: leftRumble rightRumble: rightRumble durationMs: durationMs [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			rumbleGamepadTriggersGamepad: self
			leftRumble: leftRumble
			rightRumble: rightRumble
			durationMs: durationMs)
]

{ #category : '*SDL3-Own' }
SDL3Gamepad >> sendEffectData: data size: size [

	self ffiLibrary assertSuccess:
		(self ffiLibrary sendGamepadEffectGamepad: self data: data size: size)
]

{ #category : '*SDL3-Own' }
SDL3Gamepad >> sensorEnabledType: type [

	^ self ffiLibrary gamepadSensorEnabledGamepad: self type: type
]

{ #category : '*SDL3-Own' }
SDL3Gamepad >> sensorEnabledType: type enabled: enabled [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			setGamepadSensorEnabledGamepad: self
			type: type
			enabled: enabled)
]

{ #category : '*SDL3-Own' }
SDL3Gamepad >> serial [

	^ self ffiLibrary getGamepadSerial: self
]

{ #category : '*SDL3-Own' }
SDL3Gamepad >> steamHandle [

	^ self ffiLibrary getGamepadSteamHandle: self
]

{ #category : '*SDL3-Own' }
SDL3Gamepad >> type [

	^ self ffiLibrary getGamepadType: self
]

{ #category : '*SDL3-Own' }
SDL3Gamepad class >> unsafeOpen: instanceId [

	^ (self ffiLibrary openGamepad: instanceId)
		  assertNotNullReturn;
		  yourself
]

{ #category : '*SDL3-Own' }
SDL3Gamepad >> vendor [

	^ self ffiLibrary getGamepadVendor: self
]
