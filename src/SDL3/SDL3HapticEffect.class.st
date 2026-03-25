Class {
	#name : 'SDL3HapticEffect',
	#superclass : 'SDL3Union',
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'field definition' }
SDL3HapticEffect class >> fieldsDesc [

	^ #(
	SDL_HapticEffectType type;
	SDL_HapticConstant constant;
	SDL_HapticPeriodic periodic;
	SDL_HapticCondition condition;
	SDL_HapticRamp ramp;
	SDL_HapticLeftRight leftright;
	SDL_HapticCustom custom
	)
]

{ #category : 'accessing - structure variables' }
SDL3HapticEffect >> condition [
	"This method was automatically generated"
	^ SDL3HapticCondition fromHandle: (handle referenceStructAt: 1 length: SDL3HapticCondition byteSize)
]

{ #category : 'accessing - structure variables' }
SDL3HapticEffect >> condition: anObject [
	"This method was automatically generated"
	handle structAt: 1 put: anObject getHandle length: 68.
]

{ #category : 'accessing - structure variables' }
SDL3HapticEffect >> constant [
	"This method was automatically generated"
	^ SDL3HapticConstant fromHandle: (handle referenceStructAt: 1 length: SDL3HapticConstant byteSize)
]

{ #category : 'accessing - structure variables' }
SDL3HapticEffect >> constant: anObject [
	"This method was automatically generated"
	handle structAt: 1 put: anObject getHandle length: 40.
]

{ #category : 'accessing - structure variables' }
SDL3HapticEffect >> custom [
	"This method was automatically generated"
	^ SDL3HapticCustom fromHandle: (handle referenceStructAt: 1 length: SDL3HapticCustom byteSize)
]

{ #category : 'accessing - structure variables' }
SDL3HapticEffect >> custom: anObject [
	"This method was automatically generated"
	handle structAt: 1 put: anObject getHandle length: 56.
]

{ #category : 'accessing - structure variables' }
SDL3HapticEffect >> leftright [
	"This method was automatically generated"
	^ SDL3HapticLeftRight fromHandle: (handle referenceStructAt: 1 length: SDL3HapticLeftRight byteSize)
]

{ #category : 'accessing - structure variables' }
SDL3HapticEffect >> leftright: anObject [
	"This method was automatically generated"
	handle structAt: 1 put: anObject getHandle length: 12.
]

{ #category : 'accessing - structure variables' }
SDL3HapticEffect >> periodic [
	"This method was automatically generated"
	^ SDL3HapticPeriodic fromHandle: (handle referenceStructAt: 1 length: SDL3HapticPeriodic byteSize)
]

{ #category : 'accessing - structure variables' }
SDL3HapticEffect >> periodic: anObject [
	"This method was automatically generated"
	handle structAt: 1 put: anObject getHandle length: 48.
]

{ #category : 'accessing - structure variables' }
SDL3HapticEffect >> ramp [
	"This method was automatically generated"
	^ SDL3HapticRamp fromHandle: (handle referenceStructAt: 1 length: SDL3HapticRamp byteSize)
]

{ #category : 'accessing - structure variables' }
SDL3HapticEffect >> ramp: anObject [
	"This method was automatically generated"
	handle structAt: 1 put: anObject getHandle length: 44.
]

{ #category : 'accessing - structure variables' }
SDL3HapticEffect >> type [
	"This method was automatically generated"
	^handle unsignedShortAt: 1
]

{ #category : 'accessing - structure variables' }
SDL3HapticEffect >> type: anObject [
	"This method was automatically generated"
	handle unsignedShortAt: 1 put: anObject
]
