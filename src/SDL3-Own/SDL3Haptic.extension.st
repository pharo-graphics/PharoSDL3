Extension { #name : 'SDL3Haptic' }

{ #category : '*SDL3-Own' }
SDL3Haptic >> autocenter: autocenter [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			setHapticAutocenterHaptic: self
			autocenter: autocenter)
]

{ #category : '*SDL3-Own' }
SDL3Haptic >> close [

	self ffiLibrary closeHaptic: self
]

{ #category : '*SDL3-Own' }
SDL3Haptic >> destroyEffect: effect [

	self ffiLibrary destroyHapticEffectHaptic: self effect: effect
]

{ #category : '*SDL3-Own' }
SDL3Haptic >> effectSupportedEffect: effect [

	^ self ffiLibrary hapticEffectSupportedHaptic: self effect: effect
]

{ #category : '*SDL3-Own' }
SDL3Haptic >> features [

	^ self ffiLibrary getHapticFeatures: self
]

{ #category : '*SDL3-Own' }
SDL3Haptic >> gain: gain [

	self ffiLibrary assertSuccess:
		(self ffiLibrary setHapticGainHaptic: self gain: gain)
]

{ #category : '*SDL3-Own' }
SDL3Haptic >> getEffectStatusIntoEffect: effect [

	^ self ffiLibrary getHapticEffectStatusHaptic: self effect: effect
]

{ #category : '*SDL3-Own' }
SDL3Haptic >> id [

	^ self ffiLibrary getHapticID: self
]

{ #category : '*SDL3-Own' }
SDL3Haptic >> initRumble [

	self ffiLibrary assertSuccess: (self ffiLibrary initHapticRumble: self)
]

{ #category : '*SDL3-Own' }
SDL3Haptic >> maxEffects [

	^ self ffiLibrary getMaxHapticEffects: self
]

{ #category : '*SDL3-Own' }
SDL3Haptic >> maxEffectsPlaying [

	^ self ffiLibrary getMaxHapticEffectsPlaying: self
]

{ #category : '*SDL3-Own' }
SDL3Haptic >> name [

	^ self ffiLibrary getHapticName: self
]

{ #category : '*SDL3-Own' }
SDL3Haptic >> newEffect: effect [

	^ self ffiLibrary newHapticEffectHaptic: self effect: effect
]

{ #category : '*SDL3-Own' }
SDL3Haptic >> numberOfAxes [

	^ self ffiLibrary getNumHapticAxes: self
]

{ #category : '*SDL3-Own' }
SDL3Haptic >> pause [

	self ffiLibrary assertSuccess: (self ffiLibrary pauseHaptic: self)
]

{ #category : '*SDL3-Own' }
SDL3Haptic >> playRumbleStrength: strength length: length [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			playHapticRumbleHaptic: self
			strength: strength
			length: length)
]

{ #category : '*SDL3-Own' }
SDL3Haptic >> resume [

	self ffiLibrary assertSuccess: (self ffiLibrary resumeHaptic: self)
]

{ #category : '*SDL3-Own' }
SDL3Haptic >> rumbleSupported [

	^ self ffiLibrary hapticRumbleSupported: self
]

{ #category : '*SDL3-Own' }
SDL3Haptic >> runEffect: effect iterations: iterations [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			runHapticEffectHaptic: self
			effect: effect
			iterations: iterations)
]

{ #category : '*SDL3-Own' }
SDL3Haptic >> stopEffect: effect [

	self ffiLibrary assertSuccess:
		(self ffiLibrary stopHapticEffectHaptic: self effect: effect)
]

{ #category : '*SDL3-Own' }
SDL3Haptic >> stopEffects [

	self ffiLibrary assertSuccess: (self ffiLibrary stopHapticEffects: self)
]

{ #category : '*SDL3-Own' }
SDL3Haptic >> stopRumble [

	self ffiLibrary assertSuccess: (self ffiLibrary stopHapticRumble: self)
]

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

{ #category : '*SDL3-Own' }
SDL3Haptic >> updateEffect: effect data: data [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			updateHapticEffectHaptic: self
			effect: effect
			data: data)
]
