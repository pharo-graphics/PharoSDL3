Class {
	#name : 'S3SDL_SystemCursor',
	#superclass : 'S3Enumeration',
	#classVars : [
		'SDL_SYSTEM_CURSOR_COUNT',
		'SDL_SYSTEM_CURSOR_CROSSHAIR',
		'SDL_SYSTEM_CURSOR_DEFAULT',
		'SDL_SYSTEM_CURSOR_EW_RESIZE',
		'SDL_SYSTEM_CURSOR_E_RESIZE',
		'SDL_SYSTEM_CURSOR_MOVE',
		'SDL_SYSTEM_CURSOR_NESW_RESIZE',
		'SDL_SYSTEM_CURSOR_NE_RESIZE',
		'SDL_SYSTEM_CURSOR_NOT_ALLOWED',
		'SDL_SYSTEM_CURSOR_NS_RESIZE',
		'SDL_SYSTEM_CURSOR_NWSE_RESIZE',
		'SDL_SYSTEM_CURSOR_NW_RESIZE',
		'SDL_SYSTEM_CURSOR_N_RESIZE',
		'SDL_SYSTEM_CURSOR_POINTER',
		'SDL_SYSTEM_CURSOR_PROGRESS',
		'SDL_SYSTEM_CURSOR_SE_RESIZE',
		'SDL_SYSTEM_CURSOR_SW_RESIZE',
		'SDL_SYSTEM_CURSOR_S_RESIZE',
		'SDL_SYSTEM_CURSOR_TEXT',
		'SDL_SYSTEM_CURSOR_WAIT',
		'SDL_SYSTEM_CURSOR_W_RESIZE'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'accessing enum' }
S3SDL_SystemCursor class >> count [
	"This method was automatically generated"
	^ SDL_SYSTEM_CURSOR_COUNT
]

{ #category : 'accessing enum' }
S3SDL_SystemCursor class >> crosshair [
	"This method was automatically generated"
	^ SDL_SYSTEM_CURSOR_CROSSHAIR
]

{ #category : 'accessing enum' }
S3SDL_SystemCursor class >> default [
	"This method was automatically generated"
	^ SDL_SYSTEM_CURSOR_DEFAULT
]

{ #category : 'accessing enum' }
S3SDL_SystemCursor class >> eResize [
	"This method was automatically generated"
	^ SDL_SYSTEM_CURSOR_E_RESIZE
]

{ #category : 'enum declaration' }
S3SDL_SystemCursor class >> enumDecl [

	^ #(
	SDL_SYSTEM_CURSOR_DEFAULT 0
	SDL_SYSTEM_CURSOR_TEXT 1
	SDL_SYSTEM_CURSOR_WAIT 2
	SDL_SYSTEM_CURSOR_CROSSHAIR 3
	SDL_SYSTEM_CURSOR_PROGRESS 4
	SDL_SYSTEM_CURSOR_NWSE_RESIZE 5
	SDL_SYSTEM_CURSOR_NESW_RESIZE 6
	SDL_SYSTEM_CURSOR_EW_RESIZE 7
	SDL_SYSTEM_CURSOR_NS_RESIZE 8
	SDL_SYSTEM_CURSOR_MOVE 9
	SDL_SYSTEM_CURSOR_NOT_ALLOWED 10
	SDL_SYSTEM_CURSOR_POINTER 11
	SDL_SYSTEM_CURSOR_NW_RESIZE 12
	SDL_SYSTEM_CURSOR_N_RESIZE 13
	SDL_SYSTEM_CURSOR_NE_RESIZE 14
	SDL_SYSTEM_CURSOR_E_RESIZE 15
	SDL_SYSTEM_CURSOR_SE_RESIZE 16
	SDL_SYSTEM_CURSOR_S_RESIZE 17
	SDL_SYSTEM_CURSOR_SW_RESIZE 18
	SDL_SYSTEM_CURSOR_W_RESIZE 19
	SDL_SYSTEM_CURSOR_COUNT 20 )
]

{ #category : 'accessing enum' }
S3SDL_SystemCursor class >> ewResize [
	"This method was automatically generated"
	^ SDL_SYSTEM_CURSOR_EW_RESIZE
]

{ #category : 'accessing enum' }
S3SDL_SystemCursor class >> move [
	"This method was automatically generated"
	^ SDL_SYSTEM_CURSOR_MOVE
]

{ #category : 'accessing enum' }
S3SDL_SystemCursor class >> nResize [
	"This method was automatically generated"
	^ SDL_SYSTEM_CURSOR_N_RESIZE
]

{ #category : 'accessing enum' }
S3SDL_SystemCursor class >> neResize [
	"This method was automatically generated"
	^ SDL_SYSTEM_CURSOR_NE_RESIZE
]

{ #category : 'accessing enum' }
S3SDL_SystemCursor class >> neswResize [
	"This method was automatically generated"
	^ SDL_SYSTEM_CURSOR_NESW_RESIZE
]

{ #category : 'accessing enum' }
S3SDL_SystemCursor class >> notAllowed [
	"This method was automatically generated"
	^ SDL_SYSTEM_CURSOR_NOT_ALLOWED
]

{ #category : 'accessing enum' }
S3SDL_SystemCursor class >> nsResize [
	"This method was automatically generated"
	^ SDL_SYSTEM_CURSOR_NS_RESIZE
]

{ #category : 'accessing enum' }
S3SDL_SystemCursor class >> nwResize [
	"This method was automatically generated"
	^ SDL_SYSTEM_CURSOR_NW_RESIZE
]

{ #category : 'accessing enum' }
S3SDL_SystemCursor class >> nwseResize [
	"This method was automatically generated"
	^ SDL_SYSTEM_CURSOR_NWSE_RESIZE
]

{ #category : 'accessing enum' }
S3SDL_SystemCursor class >> pointer [
	"This method was automatically generated"
	^ SDL_SYSTEM_CURSOR_POINTER
]

{ #category : 'accessing enum' }
S3SDL_SystemCursor class >> progress [
	"This method was automatically generated"
	^ SDL_SYSTEM_CURSOR_PROGRESS
]

{ #category : 'accessing enum' }
S3SDL_SystemCursor class >> sResize [
	"This method was automatically generated"
	^ SDL_SYSTEM_CURSOR_S_RESIZE
]

{ #category : 'accessing enum' }
S3SDL_SystemCursor class >> seResize [
	"This method was automatically generated"
	^ SDL_SYSTEM_CURSOR_SE_RESIZE
]

{ #category : 'accessing enum' }
S3SDL_SystemCursor class >> swResize [
	"This method was automatically generated"
	^ SDL_SYSTEM_CURSOR_SW_RESIZE
]

{ #category : 'accessing enum' }
S3SDL_SystemCursor class >> text [
	"This method was automatically generated"
	^ SDL_SYSTEM_CURSOR_TEXT
]

{ #category : 'accessing enum' }
S3SDL_SystemCursor class >> wResize [
	"This method was automatically generated"
	^ SDL_SYSTEM_CURSOR_W_RESIZE
]

{ #category : 'accessing enum' }
S3SDL_SystemCursor class >> wait [
	"This method was automatically generated"
	^ SDL_SYSTEM_CURSOR_WAIT
]
