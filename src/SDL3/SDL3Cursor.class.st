"
I am a SDL3 FFI binding for `SDL_Cursor`.

The structure used to identify an SDL cursor.

See: https://wiki.libsdl.org/SDL3/SDL_Cursor
"
Class {
	#name : 'SDL3Cursor',
	#superclass : 'SDL3BaseObject',
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'operations' }
SDL3Cursor class >> hide [

	self ffiLibrary assertSuccess: self ffiLibrary hideCursor
]

{ #category : 'testing' }
SDL3Cursor class >> isVisible [

	^ self ffiLibrary cursorVisible
]

{ #category : 'operations' }
SDL3Cursor class >> show [

	self ffiLibrary assertSuccess: self ffiLibrary showCursor
]

{ #category : 'operations' }
SDL3Cursor class >> toggleVisible [

	self isVisible ifTrue: [ self hide ] ifFalse: [ self show ]
]

{ #category : 'instance creation' }
SDL3Cursor class >> unownedNewAnimatedFrames: frames frameCount: frameCount hotX: hotX hotY: hotY [

	^ (self ffiLibrary
		   createAnimatedCursorFrames: frames
		   frameCount: frameCount
		   hotX: hotX
		   hotY: hotY)
		  assertNotNullReturn;
		  yourself
]

{ #category : 'instance creation' }
SDL3Cursor class >> unownedNewColorSurface: surface hotX: hotX hotY: hotY [

	^ (self ffiLibrary
		   createColorCursorSurface: surface
		   hotX: hotX
		   hotY: hotY)
		  assertNotNullReturn;
		  yourself
]

{ #category : 'instance creation' }
SDL3Cursor class >> unownedNewData: data mask: mask width: width height: height hotX: hotX hotY: hotY [

	^ (self ffiLibrary
		   createCursorData: data
		   mask: mask
		   w: width
		   h: height
		   hotX: hotX
		   hotY: hotY)
		  assertNotNullReturn;
		  yourself
]

{ #category : 'instance creation' }
SDL3Cursor class >> unownedNewSystemCursor: aSystemCursor [

	^ (self ffiLibrary createSystemCursor: aSystemCursor)
		  assertNotNullReturn;
		  yourself
]

{ #category : 'finalization' }
SDL3Cursor >> destroy [

	self ffiLibrary destroyCursor: self
]

{ #category : 'operations' }
SDL3Cursor >> setActive [

	self ffiLibrary assertSuccess: (self ffiLibrary setCursor: self)
]
