Extension { #name : 'SDL3Gamepad' }

{ #category : '*SDL3-API' }
SDL3Gamepad >> close [

	^ self ffiLibrary closeGamepad: self
]

{ #category : '*SDL3-API' }
SDL3Gamepad >> connected [

	^ self ffiLibrary gamepadConnected: self
]

{ #category : '*SDL3-API' }
SDL3Gamepad >> connectionState [

	^ self ffiLibrary getGamepadConnectionState: self
]

{ #category : '*SDL3-API' }
SDL3Gamepad >> firmwareVersion [

	^ self ffiLibrary getGamepadFirmwareVersion: self
]

{ #category : '*SDL3-API' }
SDL3Gamepad >> getAppleSFSymbolsNameForAxisInto: axis [

	^ self ffiLibrary getGamepadAppleSFSymbolsNameForAxisGamepad: self axis: axis
]

{ #category : '*SDL3-API' }
SDL3Gamepad >> getAppleSFSymbolsNameForButtonInto: button [

	^ self ffiLibrary getGamepadAppleSFSymbolsNameForButtonGamepad: self button: button
]

{ #category : '*SDL3-API' }
SDL3Gamepad >> getAxisInto: axis [

	^ self ffiLibrary getGamepadAxisGamepad: self axis: axis
]

{ #category : '*SDL3-API' }
SDL3Gamepad >> getBindingsIntoCount: count [

	^ self ffiLibrary getGamepadBindingsGamepad: self count: count
]

{ #category : '*SDL3-API' }
SDL3Gamepad >> getButtonInto: button [

	^ self ffiLibrary getGamepadButtonGamepad: self button: button
]

{ #category : '*SDL3-API' }
SDL3Gamepad >> getButtonLabelIntoButton: button [

	^ self ffiLibrary getGamepadButtonLabelGamepad: self button: button
]

{ #category : '*SDL3-API' }
SDL3Gamepad >> getNumTouchpadFingersIntoTouchpad: touchpad [

	^ self ffiLibrary getNumGamepadTouchpadFingersGamepad: self touchpad: touchpad
]

{ #category : '*SDL3-API' }
SDL3Gamepad >> getPowerInfoIntoPercent: percent [

	^ self ffiLibrary getGamepadPowerInfoGamepad: self percent: percent
]

{ #category : '*SDL3-API' }
SDL3Gamepad >> getSensorDataIntoType: type data: data numValues: num_values [

	^ self ffiLibrary
		  getGamepadSensorDataGamepad: self
		  type: type
		  data: data
		  numValues: num_values
]

{ #category : '*SDL3-API' }
SDL3Gamepad >> getSensorDataRateIntoType: type [

	^ self ffiLibrary getGamepadSensorDataRateGamepad: self type: type
]

{ #category : '*SDL3-API' }
SDL3Gamepad >> getTouchpadFingerIntoTouchpad: touchpad finger: finger down: down x: x y: y pressure: pressure [

	^ self ffiLibrary
		  getGamepadTouchpadFingerGamepad: self
		  touchpad: touchpad
		  finger: finger
		  down: down
		  x: x
		  y: y
		  pressure: pressure
]

{ #category : '*SDL3-API' }
SDL3Gamepad >> hasAxis: axis [

	^ self ffiLibrary gamepadHasAxisGamepad: self axis: axis
]

{ #category : '*SDL3-API' }
SDL3Gamepad >> hasButton: button [

	^ self ffiLibrary gamepadHasButtonGamepad: self button: button
]

{ #category : '*SDL3-API' }
SDL3Gamepad >> hasSensorType: type [

	^ self ffiLibrary gamepadHasSensorGamepad: self type: type
]

{ #category : '*SDL3-API' }
SDL3Gamepad >> id [

	^ self ffiLibrary getGamepadID: self
]

{ #category : '*SDL3-API' }
SDL3Gamepad >> joystick [

	^ self ffiLibrary getGamepadJoystick: self
]

{ #category : '*SDL3-API' }
SDL3Gamepad >> ledRed: red green: green blue: blue [

	^ self ffiLibrary
		  setGamepadLEDGamepad: self
		  red: red
		  green: green
		  blue: blue
]

{ #category : '*SDL3-API' }
SDL3Gamepad >> mapping [

	^ self ffiLibrary getGamepadMapping: self
]

{ #category : '*SDL3-API' }
SDL3Gamepad >> name [

	^ self ffiLibrary getGamepadName: self
]

{ #category : '*SDL3-API' }
SDL3Gamepad >> numberOfTouchpads [

	^ self ffiLibrary getNumGamepadTouchpads: self
]

{ #category : '*SDL3-API' }
SDL3Gamepad >> path [

	^ self ffiLibrary getGamepadPath: self
]

{ #category : '*SDL3-API' }
SDL3Gamepad >> playerIndex [

	^ self ffiLibrary getGamepadPlayerIndex: self
]

{ #category : '*SDL3-API' }
SDL3Gamepad >> playerIndexPlayerIndex: player_index [

	^ self ffiLibrary setGamepadPlayerIndexGamepad: self playerIndex: player_index
]

{ #category : '*SDL3-API' }
SDL3Gamepad >> product [

	^ self ffiLibrary getGamepadProduct: self
]

{ #category : '*SDL3-API' }
SDL3Gamepad >> productVersion [

	^ self ffiLibrary getGamepadProductVersion: self
]

{ #category : '*SDL3-API' }
SDL3Gamepad >> propertiesID [

	^ self ffiLibrary getGamepadProperties: self
]

{ #category : '*SDL3-API' }
SDL3Gamepad >> realType [

	^ self ffiLibrary getRealGamepadType: self
]

{ #category : '*SDL3-API' }
SDL3Gamepad >> rumbleLowFrequencyRumble: low_frequency_rumble highFrequencyRumble: high_frequency_rumble durationMs: duration_ms [

	^ self ffiLibrary
		  rumbleGamepad: self
		  lowFrequencyRumble: low_frequency_rumble
		  highFrequencyRumble: high_frequency_rumble
		  durationMs: duration_ms
]

{ #category : '*SDL3-API' }
SDL3Gamepad >> rumbleTriggersLeftRumble: left_rumble rightRumble: right_rumble durationMs: duration_ms [

	^ self ffiLibrary
		  rumbleGamepadTriggersGamepad: self
		  leftRumble: left_rumble
		  rightRumble: right_rumble
		  durationMs: duration_ms
]

{ #category : '*SDL3-API' }
SDL3Gamepad >> sendEffectData: data size: size [

	^ self ffiLibrary sendGamepadEffectGamepad: self data: data size: size
]

{ #category : '*SDL3-API' }
SDL3Gamepad >> sensorEnabledType: type [

	^ self ffiLibrary gamepadSensorEnabledGamepad: self type: type
]

{ #category : '*SDL3-API' }
SDL3Gamepad >> sensorEnabledType: type enabled: enabled [

	^ self ffiLibrary setGamepadSensorEnabledGamepad: self type: type enabled: enabled
]

{ #category : '*SDL3-API' }
SDL3Gamepad >> serial [

	^ self ffiLibrary getGamepadSerial: self
]

{ #category : '*SDL3-API' }
SDL3Gamepad >> steamHandle [

	^ self ffiLibrary getGamepadSteamHandle: self
]

{ #category : '*SDL3-API' }
SDL3Gamepad >> type [

	^ self ffiLibrary getGamepadType: self
]

{ #category : '*SDL3-API' }
SDL3Gamepad >> vendor [

	^ self ffiLibrary getGamepadVendor: self
]
