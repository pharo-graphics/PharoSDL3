Extension { #name : 'SDL3Window' }

{ #category : '*SDL3-Own' }
SDL3Window >> centerBoth [

	self ffiLibrary assertSuccess: (self positionX: 16r2FFF0000 y: 16r2FFF0000)
]

{ #category : '*SDL3-Own' }
SDL3Window >> display [

	^ SDL3Display id: self displayID
]

{ #category : '*SDL3-Own' }
SDL3Window >> displayScale [

	| scale |
	scale := self ffiLibrary getWindowDisplayScale: self.

	"The function returns the display scale, or 0.0f on failure"
	self ffiLibrary assertSuccess: scale > 0.0.

	^ scale
]

{ #category : '*SDL3-Own' }
SDL3Window >> extent [
	"Answer my logical extent"

	| widthValueHolder heightValueHolder |
	widthValueHolder := FFIInt32 newValueHolder.
	heightValueHolder := FFIInt32 newValueHolder.

	self ffiLibrary assertSuccess:
		(self getSizeIntoW: widthValueHolder h: heightValueHolder).

	^ widthValueHolder value @ heightValueHolder value
]

{ #category : '*SDL3-Own' }
SDL3Window >> extent: aPoint [

	self ffiLibrary assertSuccess: (self sizeW: aPoint x h: aPoint y)
]

{ #category : '*SDL3-Own' }
SDL3Window >> hasInputFocus [

	^ self flags anyMask: SDL3WindowFlags inputFocus
]

{ #category : '*SDL3-Own' }
SDL3Window >> height [
	"Answer my logical extent"

	| heightValueHolder |
	heightValueHolder := FFIInt32 newValueHolder.

	self ffiLibrary assertSuccess:
		(self getSizeIntoW: ExternalAddress null h: heightValueHolder).

	^ heightValueHolder value
]

{ #category : '*SDL3-Own' }
SDL3Window >> isAlwaysOnTop [

	^ self flags anyMask: SDL3WindowFlags alwaysOnTop
]

{ #category : '*SDL3-Own' }
SDL3Window >> isBordered [

	^ self isBorderless not
]

{ #category : '*SDL3-Own' }
SDL3Window >> isBorderless [

	^ self flags anyMask: SDL3WindowFlags borderless
]

{ #category : '*SDL3-Own' }
SDL3Window >> isFullscreen [

	^ self flags anyMask: SDL3WindowFlags fullscreen
]

{ #category : '*SDL3-Own' }
SDL3Window >> isHidden [

	^ self flags anyMask: SDL3WindowFlags hidden
]

{ #category : '*SDL3-Own' }
SDL3Window >> isHighPixelDensity [

	^ self flags anyMask: SDL3WindowFlags highPixelDensity
]

{ #category : '*SDL3-Own' }
SDL3Window >> isMaximized [

	^ self flags anyMask: SDL3WindowFlags maximized
]

{ #category : '*SDL3-Own' }
SDL3Window >> isMinimized [

	^ self flags anyMask: SDL3WindowFlags minimized
]

{ #category : '*SDL3-Own' }
SDL3Window >> isModal [

	^ self flags anyMask: SDL3WindowFlags modal
]

{ #category : '*SDL3-Own' }
SDL3Window >> isMouseCaptured [

	^ self flags anyMask: SDL3WindowFlags mouseCapture
]

{ #category : '*SDL3-Own' }
SDL3Window >> isPopupMenu [

	^ self flags anyMask: SDL3WindowFlags popupMenu
]

{ #category : '*SDL3-Own' }
SDL3Window >> isResizable [

	^ self flags anyMask: SDL3WindowFlags resizable
]

{ #category : '*SDL3-Own' }
SDL3Window >> isTooltip [

	^ self flags anyMask: SDL3WindowFlags tooltip
]

{ #category : '*SDL3-Own' }
SDL3Window >> isTransparent [

	^ self flags anyMask: SDL3WindowFlags transparent
]

{ #category : '*SDL3-Own' }
SDL3Window >> isUtility [

	^ self flags anyMask: SDL3WindowFlags utility
]

{ #category : '*SDL3-Own' }
SDL3Window >> newGPURenderer [

	^ self newRendererFor: 'gpu'
]

{ #category : '*SDL3-Own' }
SDL3Window >> newRenderer [

	^ self newRendererFor: nil
]

{ #category : '*SDL3-Own' }
SDL3Window >> pixelDensity [

	| density |
	density := self ffiLibrary getWindowPixelDensity: self.

	"The function returns the display scale, or 0.0f on failure"
	self ffiLibrary assertSuccess: density > 0.0.

	^ density
]

{ #category : '*SDL3-Own' }
SDL3Window >> pixelExtent [
	"Answer my pysical extent"

	| widthValueHolder heightValueHolder |
	widthValueHolder := FFIInt32 newValueHolder.
	heightValueHolder := FFIInt32 newValueHolder.

	self ffiLibrary assertSuccess:
		(self getSizeInPixelsIntoW: widthValueHolder h: heightValueHolder).

	^ widthValueHolder value @ heightValueHolder value
]

{ #category : '*SDL3-Own' }
SDL3Window >> position [

	| widthValueHolder heightValueHolder |
	widthValueHolder := FFIInt32 newValueHolder.
	heightValueHolder := FFIInt32 newValueHolder.

	self ffiLibrary assertSuccess:
		(self getPositionIntoX: widthValueHolder y: heightValueHolder).

	^ widthValueHolder value @ heightValueHolder value
]

{ #category : '*SDL3-Own' }
SDL3Window >> position: aPoint [

	self positionX: aPoint x y: aPoint y
]

{ #category : '*SDL3-Own' }
SDL3Window >> propertyGroup [

	^ SDL3PropertyGroup id: self propertiesID
]

{ #category : '*SDL3-Own' }
SDL3Window class >> unsafeNewPopupParent: parent offsetX: offsetX offsetY: offsetY w: w h: h flags: flags [

	^ (self ffiLibrary
		   newPopupWindowParent: parent
		   offsetX: offsetX
		   offsetY: offsetY
		   w: w
		   h: h
		   flags: flags)
		  assertNotNullReturn;
		  yourself
]

{ #category : '*SDL3-Own' }
SDL3Window class >> unsafeNewTitle: title w: w h: h flags: flags [

	^ (self ffiLibrary
		   newWindowTitle: title
		   w: w
		   h: h
		   flags: flags)
		  assertNotNullReturn;
		  yourself
]

{ #category : '*SDL3-Own' }
SDL3Window class >> unsafeNewWithProperties: props [

	^ (self ffiLibrary newWindowWithProperties: props)
		  assertNotNullReturn;
		  yourself
]

{ #category : '*SDL3-Own' }
SDL3Window >> width [
	"Answer my logical width"

	| widthValueHolder |
	widthValueHolder := FFIInt32 newValueHolder.

	self ffiLibrary assertSuccess:
		(self getSizeIntoW: widthValueHolder h: ExternalAddress null).

	^ widthValueHolder value
]
