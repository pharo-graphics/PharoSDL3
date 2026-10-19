"
I am a SDL3 FFI binding for `SDL_Gamepad`.

The structure used to identify an SDL gamepad

See: https://wiki.libsdl.org/SDL3/SDL_Gamepad
"
Class {
	#name : 'SDL3Gamepad',
	#superclass : 'SDL3BaseObject',
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'instance creation' }
SDL3Gamepad class >> unownedOpen: instanceId [

	^ (self ffiLibrary openGamepad: instanceId)
		  assertNotNullReturn;
		  yourself
]

{ #category : 'finalization' }
SDL3Gamepad >> close [

	self ffiLibrary closeGamepad: self
]

{ #category : 'testing' }
SDL3Gamepad >> connected [

	^ self ffiLibrary gamepadConnected: self
]

{ #category : 'accessing' }
SDL3Gamepad >> connectionState [

	^ self ffiLibrary getGamepadConnectionState: self
]

{ #category : 'accessing' }
SDL3Gamepad >> firmwareVersion [

	^ self ffiLibrary getGamepadFirmwareVersion: self
]

{ #category : 'accessing' }
SDL3Gamepad >> getAppleSFSymbolsNameForAxisInto: axis [

	^ self ffiLibrary getGamepadAppleSFSymbolsNameForAxisGamepad: self axis: axis
]

{ #category : 'accessing' }
SDL3Gamepad >> getAppleSFSymbolsNameForButtonInto: button [

	^ self ffiLibrary getGamepadAppleSFSymbolsNameForButtonGamepad: self button: button
]

{ #category : 'accessing' }
SDL3Gamepad >> getAxisInto: axis [

	^ self ffiLibrary getGamepadAxisGamepad: self axis: axis
]

{ #category : 'accessing' }
SDL3Gamepad >> getBindingsIntoCount: count [

	^ self ffiLibrary getGamepadBindingsGamepad: self count: count
]

{ #category : 'accessing' }
SDL3Gamepad >> getButtonInto: button [

	self ffiLibrary assertSuccess: (self ffiLibrary getGamepadButtonGamepad: self button: button)
]

{ #category : 'accessing' }
SDL3Gamepad >> getButtonLabelIntoButton: button [

	^ self ffiLibrary getGamepadButtonLabelGamepad: self button: button
]

{ #category : 'accessing' }
SDL3Gamepad >> getNumTouchpadFingersIntoTouchpad: touchpad [

	^ self ffiLibrary getNumGamepadTouchpadFingersGamepad: self touchpad: touchpad
]

{ #category : 'accessing' }
SDL3Gamepad >> getPowerInfoIntoPercent: percent [

	^ self ffiLibrary getGamepadPowerInfoGamepad: self percent: percent
]

{ #category : 'accessing' }
SDL3Gamepad >> getSensorDataIntoType: type data: data numValues: numValues [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			getGamepadSensorDataGamepad: self
			type: type
			data: data
			numValues: numValues)
]

{ #category : 'accessing' }
SDL3Gamepad >> getSensorDataRateIntoType: type [

	^ self ffiLibrary getGamepadSensorDataRateGamepad: self type: type
]

{ #category : 'accessing' }
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

{ #category : 'testing' }
SDL3Gamepad >> hasAxis: axis [

	^ self ffiLibrary gamepadHasAxisGamepad: self axis: axis
]

{ #category : 'testing' }
SDL3Gamepad >> hasButton: button [

	^ self ffiLibrary gamepadHasButtonGamepad: self button: button
]

{ #category : 'testing' }
SDL3Gamepad >> hasSensorType: type [

	^ self ffiLibrary gamepadHasSensorGamepad: self type: type
]

{ #category : 'accessing' }
SDL3Gamepad >> id [

	^ self ffiLibrary getGamepadID: self
]

{ #category : 'accessing' }
SDL3Gamepad >> joystick [

	^ (self ffiLibrary getGamepadJoystick: self)
		  assertNotNullReturn;
		  yourself
]

{ #category : 'accessing' }
SDL3Gamepad >> ledRed: red green: green blue: blue [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			setGamepadLEDGamepad: self
			red: red
			green: green
			blue: blue)
]

{ #category : 'accessing' }
SDL3Gamepad >> mapping [

	^ self ffiLibrary getGamepadMapping: self
]

{ #category : 'accessing' }
SDL3Gamepad >> name [

	^ self ffiLibrary getGamepadName: self
]

{ #category : 'accessing' }
SDL3Gamepad >> numberOfTouchpads [

	^ self ffiLibrary getNumGamepadTouchpads: self
]

{ #category : 'accessing' }
SDL3Gamepad >> path [

	^ self ffiLibrary getGamepadPath: self
]

{ #category : 'accessing' }
SDL3Gamepad >> playerIndex [

	^ self ffiLibrary getGamepadPlayerIndex: self
]

{ #category : 'accessing' }
SDL3Gamepad >> playerIndexPlayerIndex: playerIndex [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			setGamepadPlayerIndexGamepad: self
			playerIndex: playerIndex)
]

{ #category : 'accessing' }
SDL3Gamepad >> product [

	^ self ffiLibrary getGamepadProduct: self
]

{ #category : 'accessing' }
SDL3Gamepad >> productVersion [

	^ self ffiLibrary getGamepadProductVersion: self
]

{ #category : 'accessing' }
SDL3Gamepad >> propertiesID [

	^ self ffiLibrary getGamepadProperties: self
]

{ #category : 'accessing' }
SDL3Gamepad >> propertyGroup [

	^ SDL3PropertyGroup id: self propertiesID
]

{ #category : 'accessing' }
SDL3Gamepad >> realType [

	^ self ffiLibrary getRealGamepadType: self
]

{ #category : 'operations' }
SDL3Gamepad >> rumbleLowFrequencyRumble: lowFrequencyRumble highFrequencyRumble: highFrequencyRumble durationMs: durationMs [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			rumbleGamepad: self
			lowFrequencyRumble: lowFrequencyRumble
			highFrequencyRumble: highFrequencyRumble
			durationMs: durationMs)
]

{ #category : 'operations' }
SDL3Gamepad >> rumbleTriggersLeftRumble: leftRumble rightRumble: rightRumble durationMs: durationMs [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			rumbleGamepadTriggersGamepad: self
			leftRumble: leftRumble
			rightRumble: rightRumble
			durationMs: durationMs)
]

{ #category : 'operations' }
SDL3Gamepad >> sendEffectData: data size: size [

	self ffiLibrary assertSuccess:
		(self ffiLibrary sendGamepadEffectGamepad: self data: data size: size)
]

{ #category : 'accessing' }
SDL3Gamepad >> sensorEnabledType: type [

	^ self ffiLibrary gamepadSensorEnabledGamepad: self type: type
]

{ #category : 'accessing' }
SDL3Gamepad >> sensorEnabledType: type enabled: enabled [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			setGamepadSensorEnabledGamepad: self
			type: type
			enabled: enabled)
]

{ #category : 'accessing' }
SDL3Gamepad >> serial [

	^ self ffiLibrary getGamepadSerial: self
]

{ #category : 'accessing' }
SDL3Gamepad >> steamHandle [

	^ self ffiLibrary getGamepadSteamHandle: self
]

{ #category : 'accessing' }
SDL3Gamepad >> type [

	^ self ffiLibrary getGamepadType: self
]

{ #category : 'accessing' }
SDL3Gamepad >> vendor [

	^ self ffiLibrary getGamepadVendor: self
]
