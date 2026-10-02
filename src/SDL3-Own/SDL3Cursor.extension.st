Extension { #name : 'SDL3Cursor' }

{ #category : '*SDL3-Own' }
SDL3Cursor >> destroy [

	self ffiLibrary destroyCursor: self
]

{ #category : '*SDL3-Own' }
SDL3Cursor class >> hide [

	self ffiLibrary assertSuccess: self ffiLibrary hideCursor
]

{ #category : '*SDL3-Own' }
SDL3Cursor class >> isVisible [

	^ self ffiLibrary cursorVisible
]

{ #category : '*SDL3-Own' }
SDL3Cursor >> setActive [

	self ffiLibrary assertSuccess: (self ffiLibrary setCursor: self)
]

{ #category : '*SDL3-Own' }
SDL3Cursor class >> show [

	self ffiLibrary assertSuccess: self ffiLibrary showCursor
]

{ #category : '*SDL3-Own' }
SDL3Cursor class >> toggleVisible [

	self isVisible ifTrue: [ self hide ] ifFalse: [ self show ]
]

{ #category : '*SDL3-Own' }
SDL3Cursor class >> unownedNewAnimatedFrames: frames frameCount: frameCount hotX: hotX hotY: hotY [

	^ (self ffiLibrary
		   createAnimatedCursorFrames: frames
		   frameCount: frameCount
		   hotX: hotX
		   hotY: hotY)
		  assertNotNullReturn;
		  yourself
]

{ #category : '*SDL3-Own' }
SDL3Cursor class >> unownedNewColorSurface: surface hotX: hotX hotY: hotY [

	^ (self ffiLibrary
		   createColorCursorSurface: surface
		   hotX: hotX
		   hotY: hotY)
		  assertNotNullReturn;
		  yourself
]

{ #category : '*SDL3-Own' }
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

{ #category : '*SDL3-Own' }
SDL3Cursor class >> unownedNewSystemCursor: aSystemCursor [

	^ (self ffiLibrary createSystemCursor: aSystemCursor)
		  assertNotNullReturn;
		  yourself
]
