Class {
	#name : 'S3SDL_CameraSpec',
	#superclass : 'S3Structure',
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
S3SDL_CameraSpec class >> fieldsDesc [

	^ #(
	int format;
	int colorspace;
	int width;
	int height;
	int framerate_numerator;
	int framerate_denominator
	)
]

{ #category : 'accessing - structure variables' }
S3SDL_CameraSpec >> colorspace [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_COLORSPACE
]

{ #category : 'accessing - structure variables' }
S3SDL_CameraSpec >> colorspace: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_COLORSPACE put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_CameraSpec >> format [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_FORMAT
]

{ #category : 'accessing - structure variables' }
S3SDL_CameraSpec >> format: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_FORMAT put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_CameraSpec >> framerate_denominator [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_FRAMERATE_DENOMINATOR
]

{ #category : 'accessing - structure variables' }
S3SDL_CameraSpec >> framerate_denominator: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_FRAMERATE_DENOMINATOR put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_CameraSpec >> framerate_numerator [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_FRAMERATE_NUMERATOR
]

{ #category : 'accessing - structure variables' }
S3SDL_CameraSpec >> framerate_numerator: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_FRAMERATE_NUMERATOR put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_CameraSpec >> height [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_HEIGHT
]

{ #category : 'accessing - structure variables' }
S3SDL_CameraSpec >> height: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_HEIGHT put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_CameraSpec >> width [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_WIDTH
]

{ #category : 'accessing - structure variables' }
S3SDL_CameraSpec >> width: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_WIDTH put: anObject
]
