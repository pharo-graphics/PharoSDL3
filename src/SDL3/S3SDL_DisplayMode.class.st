Class {
	#name : 'S3SDL_DisplayMode',
	#superclass : 'S3Structure',
	#classVars : [
		'OFFSET_DISPLAYID',
		'OFFSET_FORMAT',
		'OFFSET_H',
		'OFFSET_INTERNAL',
		'OFFSET_PIXEL_DENSITY',
		'OFFSET_REFRESH_RATE',
		'OFFSET_REFRESH_RATE_DENOMINATOR',
		'OFFSET_REFRESH_RATE_NUMERATOR',
		'OFFSET_W'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'field definition' }
S3SDL_DisplayMode class >> fieldsDesc [

	^ #(
	SDL_DisplayID displayID;
	SDL_PixelFormat format;
	int w;
	int h;
	float pixel_density;
	float refresh_rate;
	int refresh_rate_numerator;
	int refresh_rate_denominator;
	SDL_DisplayModeData* internal
	)
]

{ #category : 'accessing - structure variables' }
S3SDL_DisplayMode >> displayID [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_DISPLAYID
]

{ #category : 'accessing - structure variables' }
S3SDL_DisplayMode >> displayID: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_DISPLAYID put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_DisplayMode >> format [
	"This method was automatically generated"
	^S3SDL_PixelFormat fromInteger: (handle unsignedLongAt: OFFSET_FORMAT)
]

{ #category : 'accessing - structure variables' }
S3SDL_DisplayMode >> format: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_FORMAT put: anObject value
]

{ #category : 'accessing - structure variables' }
S3SDL_DisplayMode >> h [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_H
]

{ #category : 'accessing - structure variables' }
S3SDL_DisplayMode >> h: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_H put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_DisplayMode >> internal [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_INTERNAL) type: ExternalType void asPointerType
]

{ #category : 'accessing - structure variables' }
S3SDL_DisplayMode >> internal: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_INTERNAL put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
S3SDL_DisplayMode >> pixel_density [
	"This method was automatically generated"
	^handle floatAt: OFFSET_PIXEL_DENSITY
]

{ #category : 'accessing - structure variables' }
S3SDL_DisplayMode >> pixel_density: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_PIXEL_DENSITY put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_DisplayMode >> refresh_rate [
	"This method was automatically generated"
	^handle floatAt: OFFSET_REFRESH_RATE
]

{ #category : 'accessing - structure variables' }
S3SDL_DisplayMode >> refresh_rate: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_REFRESH_RATE put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_DisplayMode >> refresh_rate_denominator [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_REFRESH_RATE_DENOMINATOR
]

{ #category : 'accessing - structure variables' }
S3SDL_DisplayMode >> refresh_rate_denominator: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_REFRESH_RATE_DENOMINATOR put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_DisplayMode >> refresh_rate_numerator [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_REFRESH_RATE_NUMERATOR
]

{ #category : 'accessing - structure variables' }
S3SDL_DisplayMode >> refresh_rate_numerator: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_REFRESH_RATE_NUMERATOR put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_DisplayMode >> w [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_W
]

{ #category : 'accessing - structure variables' }
S3SDL_DisplayMode >> w: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_W put: anObject
]
