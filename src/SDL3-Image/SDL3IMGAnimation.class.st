Class {
	#name : 'SDL3IMGAnimation',
	#superclass : 'SDL3Structure',
	#classVars : [
		'OFFSET_COUNT',
		'OFFSET_DELAYS',
		'OFFSET_FRAMES',
		'OFFSET_H',
		'OFFSET_W'
	],
	#pools : [
		'SDL3ImageTypedef',
		'SDL3Typedef'
	],
	#category : 'SDL3-Image-Base',
	#package : 'SDL3-Image',
	#tag : 'Base'
}

{ #category : 'field definition' }
SDL3IMGAnimation class >> fieldsDesc [

	^ #(
	int w;
	int h;
	int count;
	SDL_Surface** frames;
	int* delays
	)
]

{ #category : 'accessing - structure variables' }
SDL3IMGAnimation >> count [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_COUNT
]

{ #category : 'accessing - structure variables' }
SDL3IMGAnimation >> count: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_COUNT put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3IMGAnimation >> delays [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_DELAYS) type: ExternalType long asPointerType
]

{ #category : 'accessing - structure variables' }
SDL3IMGAnimation >> delays: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_DELAYS put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
SDL3IMGAnimation >> frames [
	"This method was automatically generated"
	^SDL3Surface fromHandle: (handle pointerAt: OFFSET_FRAMES)
]

{ #category : 'accessing - structure variables' }
SDL3IMGAnimation >> frames: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_FRAMES put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
SDL3IMGAnimation >> h [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_H
]

{ #category : 'accessing - structure variables' }
SDL3IMGAnimation >> h: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_H put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3IMGAnimation >> w [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_W
]

{ #category : 'accessing - structure variables' }
SDL3IMGAnimation >> w: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_W put: anObject
]
