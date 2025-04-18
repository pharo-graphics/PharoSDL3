Class {
	#name : 'S3SDL_Colorspace',
	#superclass : 'S3Enumeration',
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
S3SDL_Colorspace class >> SDL_COLORSPACE_BT2020_FULL [
	"This method was automatically generated"
	^ SDL_COLORSPACE_BT2020_FULL
]

{ #category : 'accessing enum' }
S3SDL_Colorspace class >> SDL_COLORSPACE_BT2020_LIMITED [
	"This method was automatically generated"
	^ SDL_COLORSPACE_BT2020_LIMITED
]

{ #category : 'accessing enum' }
S3SDL_Colorspace class >> SDL_COLORSPACE_BT601_FULL [
	"This method was automatically generated"
	^ SDL_COLORSPACE_BT601_FULL
]

{ #category : 'accessing enum' }
S3SDL_Colorspace class >> SDL_COLORSPACE_BT601_LIMITED [
	"This method was automatically generated"
	^ SDL_COLORSPACE_BT601_LIMITED
]

{ #category : 'accessing enum' }
S3SDL_Colorspace class >> SDL_COLORSPACE_BT709_FULL [
	"This method was automatically generated"
	^ SDL_COLORSPACE_BT709_FULL
]

{ #category : 'accessing enum' }
S3SDL_Colorspace class >> SDL_COLORSPACE_BT709_LIMITED [
	"This method was automatically generated"
	^ SDL_COLORSPACE_BT709_LIMITED
]

{ #category : 'accessing enum' }
S3SDL_Colorspace class >> SDL_COLORSPACE_HDR10 [
	"This method was automatically generated"
	^ SDL_COLORSPACE_HDR10
]

{ #category : 'accessing enum' }
S3SDL_Colorspace class >> SDL_COLORSPACE_JPEG [
	"This method was automatically generated"
	^ SDL_COLORSPACE_JPEG
]

{ #category : 'accessing enum' }
S3SDL_Colorspace class >> SDL_COLORSPACE_RGB_DEFAULT [
	"This method was automatically generated"
	^ SDL_COLORSPACE_RGB_DEFAULT
]

{ #category : 'accessing enum' }
S3SDL_Colorspace class >> SDL_COLORSPACE_SRGB [
	"This method was automatically generated"
	^ SDL_COLORSPACE_SRGB
]

{ #category : 'accessing enum' }
S3SDL_Colorspace class >> SDL_COLORSPACE_SRGB_LINEAR [
	"This method was automatically generated"
	^ SDL_COLORSPACE_SRGB_LINEAR
]

{ #category : 'accessing enum' }
S3SDL_Colorspace class >> SDL_COLORSPACE_UNKNOWN [
	"This method was automatically generated"
	^ SDL_COLORSPACE_UNKNOWN
]

{ #category : 'accessing enum' }
S3SDL_Colorspace class >> SDL_COLORSPACE_YUV_DEFAULT [
	"This method was automatically generated"
	^ SDL_COLORSPACE_YUV_DEFAULT
]

{ #category : 'enum declaration' }
S3SDL_Colorspace class >> enumDecl [

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
