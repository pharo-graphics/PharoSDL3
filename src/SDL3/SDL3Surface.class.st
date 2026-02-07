Class {
	#name : 'SDL3Surface',
	#superclass : 'SDL3Structure',
	#classVars : [
		'OFFSET_FLAGS',
		'OFFSET_FORMAT',
		'OFFSET_H',
		'OFFSET_PITCH',
		'OFFSET_PIXELS',
		'OFFSET_REFCOUNT',
		'OFFSET_RESERVED',
		'OFFSET_W'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'field definition' }
SDL3Surface class >> fieldsDesc [

	^ #(
	SDL_SurfaceFlags flags;
	SDL_PixelFormat format;
	int w;
	int h;
	int pitch;
	void* pixels;
	int refcount;
	void* reserved
	)
]

{ #category : 'accessing - structure variables' }
SDL3Surface >> flags [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_FLAGS
]

{ #category : 'accessing - structure variables' }
SDL3Surface >> flags: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_FLAGS put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3Surface >> format [
	"This method was automatically generated"
	^SDL3PixelFormat fromInteger: (handle unsignedLongAt: OFFSET_FORMAT)
]

{ #category : 'accessing - structure variables' }
SDL3Surface >> format: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_FORMAT put: anObject value
]

{ #category : 'accessing - structure variables' }
SDL3Surface >> h [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_H
]

{ #category : 'accessing - structure variables' }
SDL3Surface >> h: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_H put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3Surface >> pitch [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_PITCH
]

{ #category : 'accessing - structure variables' }
SDL3Surface >> pitch: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_PITCH put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3Surface >> pixels [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_PIXELS) type: ExternalType void asPointerType
]

{ #category : 'accessing - structure variables' }
SDL3Surface >> pixels: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_PIXELS put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
SDL3Surface >> refcount [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_REFCOUNT
]

{ #category : 'accessing - structure variables' }
SDL3Surface >> refcount: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_REFCOUNT put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3Surface >> w [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_W
]

{ #category : 'accessing - structure variables' }
SDL3Surface >> w: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_W put: anObject
]
