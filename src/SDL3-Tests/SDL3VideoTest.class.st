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

	"Ensure video subsystem is initialized"
	self assert: (sdl initSubSystem: SDL3InitFlags video)
]

{ #category : 'tests' }
SDL3VideoTest >> test01ClipboardAPI [

	"Copy&paste a non-ASCII string"
	| mimeTypesCountPointer mimeTypesStringArrayPointer mimeTypesStringArray |
	self assert: (sdl setClipboardText: 'Hëllo').
	self assert: sdl hasClipboardText.
	self assert: sdl getClipboardText equals: 'Hëllo'.

	"Clipboard supports more than text"
	mimeTypesCountPointer := FFIInt64 newBuffer.
	mimeTypesStringArrayPointer := sdl getClipboardMimeTypes: mimeTypesCountPointer.
	mimeTypesStringArray :=
		mimeTypesStringArrayPointer
			arrayOfStringsOfSize: (mimeTypesCountPointer int64AtOffset: 0). 
	sdl free: mimeTypesStringArrayPointer.

	self assert: mimeTypesStringArray equals: #('text/plain;charset=utf-8').
	
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

	self assert: sdl getCursor getHandle equals: cursor getHandle.

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
