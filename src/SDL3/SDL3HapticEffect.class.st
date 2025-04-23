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
	int type;
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
	^ S3SDL_HapticCondition fromHandle: (handle referenceStructAt: 1 length: S3SDL_HapticCondition byteSize)
]

{ #category : 'accessing - structure variables' }
SDL3HapticEffect >> condition: anObject [
	"This method was automatically generated"
	handle structAt: 1 put: anObject getHandle length: 108.
]

{ #category : 'accessing - structure variables' }
SDL3HapticEffect >> constant [
	"This method was automatically generated"
	^ S3SDL_HapticConstant fromHandle: (handle referenceStructAt: 1 length: S3SDL_HapticConstant byteSize)
]

{ #category : 'accessing - structure variables' }
SDL3HapticEffect >> constant: anObject [
	"This method was automatically generated"
	handle structAt: 1 put: anObject getHandle length: 56.
]

{ #category : 'accessing - structure variables' }
SDL3HapticEffect >> custom [
	"This method was automatically generated"
	^ S3SDL_HapticCustom fromHandle: (handle referenceStructAt: 1 length: S3SDL_HapticCustom byteSize)
]

{ #category : 'accessing - structure variables' }
SDL3HapticEffect >> custom: anObject [
	"This method was automatically generated"
	handle structAt: 1 put: anObject getHandle length: 72.
]

{ #category : 'accessing - structure variables' }
SDL3HapticEffect >> leftright [
	"This method was automatically generated"
	^ S3SDL_HapticLeftRight fromHandle: (handle referenceStructAt: 1 length: S3SDL_HapticLeftRight byteSize)
]

{ #category : 'accessing - structure variables' }
SDL3HapticEffect >> leftright: anObject [
	"This method was automatically generated"
	handle structAt: 1 put: anObject getHandle length: 16.
]

{ #category : 'accessing - structure variables' }
SDL3HapticEffect >> periodic [
	"This method was automatically generated"
	^ S3SDL_HapticPeriodic fromHandle: (handle referenceStructAt: 1 length: S3SDL_HapticPeriodic byteSize)
]

{ #category : 'accessing - structure variables' }
SDL3HapticEffect >> periodic: anObject [
	"This method was automatically generated"
	handle structAt: 1 put: anObject getHandle length: 68.
]

{ #category : 'accessing - structure variables' }
SDL3HapticEffect >> ramp [
	"This method was automatically generated"
	^ S3SDL_HapticRamp fromHandle: (handle referenceStructAt: 1 length: S3SDL_HapticRamp byteSize)
]

{ #category : 'accessing - structure variables' }
SDL3HapticEffect >> ramp: anObject [
	"This method was automatically generated"
	handle structAt: 1 put: anObject getHandle length: 60.
]

{ #category : 'accessing - structure variables' }
SDL3HapticEffect >> type [
	"This method was automatically generated"
	^handle signedLongAt: 1
]

{ #category : 'accessing - structure variables' }
SDL3HapticEffect >> type: anObject [
	"This method was automatically generated"
	handle signedLongAt: 1 put: anObject
]
