Class {
	#name : 'S3IMG_Animation',
	#superclass : 'S3Structure',
	#classVars : [
		'OFFSET_COUNT',
		'OFFSET_DELAYS',
		'OFFSET_FRAMES',
		'OFFSET_H',
		'OFFSET_W'
	],
	#pools : [
		'S3SDL3Typedef',
		'S3SDL_imageTypedef'
	],
	#category : 'SDL3-Image-Base',
	#package : 'SDL3-Image',
	#tag : 'Base'
}

{ #category : 'field definition' }
S3IMG_Animation class >> fieldsDesc [

	^ #(
	int w;
	int h;
	int count;
	SDL_Surface** frames;
	int* delays
	)
]

{ #category : 'accessing - structure variables' }
S3IMG_Animation >> count [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_COUNT
]

{ #category : 'accessing - structure variables' }
S3IMG_Animation >> count: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_COUNT put: anObject
]

{ #category : 'accessing - structure variables' }
S3IMG_Animation >> delays [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_DELAYS) type: ExternalType long asPointerType
]

{ #category : 'accessing - structure variables' }
S3IMG_Animation >> delays: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_DELAYS put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
S3IMG_Animation >> frames [
	"This method was automatically generated"
	^S3SDL_Surface fromHandle: (handle pointerAt: OFFSET_FRAMES)
]

{ #category : 'accessing - structure variables' }
S3IMG_Animation >> frames: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_FRAMES put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
S3IMG_Animation >> h [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_H
]

{ #category : 'accessing - structure variables' }
S3IMG_Animation >> h: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_H put: anObject
]

{ #category : 'accessing - structure variables' }
S3IMG_Animation >> w [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_W
]

{ #category : 'accessing - structure variables' }
S3IMG_Animation >> w: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_W put: anObject
]
