Class {
	#name : 'S3SDL_HapticEffect',
	#superclass : 'S3Union',
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'field definition' }
S3SDL_HapticEffect class >> fieldsDesc [

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
S3SDL_HapticEffect >> condition [
	"This method was automatically generated"
	^ S3SDL_HapticCondition fromHandle: (handle referenceStructAt: 1 length: S3SDL_HapticCondition byteSize)
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticEffect >> condition: anObject [
	"This method was automatically generated"
	handle structAt: 1 put: anObject getHandle length: 108.
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticEffect >> constant [
	"This method was automatically generated"
	^ S3SDL_HapticConstant fromHandle: (handle referenceStructAt: 1 length: S3SDL_HapticConstant byteSize)
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticEffect >> constant: anObject [
	"This method was automatically generated"
	handle structAt: 1 put: anObject getHandle length: 56.
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticEffect >> custom [
	"This method was automatically generated"
	^ S3SDL_HapticCustom fromHandle: (handle referenceStructAt: 1 length: S3SDL_HapticCustom byteSize)
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticEffect >> custom: anObject [
	"This method was automatically generated"
	handle structAt: 1 put: anObject getHandle length: 72.
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticEffect >> leftright [
	"This method was automatically generated"
	^ S3SDL_HapticLeftRight fromHandle: (handle referenceStructAt: 1 length: S3SDL_HapticLeftRight byteSize)
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticEffect >> leftright: anObject [
	"This method was automatically generated"
	handle structAt: 1 put: anObject getHandle length: 16.
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticEffect >> periodic [
	"This method was automatically generated"
	^ S3SDL_HapticPeriodic fromHandle: (handle referenceStructAt: 1 length: S3SDL_HapticPeriodic byteSize)
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticEffect >> periodic: anObject [
	"This method was automatically generated"
	handle structAt: 1 put: anObject getHandle length: 68.
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticEffect >> ramp [
	"This method was automatically generated"
	^ S3SDL_HapticRamp fromHandle: (handle referenceStructAt: 1 length: S3SDL_HapticRamp byteSize)
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticEffect >> ramp: anObject [
	"This method was automatically generated"
	handle structAt: 1 put: anObject getHandle length: 60.
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticEffect >> type [
	"This method was automatically generated"
	^handle signedLongAt: 1
]

{ #category : 'accessing - structure variables' }
S3SDL_HapticEffect >> type: anObject [
	"This method was automatically generated"
	handle signedLongAt: 1 put: anObject
]
