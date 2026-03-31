Class {
	#name : 'SDL3VideoTest',
	#superclass : 'SDL3Test',
	#category : 'SDL3-Tests-Library',
	#package : 'SDL3-Tests',
	#tag : 'Library'
}

{ #category : 'running' }
SDL3VideoTest >> setUp [

	super setUp.

	self
		assert: (sdl initSubSystem: SDL3InitFlags video)
		description: 'Initialize video subsystem'
]

{ #category : 'tests' }
SDL3VideoTest >> test01ClipboardAPI [
	"Copy&paste a non-ASCII string"

	| address string |
	self assert: (sdl setClipboardText: 'Hëllo').
	self assert: sdl hasClipboardText.
	
	address := sdl getClipboardText.
	string := address utf8StringFromCString.
	sdl free: address.
	self assert: string equals: 'Hëllo'.

	"Clipboard supports more than text"
	self assert: sdl clipboardMimeTypes equals: #('text/plain;charset=utf-8').

	"Only for X11 and Wayland. 
	See: https://wiki.libsdl.org/SDL3/CategoryClipboard#primary-selection"
	self assert: (sdl hasPrimarySelectionText isKindOf: Boolean).
	self assert: sdl primarySelectionText isString.
	
	"Clear"
	self assert: sdl clearClipboardData.
	self deny: sdl hasClipboardText
]

{ #category : 'tests' }
SDL3VideoTest >> test02CursorAPI [

	| cursorId cursor |
	cursorId := SDL3SystemCursor crosshair.
	cursor := sdl newSystemCursor: cursorId.
	self assert: (sdl setCursor: cursor).

	self assert: sdl getCursor equals: cursor.

	sdl hideCursor.
	self deny: sdl cursorVisible.

	sdl showCursor.
	self assert: sdl cursorVisible.

	sdl destroyCursor: cursor.
	
	cursor := sdl getDefaultCursor.
	self deny: cursor isNull.
	self assert: (sdl setCursor: cursor).
	"You do not have to call SDL_DestroyCursor() on the return value, but it is safe to do so."
	sdl destroyCursor: cursor 
]

{ #category : 'tests' }
SDL3VideoTest >> test03RenderDrivers [

	| driverNames |
	driverNames := sdl renderDrivers.

	self denyEmpty: driverNames.
	self assert: (#(vulkan metal direct3d) includesAnyOf: driverNames)
]

{ #category : 'tests' }
SDL3VideoTest >> test04QueryDisplays [

	self assert: sdl displayIDs size equals: sdl numberOfDisplays
]
