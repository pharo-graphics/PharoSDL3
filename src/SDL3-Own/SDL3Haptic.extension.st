Extension { #name : 'SDL3Haptic' }

{ #category : '*SDL3-Own' }
SDL3Haptic class >> unsafeOpen: instanceId [

	^ (self ffiLibrary openHaptic: instanceId)
		  assertNotNullReturn;
		  yourself
]

{ #category : '*SDL3-Own' }
SDL3Haptic class >> unsafeOpenFromJoystick: joystick [

	^ (self ffiLibrary openHapticFromJoystick: joystick)
		  assertNotNullReturn;
		  yourself
]

{ #category : '*SDL3-Own' }
SDL3Haptic class >> unsafeOpenFromMouse [

	^ (self ffiLibrary openHapticFromMouse)
		  assertNotNullReturn;
		  yourself
]
