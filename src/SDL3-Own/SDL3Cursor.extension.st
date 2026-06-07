Extension { #name : 'SDL3Cursor' }

{ #category : '*SDL3-Own' }
SDL3Cursor class >> hide [

	self ffiLibrary assertSuccess: self ffiLibrary hideCursor
]

{ #category : '*SDL3-Own' }
SDL3Cursor class >> isVisible [

	^ self ffiLibrary cursorVisible
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
SDL3Cursor class >> unsafeNewAnimatedFrames: frames frameCount: frameCount hotX: hotX hotY: hotY [

	^ (self ffiLibrary
		   newAnimatedCursorFrames: frames
		   frameCount: frameCount
		   hotX: hotX
		   hotY: hotY)
		  assertNotNullReturn;
		  yourself
]

{ #category : '*SDL3-Own' }
SDL3Cursor class >> unsafeNewColorSurface: surface hotX: hotX hotY: hotY [

	^ (self ffiLibrary
		   newColorCursorSurface: surface
		   hotX: hotX
		   hotY: hotY)
		  assertNotNullReturn;
		  yourself
]

{ #category : '*SDL3-Own' }
SDL3Cursor class >> unsafeNewData: data mask: mask w: w h: h hotX: hotX hotY: hotY [

	^ (self ffiLibrary
		   newCursorData: data
		   mask: mask
		   w: w
		   h: h
		   hotX: hotX
		   hotY: hotY)
		  assertNotNullReturn;
		  yourself
]

{ #category : '*SDL3-Own' }
SDL3Cursor class >> unsafeNewSystem: id [

	^ (self ffiLibrary newSystemCursor: id)
		  assertNotNullReturn;
		  yourself
]
