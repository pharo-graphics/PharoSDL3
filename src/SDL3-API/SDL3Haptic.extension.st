Extension { #name : 'SDL3Haptic' }

{ #category : '*SDL3-API' }
SDL3Haptic >> autocenter: autocenter [

	^ self ffiLibrary setHapticAutocenterHaptic: self autocenter: autocenter
]

{ #category : '*SDL3-API' }
SDL3Haptic >> close [

	^ self ffiLibrary closeHaptic: self
]

{ #category : '*SDL3-API' }
SDL3Haptic >> destroyEffect: effect [

	^ self ffiLibrary destroyHapticEffectHaptic: self effect: effect
]

{ #category : '*SDL3-API' }
SDL3Haptic >> effectSupportedEffect: effect [

	^ self ffiLibrary hapticEffectSupportedHaptic: self effect: effect
]

{ #category : '*SDL3-API' }
SDL3Haptic >> features [

	^ self ffiLibrary getHapticFeatures: self
]

{ #category : '*SDL3-API' }
SDL3Haptic >> gain: gain [

	^ self ffiLibrary setHapticGainHaptic: self gain: gain
]

{ #category : '*SDL3-API' }
SDL3Haptic >> getEffectStatusIntoEffect: effect [

	^ self ffiLibrary getHapticEffectStatusHaptic: self effect: effect
]

{ #category : '*SDL3-API' }
SDL3Haptic >> id [

	^ self ffiLibrary getHapticID: self
]

{ #category : '*SDL3-API' }
SDL3Haptic >> initRumble [

	^ self ffiLibrary initHapticRumble: self
]

{ #category : '*SDL3-API' }
SDL3Haptic >> maxEffects [

	^ self ffiLibrary getMaxHapticEffects: self
]

{ #category : '*SDL3-API' }
SDL3Haptic >> maxEffectsPlaying [

	^ self ffiLibrary getMaxHapticEffectsPlaying: self
]

{ #category : '*SDL3-API' }
SDL3Haptic >> name [

	^ self ffiLibrary getHapticName: self
]

{ #category : '*SDL3-API' }
SDL3Haptic >> newEffect: effect [

	^ self ffiLibrary newHapticEffectHaptic: self effect: effect
]

{ #category : '*SDL3-API' }
SDL3Haptic >> numberOfAxes [

	^ self ffiLibrary getNumHapticAxes: self
]

{ #category : '*SDL3-API' }
SDL3Haptic >> pause [

	^ self ffiLibrary pauseHaptic: self
]

{ #category : '*SDL3-API' }
SDL3Haptic >> playRumbleStrength: strength length: length [

	^ self ffiLibrary playHapticRumbleHaptic: self strength: strength length: length
]

{ #category : '*SDL3-API' }
SDL3Haptic >> resume [

	^ self ffiLibrary resumeHaptic: self
]

{ #category : '*SDL3-API' }
SDL3Haptic >> rumbleSupported [

	^ self ffiLibrary hapticRumbleSupported: self
]

{ #category : '*SDL3-API' }
SDL3Haptic >> runEffect: effect iterations: iterations [

	^ self ffiLibrary runHapticEffectHaptic: self effect: effect iterations: iterations
]

{ #category : '*SDL3-API' }
SDL3Haptic >> stopEffect: effect [

	^ self ffiLibrary stopHapticEffectHaptic: self effect: effect
]

{ #category : '*SDL3-API' }
SDL3Haptic >> stopEffects [

	^ self ffiLibrary stopHapticEffects: self
]

{ #category : '*SDL3-API' }
SDL3Haptic >> stopRumble [

	^ self ffiLibrary stopHapticRumble: self
]

{ #category : '*SDL3-API' }
SDL3Haptic >> updateEffect: effect data: data [

	^ self ffiLibrary updateHapticEffectHaptic: self effect: effect data: data
]
