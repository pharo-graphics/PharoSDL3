Class {
	#name : 'SDL3CameraSpec',
	#superclass : 'SDL3Structure',
	#classVars : [
		'OFFSET_COLORSPACE',
		'OFFSET_FORMAT',
		'OFFSET_FRAMERATE_DENOMINATOR',
		'OFFSET_FRAMERATE_NUMERATOR',
		'OFFSET_HEIGHT',
		'OFFSET_WIDTH'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'field definition' }
SDL3CameraSpec class >> fieldsDesc [

	^ #(
	SDL_PixelFormat format;
	SDL_Colorspace colorspace;
	int width;
	int height;
	int framerate_numerator;
	int framerate_denominator
	)
]

{ #category : 'accessing - structure variables' }
SDL3CameraSpec >> colorspace [
	"This method was automatically generated"
	^SDL3Colorspace fromInteger: (handle unsignedLongAt: OFFSET_COLORSPACE)
]

{ #category : 'accessing - structure variables' }
SDL3CameraSpec >> colorspace: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_COLORSPACE put: anObject value
]

{ #category : 'accessing - structure variables' }
SDL3CameraSpec >> format [
	"This method was automatically generated"
	^SDL3PixelFormat fromInteger: (handle unsignedLongAt: OFFSET_FORMAT)
]

{ #category : 'accessing - structure variables' }
SDL3CameraSpec >> format: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_FORMAT put: anObject value
]

{ #category : 'accessing - structure variables' }
SDL3CameraSpec >> framerateDenominator [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_FRAMERATE_DENOMINATOR
]

{ #category : 'accessing - structure variables' }
SDL3CameraSpec >> framerateDenominator: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_FRAMERATE_DENOMINATOR put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3CameraSpec >> framerateNumerator [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_FRAMERATE_NUMERATOR
]

{ #category : 'accessing - structure variables' }
SDL3CameraSpec >> framerateNumerator: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_FRAMERATE_NUMERATOR put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3CameraSpec >> height [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_HEIGHT
]

{ #category : 'accessing - structure variables' }
SDL3CameraSpec >> height: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_HEIGHT put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3CameraSpec >> width [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_WIDTH
]

{ #category : 'accessing - structure variables' }
SDL3CameraSpec >> width: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_WIDTH put: anObject
]
