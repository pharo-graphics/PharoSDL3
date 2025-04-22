Class {
	#name : 'S3SDL_HitTestResult',
	#superclass : 'S3Enumeration',
	#classVars : [
		'SDL_HITTEST_DRAGGABLE',
		'SDL_HITTEST_NORMAL',
		'SDL_HITTEST_RESIZE_BOTTOM',
		'SDL_HITTEST_RESIZE_BOTTOMLEFT',
		'SDL_HITTEST_RESIZE_BOTTOMRIGHT',
		'SDL_HITTEST_RESIZE_LEFT',
		'SDL_HITTEST_RESIZE_RIGHT',
		'SDL_HITTEST_RESIZE_TOP',
		'SDL_HITTEST_RESIZE_TOPLEFT',
		'SDL_HITTEST_RESIZE_TOPRIGHT'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'accessing enum' }
S3SDL_HitTestResult class >> draggable [
	"This method was automatically generated"
	^ SDL_HITTEST_DRAGGABLE
]

{ #category : 'enum declaration' }
S3SDL_HitTestResult class >> enumDecl [

	^ #(
	SDL_HITTEST_NORMAL 0
	SDL_HITTEST_DRAGGABLE 1
	SDL_HITTEST_RESIZE_TOPLEFT 2
	SDL_HITTEST_RESIZE_TOP 3
	SDL_HITTEST_RESIZE_TOPRIGHT 4
	SDL_HITTEST_RESIZE_RIGHT 5
	SDL_HITTEST_RESIZE_BOTTOMRIGHT 6
	SDL_HITTEST_RESIZE_BOTTOM 7
	SDL_HITTEST_RESIZE_BOTTOMLEFT 8
	SDL_HITTEST_RESIZE_LEFT 9 )
]

{ #category : 'accessing enum' }
S3SDL_HitTestResult class >> normal [
	"This method was automatically generated"
	^ SDL_HITTEST_NORMAL
]

{ #category : 'accessing enum' }
S3SDL_HitTestResult class >> resizeBottom [
	"This method was automatically generated"
	^ SDL_HITTEST_RESIZE_BOTTOM
]

{ #category : 'accessing enum' }
S3SDL_HitTestResult class >> resizeBottomleft [
	"This method was automatically generated"
	^ SDL_HITTEST_RESIZE_BOTTOMLEFT
]

{ #category : 'accessing enum' }
S3SDL_HitTestResult class >> resizeBottomright [
	"This method was automatically generated"
	^ SDL_HITTEST_RESIZE_BOTTOMRIGHT
]

{ #category : 'accessing enum' }
S3SDL_HitTestResult class >> resizeLeft [
	"This method was automatically generated"
	^ SDL_HITTEST_RESIZE_LEFT
]

{ #category : 'accessing enum' }
S3SDL_HitTestResult class >> resizeRight [
	"This method was automatically generated"
	^ SDL_HITTEST_RESIZE_RIGHT
]

{ #category : 'accessing enum' }
S3SDL_HitTestResult class >> resizeTop [
	"This method was automatically generated"
	^ SDL_HITTEST_RESIZE_TOP
]

{ #category : 'accessing enum' }
S3SDL_HitTestResult class >> resizeTopleft [
	"This method was automatically generated"
	^ SDL_HITTEST_RESIZE_TOPLEFT
]

{ #category : 'accessing enum' }
S3SDL_HitTestResult class >> resizeTopright [
	"This method was automatically generated"
	^ SDL_HITTEST_RESIZE_TOPRIGHT
]
