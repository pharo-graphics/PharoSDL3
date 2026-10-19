"
I am a SDL3 FFI binding for `SDL_Window`.

The struct used as an opaque handle to a window.

See: https://wiki.libsdl.org/SDL3/SDL_Window
"
Class {
	#name : 'SDL3Window',
	#superclass : 'SDL3BaseObject',
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'instance creation' }
SDL3Window class >> unownedNewPopupParent: parent offsetX: offsetX offsetY: offsetY width: width height: height flags: flags [

	^ (self ffiLibrary
		   createPopupWindowParent: parent
		   offsetX: offsetX
		   offsetY: offsetY
		   w: width
		   h: height
		   flags: flags)
		  assertNotNullReturn;
		  yourself
]

{ #category : 'instance creation' }
SDL3Window class >> unownedNewTitle: title width: width height: height flags: flags [

	^ (self ffiLibrary
		   createWindowTitle: title
		   w: width
		   h: height
		   flags: flags)
		  assertNotNullReturn;
		  yourself
]

{ #category : 'instance creation' }
SDL3Window class >> unownedNewWithProperties: props [

	^ (self ffiLibrary createWindowWithProperties: props)
		  assertNotNullReturn;
		  yourself
]

{ #category : 'accessing' }
SDL3Window >> alwaysOnTop: aBoolean [

	self ffiLibrary assertSuccess:
		(self ffiLibrary setWindowAlwaysOnTopWindow: self onTop: aBoolean)
]

{ #category : 'accessing' }
SDL3Window >> aspectRatioMin: minAspect max: maxAspect [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			setWindowAspectRatioWindow: self
			minAspect: minAspect
			maxAspect: maxAspect)
]

{ #category : 'accessing' }
SDL3Window >> bordered: bordered [

	self ffiLibrary assertSuccess:
		(self ffiLibrary setWindowBorderedWindow: self bordered: bordered)
]

{ #category : 'operations' }
SDL3Window >> centerBoth [

	self ffiLibrary assertSuccess: (self positionX: 16r2FFF0000 y: 16r2FFF0000)
]

{ #category : 'operations' }
SDL3Window >> clearComposition [

	self ffiLibrary assertSuccess: (self ffiLibrary clearComposition: self)
]

{ #category : 'finalization' }
SDL3Window >> destroy [

	self ffiLibrary destroyWindow: self
]

{ #category : 'operations' }
SDL3Window >> destroySurface [

	self ffiLibrary assertSuccess: (self ffiLibrary destroyWindowSurface: self)
]

{ #category : 'accessing' }
SDL3Window >> display [

	^ SDL3Display id: self displayID
]

{ #category : 'accessing' }
SDL3Window >> displayID [

	| id |
	"Returns the instance ID of the display containing the center of
	the window on success or 0 on failure; call SDL_GetError() for more information."
	id := self ffiLibrary getDisplayForWindow: self.

	self ffiLibrary assertSuccess: id > 0.

	^ id
]

{ #category : 'accessing' }
SDL3Window >> displayScale [

	| scale |
	scale := self ffiLibrary getWindowDisplayScale: self.

	"The function returns the display scale, or 0.0f on failure"
	self ffiLibrary assertSuccess: scale > 0.0.

	^ scale
]

{ #category : 'accessing' }
SDL3Window >> eglSurface [

	^ (self ffiLibrary eglGetWindowSurface: self)
		  assertNotNullReturn;
		  yourself
]

{ #category : 'accessing' }
SDL3Window >> extent [
	"Answer my logical extent"

	| widthValueHolder heightValueHolder |
	widthValueHolder := FFIInt32 newValueHolder.
	heightValueHolder := FFIInt32 newValueHolder.

	self ffiLibrary assertSuccess:
		(self getSizeIntoW: widthValueHolder h: heightValueHolder).

	^ widthValueHolder value @ heightValueHolder value
]

{ #category : 'accessing' }
SDL3Window >> extent: aPoint [

	self sizeW: aPoint x h: aPoint y
]

{ #category : 'accessing' }
SDL3Window >> flags [

	^ self ffiLibrary getWindowFlags: self
]

{ #category : 'operations' }
SDL3Window >> flashWithOperation: operation [

	self ffiLibrary assertSuccess:
		(self ffiLibrary flashWindow: self operation: operation)
]

{ #category : 'accessing' }
SDL3Window >> focusable: focusable [

	self ffiLibrary assertSuccess:
		(self ffiLibrary setWindowFocusableWindow: self focusable: focusable)
]

{ #category : 'accessing' }
SDL3Window >> fullscreen: fullscreen [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			setWindowFullscreenWindow: self
			fullscreen: fullscreen)
]

{ #category : 'accessing' }
SDL3Window >> fullscreenMode [

	^ self ffiLibrary getWindowFullscreenMode: self
]

{ #category : 'accessing' }
SDL3Window >> fullscreenMode: mode [

	self ffiLibrary assertSuccess:
		(self ffiLibrary setWindowFullscreenModeWindow: self mode: mode)
]

{ #category : 'accessing' }
SDL3Window >> getAspectRatioIntoMinAspect: minAspect maxAspect: maxAspect [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			getWindowAspectRatioWindow: self
			minAspect: minAspect
			maxAspect: maxAspect)
]

{ #category : 'accessing' }
SDL3Window >> getBordersSizeIntoTop: top left: left bottom: bottom right: right [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			getWindowBordersSizeWindow: self
			top: top
			left: left
			bottom: bottom
			right: right)
]

{ #category : 'accessing' }
SDL3Window >> getICCProfileIntoSize: size [

	^ self ffiLibrary getWindowICCProfileWindow: self size: size
]

{ #category : 'accessing' }
SDL3Window >> getMaximumSizeIntoW: w h: h [

	self ffiLibrary assertSuccess:
		(self ffiLibrary getWindowMaximumSizeWindow: self w: w h: h)
]

{ #category : 'accessing' }
SDL3Window >> getMinimumSizeIntoW: w h: h [

	self ffiLibrary assertSuccess:
		(self ffiLibrary getWindowMinimumSizeWindow: self w: w h: h)
]

{ #category : 'accessing' }
SDL3Window >> getPositionIntoX: x y: y [

	self ffiLibrary assertSuccess:
		(self ffiLibrary getWindowPositionWindow: self x: x y: y)
]

{ #category : 'accessing' }
SDL3Window >> getSafeAreaIntoRect: rect [

	self ffiLibrary assertSuccess:
		(self ffiLibrary getWindowSafeAreaWindow: self rect: rect)
]

{ #category : 'accessing' }
SDL3Window >> getSizeInPixelsIntoW: w h: h [

	self ffiLibrary assertSuccess:
		(self ffiLibrary getWindowSizeInPixelsWindow: self w: w h: h)
]

{ #category : 'accessing' }
SDL3Window >> getSizeIntoW: w h: h [

	self ffiLibrary assertSuccess:
		(self ffiLibrary getWindowSizeWindow: self w: w h: h)
]

{ #category : 'accessing' }
SDL3Window >> getSurfaceVSyncInto: vsync [

	self ffiLibrary assertSuccess:
		(self ffiLibrary getWindowSurfaceVSyncWindow: self vsync: vsync)
]

{ #category : 'accessing' }
SDL3Window >> getTextInputAreaIntoRect: rect cursor: cursor [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			getTextInputAreaWindow: self
			rect: rect
			cursor: cursor)
]

{ #category : 'operations' }
SDL3Window >> glMakeCurrentContext: context [

	self ffiLibrary assertSuccess:
		(self ffiLibrary glMakeCurrentWindow: self context: context)
]

{ #category : 'operations' }
SDL3Window >> glSwap [

	self ffiLibrary assertSuccess: (self ffiLibrary glSwapWindow: self)
]

{ #category : 'testing' }
SDL3Window >> hasInputFocus [

	^ self flags anyMask: SDL3WindowFlags inputFocus
]

{ #category : 'testing' }
SDL3Window >> hasSurface [

	^ self ffiLibrary windowHasSurface: self
]

{ #category : 'accessing' }
SDL3Window >> height [
	"Answer my logical extent"

	| heightValueHolder |
	heightValueHolder := FFIInt32 newValueHolder.

	self ffiLibrary assertSuccess:
		(self getSizeIntoW: ExternalAddress null h: heightValueHolder).

	^ heightValueHolder value
]

{ #category : 'operations' }
SDL3Window >> hide [

	self ffiLibrary assertSuccess: (self ffiLibrary hideWindow: self)
]

{ #category : 'accessing' }
SDL3Window >> hitTestCallback: callback callbackData: callbackData [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			setWindowHitTestWindow: self
			callback: callback
			callbackData: callbackData)
]

{ #category : 'accessing' }
SDL3Window >> icon: icon [

	self ffiLibrary assertSuccess:
		(self ffiLibrary setWindowIconWindow: self icon: icon)
]

{ #category : 'accessing' }
SDL3Window >> id [

	^ self ffiLibrary getWindowID: self
]

{ #category : 'testing' }
SDL3Window >> isAlwaysOnTop [

	^ self flags anyMask: SDL3WindowFlags alwaysOnTop
]

{ #category : 'testing' }
SDL3Window >> isBordered [

	^ self isBorderless not
]

{ #category : 'testing' }
SDL3Window >> isBorderless [

	^ self flags anyMask: SDL3WindowFlags borderless
]

{ #category : 'testing' }
SDL3Window >> isFullscreen [

	^ self flags anyMask: SDL3WindowFlags fullscreen
]

{ #category : 'testing' }
SDL3Window >> isHidden [

	^ self flags anyMask: SDL3WindowFlags hidden
]

{ #category : 'testing' }
SDL3Window >> isHighPixelDensity [

	^ self flags anyMask: SDL3WindowFlags highPixelDensity
]

{ #category : 'testing' }
SDL3Window >> isKeyboardGrabbed [

	^ self ffiLibrary getWindowKeyboardGrab: self
]

{ #category : 'testing' }
SDL3Window >> isMaximized [

	^ self flags anyMask: SDL3WindowFlags maximized
]

{ #category : 'testing' }
SDL3Window >> isMinimized [

	^ self flags anyMask: SDL3WindowFlags minimized
]

{ #category : 'testing' }
SDL3Window >> isModal [

	^ self flags anyMask: SDL3WindowFlags modal
]

{ #category : 'testing' }
SDL3Window >> isMouseCaptured [

	^ self flags anyMask: SDL3WindowFlags mouseCapture
]

{ #category : 'testing' }
SDL3Window >> isMouseGrabbed [

	^ self ffiLibrary getWindowMouseGrab: self
]

{ #category : 'testing' }
SDL3Window >> isOccluded [

	^ self flags anyMask: SDL3WindowFlags occluded
]

{ #category : 'testing' }
SDL3Window >> isPopupMenu [

	^ self flags anyMask: SDL3WindowFlags popupMenu
]

{ #category : 'testing' }
SDL3Window >> isRelativeMouseMode [

	^ self ffiLibrary getWindowRelativeMouseMode: self
]

{ #category : 'testing' }
SDL3Window >> isResizable [

	^ self flags anyMask: SDL3WindowFlags resizable
]

{ #category : 'testing' }
SDL3Window >> isScreenKeyboardShown [

	^ self ffiLibrary screenKeyboardShown: self
]

{ #category : 'testing' }
SDL3Window >> isTextInputActive [

	^ self ffiLibrary textInputActive: self
]

{ #category : 'testing' }
SDL3Window >> isTooltip [

	^ self flags anyMask: SDL3WindowFlags tooltip
]

{ #category : 'testing' }
SDL3Window >> isTransparent [

	^ self flags anyMask: SDL3WindowFlags transparent
]

{ #category : 'testing' }
SDL3Window >> isUtility [

	^ self flags anyMask: SDL3WindowFlags utility
]

{ #category : 'accessing' }
SDL3Window >> keyboardGrabbed: grabbed [

	self ffiLibrary assertSuccess:
		(self ffiLibrary setWindowKeyboardGrabWindow: self grabbed: grabbed)
]

{ #category : 'operations' }
SDL3Window >> maximize [

	self ffiLibrary assertSuccess: (self ffiLibrary maximizeWindow: self)
]

{ #category : 'accessing' }
SDL3Window >> maximumSizeMaxW: maxW maxH: maxH [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			setWindowMaximumSizeWindow: self
			maxW: maxW
			maxH: maxH)
]

{ #category : 'operations' }
SDL3Window >> minimize [

	self ffiLibrary assertSuccess: (self ffiLibrary minimizeWindow: self)
]

{ #category : 'accessing' }
SDL3Window >> minimumSizeMinW: minW minH: minH [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			setWindowMinimumSizeWindow: self
			minW: minW
			minH: minH)
]

{ #category : 'accessing' }
SDL3Window >> modal: modal [

	self ffiLibrary assertSuccess:
		(self ffiLibrary setWindowModalWindow: self modal: modal)
]

{ #category : 'accessing' }
SDL3Window >> mouseGrabbed: grabbed [

	self ffiLibrary assertSuccess:
		(self ffiLibrary setWindowMouseGrabWindow: self grabbed: grabbed)
]

{ #category : 'accessing' }
SDL3Window >> mouseRect [

	^ self ffiLibrary getWindowMouseRect: self
]

{ #category : 'accessing' }
SDL3Window >> mouseRect: rect [

	self ffiLibrary assertSuccess:
		(self ffiLibrary setWindowMouseRectWindow: self rect: rect)
]

{ #category : 'accessing' }
SDL3Window >> opacity [

	^ self ffiLibrary getWindowOpacity: self
]

{ #category : 'accessing' }
SDL3Window >> opacity: opacity [

	self ffiLibrary assertSuccess:
		(self ffiLibrary setWindowOpacityWindow: self opacity: opacity)
]

{ #category : 'accessing' }
SDL3Window >> parent: parent [

	self ffiLibrary assertSuccess:
		(self ffiLibrary setWindowParentWindow: self parent: parent)
]

{ #category : 'accessing' }
SDL3Window >> parentIfPresent: presentBlock ifAbsent: absentBlock [

	| result |
	result := self ffiLibrary getWindowParent: self.
	^ result isNull
		ifTrue: [ absentBlock value ]
		ifFalse: [ presentBlock value: result ]
]

{ #category : 'accessing' }
SDL3Window >> parentOrNil [

	^ self parentIfPresent: [ :p | p ] ifAbsent: [ nil ]
]

{ #category : 'accessing' }
SDL3Window >> pixelDensity [

	| density |
	density := self ffiLibrary getWindowPixelDensity: self.

	"The function returns the display scale, or 0.0f on failure"
	self ffiLibrary assertSuccess: density > 0.0.

	^ density
]

{ #category : 'accessing' }
SDL3Window >> pixelExtent [
	"Answer my pysical extent"

	| widthValueHolder heightValueHolder |
	widthValueHolder := FFIInt32 newValueHolder.
	heightValueHolder := FFIInt32 newValueHolder.

	self ffiLibrary assertSuccess:
		(self getSizeInPixelsIntoW: widthValueHolder h: heightValueHolder).

	^ widthValueHolder value @ heightValueHolder value
]

{ #category : 'accessing' }
SDL3Window >> pixelFormat [

	^ self ffiLibrary getWindowPixelFormat: self
]

{ #category : 'accessing' }
SDL3Window >> position [

	| widthValueHolder heightValueHolder |
	widthValueHolder := FFIInt32 newValueHolder.
	heightValueHolder := FFIInt32 newValueHolder.

	self ffiLibrary assertSuccess:
		(self getPositionIntoX: widthValueHolder y: heightValueHolder).

	^ widthValueHolder value @ heightValueHolder value
]

{ #category : 'accessing' }
SDL3Window >> position: aPoint [

	self positionX: aPoint x y: aPoint y
]

{ #category : 'accessing' }
SDL3Window >> positionX: x y: y [

	self ffiLibrary assertSuccess:
		(self ffiLibrary setWindowPositionWindow: self x: x y: y)
]

{ #category : 'accessing' }
SDL3Window >> progressState [

	^ self ffiLibrary getWindowProgressState: self
]

{ #category : 'accessing' }
SDL3Window >> progressState: state [

	self ffiLibrary assertSuccess:
		(self ffiLibrary setWindowProgressStateWindow: self state: state)
]

{ #category : 'accessing' }
SDL3Window >> progressValue [

	^ self ffiLibrary getWindowProgressValue: self
]

{ #category : 'accessing' }
SDL3Window >> progressValue: value [

	self ffiLibrary assertSuccess:
		(self ffiLibrary setWindowProgressValueWindow: self value: value)
]

{ #category : 'accessing' }
SDL3Window >> propertiesID [

	^ self ffiLibrary getWindowProperties: self
]

{ #category : 'accessing' }
SDL3Window >> propertyGroup [

	^ SDL3PropertyGroup id: self propertiesID
]

{ #category : 'operations' }
SDL3Window >> raise [

	self ffiLibrary assertSuccess: (self ffiLibrary raiseWindow: self)
]

{ #category : 'accessing' }
SDL3Window >> relativeMouseModeEnabled: enabled [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			setWindowRelativeMouseModeWindow: self
			enabled: enabled)
]

{ #category : 'accessing' }
SDL3Window >> renderer [

	^ (self ffiLibrary getRenderer: self)
		  assertNotNullReturn;
		  yourself
]

{ #category : 'accessing' }
SDL3Window >> resizable: resizable [

	self ffiLibrary assertSuccess:
		(self ffiLibrary setWindowResizableWindow: self resizable: resizable)
]

{ #category : 'operations' }
SDL3Window >> restore [

	self ffiLibrary assertSuccess: (self ffiLibrary restoreWindow: self)
]

{ #category : 'accessing' }
SDL3Window >> setiOSAnimationCallbackInterval: interval callback: callback callbackParam: callbackParam [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			setiOSAnimationCallbackWindow: self
			interval: interval
			callback: callback
			callbackParam: callbackParam)
]

{ #category : 'accessing' }
SDL3Window >> shape: shape [

	self ffiLibrary assertSuccess:
		(self ffiLibrary setWindowShapeWindow: self shape: shape)
]

{ #category : 'operations' }
SDL3Window >> show [

	self ffiLibrary assertSuccess: (self ffiLibrary showWindow: self)
]

{ #category : 'operations' }
SDL3Window >> showSystemMenuX: x y: y [

	self ffiLibrary assertSuccess:
		(self ffiLibrary showWindowSystemMenuWindow: self x: x y: y)
]

{ #category : 'accessing' }
SDL3Window >> sizeW: w h: h [

	self ffiLibrary assertSuccess:
		(self ffiLibrary setWindowSizeWindow: self w: w h: h)
]

{ #category : 'operations' }
SDL3Window >> startTextInput [

	self ffiLibrary assertSuccess: (self ffiLibrary startTextInput: self)
]

{ #category : 'operations' }
SDL3Window >> startTextInputWithPropertiesProps: props [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			startTextInputWithPropertiesWindow: self
			props: props)
]

{ #category : 'operations' }
SDL3Window >> stopTextInput [

	self ffiLibrary assertSuccess: (self ffiLibrary stopTextInput: self)
]

{ #category : 'accessing' }
SDL3Window >> surface [

	^ (self ffiLibrary getWindowSurface: self)
		  assertNotNullReturn;
		  yourself
]

{ #category : 'accessing' }
SDL3Window >> surfaceVsync: vsync [

	self ffiLibrary assertSuccess:
		(self ffiLibrary setWindowSurfaceVSyncWindow: self vsync: vsync)
]

{ #category : 'operations' }
SDL3Window >> sync [

	self ffiLibrary assertSuccess: (self ffiLibrary syncWindow: self)
]

{ #category : 'accessing' }
SDL3Window >> textInputAreaRect: rect cursor: cursor [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			setTextInputAreaWindow: self
			rect: rect
			cursor: cursor)
]

{ #category : 'accessing' }
SDL3Window >> title [

	^ self ffiLibrary getWindowTitle: self
]

{ #category : 'accessing' }
SDL3Window >> title: title [

	self ffiLibrary assertSuccess:
		(self ffiLibrary setWindowTitleWindow: self title: title)
]

{ #category : 'instance creation' }
SDL3Window >> unownedNewGLContext [

	^ (self ffiLibrary glCreateContext: self)
		  assertNotNullReturn;
		  yourself
]

{ #category : 'instance creation' }
SDL3Window >> unownedNewGPURenderer [

	^ self unownedNewRenderer: 'gpu'
]

{ #category : 'instance creation' }
SDL3Window >> unownedNewMetalView [

	^ self ffiLibrary metalCreateView: self
]

{ #category : 'instance creation' }
SDL3Window >> unownedNewPopupParentOffsetX: offsetX offsetY: offsetY width: width height: height flags: flags [

	^ (self ffiLibrary
		   createPopupWindowParent: self
		   offsetX: offsetX
		   offsetY: offsetY
		   w: width
		   h: height
		   flags: flags)
		  assertNotNullReturn;
		  yourself
]

{ #category : 'instance creation' }
SDL3Window >> unownedNewRenderer [

	^ self unownedNewRenderer: nil
]

{ #category : 'instance creation' }
SDL3Window >> unownedNewRenderer: name [

	^ (self ffiLibrary createRendererWindow: self name: name)
		  assertNotNullReturn;
		  yourself
]

{ #category : 'operations' }
SDL3Window >> updateSurface [

	self ffiLibrary assertSuccess: (self ffiLibrary updateWindowSurface: self)
]

{ #category : 'operations' }
SDL3Window >> updateSurfaceRects: rects numrects: numrects [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			updateWindowSurfaceRectsWindow: self
			rects: rects
			numrects: numrects)
]

{ #category : 'operations' }
SDL3Window >> warpMouseInX: x y: y [

	self ffiLibrary warpMouseInWindow: self x: x y: y
]

{ #category : 'accessing' }
SDL3Window >> width [
	"Answer my logical width"

	| widthValueHolder |
	widthValueHolder := FFIInt32 newValueHolder.

	self ffiLibrary assertSuccess:
		(self getSizeIntoW: widthValueHolder h: ExternalAddress null).

	^ widthValueHolder value
]
