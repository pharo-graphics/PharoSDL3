Class {
	#name : 'S3SDL_PixelFormatDetails',
	#superclass : 'S3Structure',
	#classVars : [
		'OFFSET_ABITS',
		'OFFSET_AMASK',
		'OFFSET_ASHIFT',
		'OFFSET_BBITS',
		'OFFSET_BITS_PER_PIXEL',
		'OFFSET_BMASK',
		'OFFSET_BSHIFT',
		'OFFSET_BYTES_PER_PIXEL',
		'OFFSET_FORMAT',
		'OFFSET_GBITS',
		'OFFSET_GMASK',
		'OFFSET_GSHIFT',
		'OFFSET_PADDING',
		'OFFSET_RBITS',
		'OFFSET_RMASK',
		'OFFSET_RSHIFT'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'field definition' }
S3SDL_PixelFormatDetails class >> fieldsDesc [

	^ #(
	SDL_PixelFormat format;
	Uint8 bits_per_pixel;
	Uint8 bytes_per_pixel;
	Uint8_2 padding;
	Uint32 Rmask;
	Uint32 Gmask;
	Uint32 Bmask;
	Uint32 Amask;
	Uint8 Rbits;
	Uint8 Gbits;
	Uint8 Bbits;
	Uint8 Abits;
	Uint8 Rshift;
	Uint8 Gshift;
	Uint8 Bshift;
	Uint8 Ashift
	)
]

{ #category : 'accessing - structure variables' }
S3SDL_PixelFormatDetails >> Abits [
	"This method was automatically generated"
	^handle unsignedByteAt: OFFSET_ABITS
]

{ #category : 'accessing - structure variables' }
S3SDL_PixelFormatDetails >> Abits: anObject [
	"This method was automatically generated"
	handle unsignedByteAt: OFFSET_ABITS put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_PixelFormatDetails >> Amask [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_AMASK
]

{ #category : 'accessing - structure variables' }
S3SDL_PixelFormatDetails >> Amask: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_AMASK put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_PixelFormatDetails >> Ashift [
	"This method was automatically generated"
	^handle unsignedByteAt: OFFSET_ASHIFT
]

{ #category : 'accessing - structure variables' }
S3SDL_PixelFormatDetails >> Ashift: anObject [
	"This method was automatically generated"
	handle unsignedByteAt: OFFSET_ASHIFT put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_PixelFormatDetails >> Bbits [
	"This method was automatically generated"
	^handle unsignedByteAt: OFFSET_BBITS
]

{ #category : 'accessing - structure variables' }
S3SDL_PixelFormatDetails >> Bbits: anObject [
	"This method was automatically generated"
	handle unsignedByteAt: OFFSET_BBITS put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_PixelFormatDetails >> Bmask [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_BMASK
]

{ #category : 'accessing - structure variables' }
S3SDL_PixelFormatDetails >> Bmask: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_BMASK put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_PixelFormatDetails >> Bshift [
	"This method was automatically generated"
	^handle unsignedByteAt: OFFSET_BSHIFT
]

{ #category : 'accessing - structure variables' }
S3SDL_PixelFormatDetails >> Bshift: anObject [
	"This method was automatically generated"
	handle unsignedByteAt: OFFSET_BSHIFT put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_PixelFormatDetails >> Gbits [
	"This method was automatically generated"
	^handle unsignedByteAt: OFFSET_GBITS
]

{ #category : 'accessing - structure variables' }
S3SDL_PixelFormatDetails >> Gbits: anObject [
	"This method was automatically generated"
	handle unsignedByteAt: OFFSET_GBITS put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_PixelFormatDetails >> Gmask [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_GMASK
]

{ #category : 'accessing - structure variables' }
S3SDL_PixelFormatDetails >> Gmask: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_GMASK put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_PixelFormatDetails >> Gshift [
	"This method was automatically generated"
	^handle unsignedByteAt: OFFSET_GSHIFT
]

{ #category : 'accessing - structure variables' }
S3SDL_PixelFormatDetails >> Gshift: anObject [
	"This method was automatically generated"
	handle unsignedByteAt: OFFSET_GSHIFT put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_PixelFormatDetails >> Rbits [
	"This method was automatically generated"
	^handle unsignedByteAt: OFFSET_RBITS
]

{ #category : 'accessing - structure variables' }
S3SDL_PixelFormatDetails >> Rbits: anObject [
	"This method was automatically generated"
	handle unsignedByteAt: OFFSET_RBITS put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_PixelFormatDetails >> Rmask [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_RMASK
]

{ #category : 'accessing - structure variables' }
S3SDL_PixelFormatDetails >> Rmask: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_RMASK put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_PixelFormatDetails >> Rshift [
	"This method was automatically generated"
	^handle unsignedByteAt: OFFSET_RSHIFT
]

{ #category : 'accessing - structure variables' }
S3SDL_PixelFormatDetails >> Rshift: anObject [
	"This method was automatically generated"
	handle unsignedByteAt: OFFSET_RSHIFT put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_PixelFormatDetails >> bits_per_pixel [
	"This method was automatically generated"
	^handle unsignedByteAt: OFFSET_BITS_PER_PIXEL
]

{ #category : 'accessing - structure variables' }
S3SDL_PixelFormatDetails >> bits_per_pixel: anObject [
	"This method was automatically generated"
	handle unsignedByteAt: OFFSET_BITS_PER_PIXEL put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_PixelFormatDetails >> bytes_per_pixel [
	"This method was automatically generated"
	^handle unsignedByteAt: OFFSET_BYTES_PER_PIXEL
]

{ #category : 'accessing - structure variables' }
S3SDL_PixelFormatDetails >> bytes_per_pixel: anObject [
	"This method was automatically generated"
	handle unsignedByteAt: OFFSET_BYTES_PER_PIXEL put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_PixelFormatDetails >> format [
	"This method was automatically generated"
	^S3SDL_PixelFormat fromInteger: (handle unsignedLongAt: OFFSET_FORMAT)
]

{ #category : 'accessing - structure variables' }
S3SDL_PixelFormatDetails >> format: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_FORMAT put: anObject value
]

{ #category : 'accessing - structure variables' }
S3SDL_PixelFormatDetails >> padding [
	"This method was automatically generated"
	^(FFITypeArray ofType: #FFIUInt8 size: 2) fromHandle: (handle copyFrom: OFFSET_PADDING to: OFFSET_PADDING + 1)
]

{ #category : 'accessing - structure variables' }
S3SDL_PixelFormatDetails >> padding: anObject [
	"This method was automatically generated"
	handle replaceFrom: OFFSET_PADDING to: OFFSET_PADDING + 1 with: anObject getHandle startingAt: 1
]
