Class {
	#name : 'SDL3Colorspace',
	#superclass : 'SDL3Enumeration',
	#classVars : [
		'SDL_COLORSPACE_BT2020_FULL',
		'SDL_COLORSPACE_BT2020_LIMITED',
		'SDL_COLORSPACE_BT601_FULL',
		'SDL_COLORSPACE_BT601_LIMITED',
		'SDL_COLORSPACE_BT709_FULL',
		'SDL_COLORSPACE_BT709_LIMITED',
		'SDL_COLORSPACE_HDR10',
		'SDL_COLORSPACE_JPEG',
		'SDL_COLORSPACE_RGB_DEFAULT',
		'SDL_COLORSPACE_SRGB',
		'SDL_COLORSPACE_SRGB_LINEAR',
		'SDL_COLORSPACE_UNKNOWN',
		'SDL_COLORSPACE_YUV_DEFAULT'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'accessing enum' }
SDL3Colorspace class >> bt2020Full [
	"This method was automatically generated"
	^ SDL_COLORSPACE_BT2020_FULL
]

{ #category : 'accessing enum' }
SDL3Colorspace class >> bt2020Limited [
	"This method was automatically generated"
	^ SDL_COLORSPACE_BT2020_LIMITED
]

{ #category : 'accessing enum' }
SDL3Colorspace class >> bt601Full [
	"This method was automatically generated"
	^ SDL_COLORSPACE_BT601_FULL
]

{ #category : 'accessing enum' }
SDL3Colorspace class >> bt601Limited [
	"This method was automatically generated"
	^ SDL_COLORSPACE_BT601_LIMITED
]

{ #category : 'accessing enum' }
SDL3Colorspace class >> bt709Full [
	"This method was automatically generated"
	^ SDL_COLORSPACE_BT709_FULL
]

{ #category : 'accessing enum' }
SDL3Colorspace class >> bt709Limited [
	"This method was automatically generated"
	^ SDL_COLORSPACE_BT709_LIMITED
]

{ #category : 'enum declaration' }
SDL3Colorspace class >> enumDecl [

	^ #(
	SDL_COLORSPACE_UNKNOWN 0
	SDL_COLORSPACE_SRGB 301991328
	SDL_COLORSPACE_SRGB_LINEAR 301991168
	SDL_COLORSPACE_HDR10 301999616
	SDL_COLORSPACE_JPEG 570426566
	SDL_COLORSPACE_BT601_LIMITED 554703046
	SDL_COLORSPACE_BT601_FULL 571480262
	SDL_COLORSPACE_BT709_LIMITED 554697761
	SDL_COLORSPACE_BT709_FULL 571474977
	SDL_COLORSPACE_BT2020_LIMITED 554706441
	SDL_COLORSPACE_BT2020_FULL 571483657
	SDL_COLORSPACE_RGB_DEFAULT 301991328
	SDL_COLORSPACE_YUV_DEFAULT 570426566 )
]

{ #category : 'accessing enum' }
SDL3Colorspace class >> hdr10 [
	"This method was automatically generated"
	^ SDL_COLORSPACE_HDR10
]

{ #category : 'accessing enum' }
SDL3Colorspace class >> jpeg [
	"This method was automatically generated"
	^ SDL_COLORSPACE_JPEG
]

{ #category : 'accessing enum' }
SDL3Colorspace class >> rgbDefault [
	"This method was automatically generated"
	^ SDL_COLORSPACE_RGB_DEFAULT
]

{ #category : 'accessing enum' }
SDL3Colorspace class >> srgb [
	"This method was automatically generated"
	^ SDL_COLORSPACE_SRGB
]

{ #category : 'accessing enum' }
SDL3Colorspace class >> srgbLinear [
	"This method was automatically generated"
	^ SDL_COLORSPACE_SRGB_LINEAR
]

{ #category : 'accessing enum' }
SDL3Colorspace class >> unknown [
	"This method was automatically generated"
	^ SDL_COLORSPACE_UNKNOWN
]

{ #category : 'accessing enum' }
SDL3Colorspace class >> yuvDefault [
	"This method was automatically generated"
	^ SDL_COLORSPACE_YUV_DEFAULT
]
