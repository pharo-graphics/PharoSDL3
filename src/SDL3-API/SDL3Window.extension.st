Extension { #name : 'SDL3Window' }

{ #category : '*SDL3-API' }
SDL3Window >> alwaysOnTopOnTop: onTop [

	self ffiLibrary assertSuccess:
		(self ffiLibrary setWindowAlwaysOnTopWindow: self onTop: onTop)
]

{ #category : '*SDL3-API' }
SDL3Window >> aspectRatioMinAspect: minAspect maxAspect: maxAspect [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			setWindowAspectRatioWindow: self
			minAspect: minAspect
			maxAspect: maxAspect)
]

{ #category : '*SDL3-API' }
SDL3Window >> bordered: bordered [

	self ffiLibrary assertSuccess:
		(self ffiLibrary setWindowBorderedWindow: self bordered: bordered)
]

{ #category : '*SDL3-API' }
SDL3Window >> clearComposition [

	self ffiLibrary assertSuccess: (self ffiLibrary clearComposition: self)
]

{ #category : '*SDL3-API' }
SDL3Window >> destroy [

	self ffiLibrary destroyWindow: self
]

{ #category : '*SDL3-API' }
SDL3Window >> destroySurface [

	self ffiLibrary assertSuccess: (self ffiLibrary destroyWindowSurface: self)
]

{ #category : '*SDL3-API' }
SDL3Window >> displayID [

	^ self ffiLibrary getDisplayForWindow: self
]

{ #category : '*SDL3-API' }
SDL3Window >> eglSurface [

	^ (self ffiLibrary eglGetWindowSurface: self)
		  assertNotNullReturn;
		  yourself
]

{ #category : '*SDL3-API' }
SDL3Window >> fillDocumentSpace: fill [

	self ffiLibrary assertSuccess:
		(self ffiLibrary setWindowFillDocumentWindow: self fill: fill)
]

{ #category : '*SDL3-API' }
SDL3Window >> flags [

	^ self ffiLibrary getWindowFlags: self
]

{ #category : '*SDL3-API' }
SDL3Window >> flashWithOperation: operation [

	self ffiLibrary assertSuccess:
		(self ffiLibrary flashWindow: self operation: operation)
]

{ #category : '*SDL3-API' }
SDL3Window >> focusable: focusable [

	self ffiLibrary assertSuccess:
		(self ffiLibrary setWindowFocusableWindow: self focusable: focusable)
]

{ #category : '*SDL3-API' }
SDL3Window >> fullscreen: fullscreen [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			setWindowFullscreenWindow: self
			fullscreen: fullscreen)
]

{ #category : '*SDL3-API' }
SDL3Window >> fullscreenMode [

	^ self ffiLibrary getWindowFullscreenMode: self
]

{ #category : '*SDL3-API' }
SDL3Window >> fullscreenMode: mode [

	self ffiLibrary assertSuccess:
		(self ffiLibrary setWindowFullscreenModeWindow: self mode: mode)
]

{ #category : '*SDL3-API' }
SDL3Window >> getAspectRatioIntoMinAspect: minAspect maxAspect: maxAspect [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			getWindowAspectRatioWindow: self
			minAspect: minAspect
			maxAspect: maxAspect)
]

{ #category : '*SDL3-API' }
SDL3Window >> getBordersSizeIntoTop: top left: left bottom: bottom right: right [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			getWindowBordersSizeWindow: self
			top: top
			left: left
			bottom: bottom
			right: right)
]

{ #category : '*SDL3-API' }
SDL3Window >> getICCProfileIntoSize: size [

	^ self ffiLibrary getWindowICCProfileWindow: self size: size
]

{ #category : '*SDL3-API' }
SDL3Window >> getMaximumSizeIntoW: w h: h [

	self ffiLibrary assertSuccess:
		(self ffiLibrary getWindowMaximumSizeWindow: self w: w h: h)
]

{ #category : '*SDL3-API' }
SDL3Window >> getMinimumSizeIntoW: w h: h [

	self ffiLibrary assertSuccess:
		(self ffiLibrary getWindowMinimumSizeWindow: self w: w h: h)
]

{ #category : '*SDL3-API' }
SDL3Window >> getPositionIntoX: x y: y [

	self ffiLibrary assertSuccess:
		(self ffiLibrary getWindowPositionWindow: self x: x y: y)
]

{ #category : '*SDL3-API' }
SDL3Window >> getSafeAreaIntoRect: rect [

	self ffiLibrary assertSuccess:
		(self ffiLibrary getWindowSafeAreaWindow: self rect: rect)
]

{ #category : '*SDL3-API' }
SDL3Window >> getSizeInPixelsIntoW: w h: h [

	self ffiLibrary assertSuccess:
		(self ffiLibrary getWindowSizeInPixelsWindow: self w: w h: h)
]

{ #category : '*SDL3-API' }
SDL3Window >> getSizeIntoW: w h: h [

	self ffiLibrary assertSuccess:
		(self ffiLibrary getWindowSizeWindow: self w: w h: h)
]

{ #category : '*SDL3-API' }
SDL3Window >> getSurfaceVSyncInto: vsync [

	self ffiLibrary assertSuccess:
		(self ffiLibrary getWindowSurfaceVSyncWindow: self vsync: vsync)
]

{ #category : '*SDL3-API' }
SDL3Window >> getTextInputAreaIntoRect: rect cursor: cursor [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			getTextInputAreaWindow: self
			rect: rect
			cursor: cursor)
]

{ #category : '*SDL3-API' }
SDL3Window >> glMakeCurrentContext: context [

	self ffiLibrary assertSuccess:
		(self ffiLibrary glMakeCurrentWindow: self context: context)
]

{ #category : '*SDL3-API' }
SDL3Window >> glNewContext [

	^ (self ffiLibrary glCreateContext: self)
		  assertNotNullReturn;
		  yourself
]

{ #category : '*SDL3-API' }
SDL3Window >> glSwap [

	self ffiLibrary assertSuccess: (self ffiLibrary glSwapWindow: self)
]

{ #category : '*SDL3-API' }
SDL3Window >> hasSurface [

	^ self ffiLibrary windowHasSurface: self
]

{ #category : '*SDL3-API' }
SDL3Window >> hide [

	self ffiLibrary assertSuccess: (self ffiLibrary hideWindow: self)
]

{ #category : '*SDL3-API' }
SDL3Window >> hitTestCallback: callback callbackData: callbackData [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			setWindowHitTestWindow: self
			callback: callback
			callbackData: callbackData)
]

{ #category : '*SDL3-API' }
SDL3Window >> icon: icon [

	self ffiLibrary assertSuccess:
		(self ffiLibrary setWindowIconWindow: self icon: icon)
]

{ #category : '*SDL3-API' }
SDL3Window >> id [

	^ self ffiLibrary getWindowID: self
]

{ #category : '*SDL3-API' }
SDL3Window >> isKeyboardGrabbed [

	^ self ffiLibrary getWindowKeyboardGrab: self
]

{ #category : '*SDL3-API' }
SDL3Window >> isMouseGrabbed [

	^ self ffiLibrary getWindowMouseGrab: self
]

{ #category : '*SDL3-API' }
SDL3Window >> isRelativeMouseMode [

	^ self ffiLibrary getWindowRelativeMouseMode: self
]

{ #category : '*SDL3-API' }
SDL3Window >> isScreenKeyboardShown [

	^ self ffiLibrary screenKeyboardShown: self
]

{ #category : '*SDL3-API' }
SDL3Window >> isTextInputActive [

	^ self ffiLibrary textInputActive: self
]

{ #category : '*SDL3-API' }
SDL3Window >> keyboardGrabbed: grabbed [

	self ffiLibrary assertSuccess:
		(self ffiLibrary setWindowKeyboardGrabWindow: self grabbed: grabbed)
]

{ #category : '*SDL3-API' }
SDL3Window >> maximize [

	self ffiLibrary assertSuccess: (self ffiLibrary maximizeWindow: self)
]

{ #category : '*SDL3-API' }
SDL3Window >> maximumSizeMaxW: maxW maxH: maxH [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			setWindowMaximumSizeWindow: self
			maxW: maxW
			maxH: maxH)
]

{ #category : '*SDL3-API' }
SDL3Window >> metalCreateView [

	^ self ffiLibrary metalCreateView: self
]

{ #category : '*SDL3-API' }
SDL3Window >> minimize [

	self ffiLibrary assertSuccess: (self ffiLibrary minimizeWindow: self)
]

{ #category : '*SDL3-API' }
SDL3Window >> minimumSizeMinW: minW minH: minH [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			setWindowMinimumSizeWindow: self
			minW: minW
			minH: minH)
]

{ #category : '*SDL3-API' }
SDL3Window >> modal: modal [

	self ffiLibrary assertSuccess:
		(self ffiLibrary setWindowModalWindow: self modal: modal)
]

{ #category : '*SDL3-API' }
SDL3Window >> mouseGrabbed: grabbed [

	self ffiLibrary assertSuccess:
		(self ffiLibrary setWindowMouseGrabWindow: self grabbed: grabbed)
]

{ #category : '*SDL3-API' }
SDL3Window >> mouseRect [

	^ self ffiLibrary getWindowMouseRect: self
]

{ #category : '*SDL3-API' }
SDL3Window >> mouseRect: rect [

	self ffiLibrary assertSuccess:
		(self ffiLibrary setWindowMouseRectWindow: self rect: rect)
]

{ #category : '*SDL3-API' }
SDL3Window >> newPopupParentOffsetX: offsetX offsetY: offsetY w: w h: h flags: flags [

	^ (self ffiLibrary
		   newPopupWindowParent: self
		   offsetX: offsetX
		   offsetY: offsetY
		   w: w
		   h: h
		   flags: flags)
		  assertNotNullReturn;
		  yourself
]

{ #category : '*SDL3-API' }
SDL3Window >> newRendererFor: name [

	^ (self ffiLibrary newRendererWindow: self name: name)
		  assertNotNullReturn;
		  yourself
]

{ #category : '*SDL3-API' }
SDL3Window >> opacity [

	^ self ffiLibrary getWindowOpacity: self
]

{ #category : '*SDL3-API' }
SDL3Window >> opacity: opacity [

	self ffiLibrary assertSuccess:
		(self ffiLibrary setWindowOpacityWindow: self opacity: opacity)
]

{ #category : '*SDL3-API' }
SDL3Window >> parent: parent [

	self ffiLibrary assertSuccess:
		(self ffiLibrary setWindowParentWindow: self parent: parent)
]

{ #category : '*SDL3-API' }
SDL3Window >> parentIfPresent: presentBlock ifAbsent: absentBlock [

	| result |
	result := self ffiLibrary getWindowParent: self.
	^ result isNull
		ifTrue: [ absentBlock value ]
		ifFalse: [ presentBlock value: result ]
]

{ #category : '*SDL3-API' }
SDL3Window >> parentOrNil [

	^ self parentIfPresent: [ :p | p ] ifAbsent: [ nil ]
]

{ #category : '*SDL3-API' }
SDL3Window >> pixelFormat [

	^ self ffiLibrary getWindowPixelFormat: self
]

{ #category : '*SDL3-API' }
SDL3Window >> positionX: x y: y [

	self ffiLibrary assertSuccess:
		(self ffiLibrary setWindowPositionWindow: self x: x y: y)
]

{ #category : '*SDL3-API' }
SDL3Window >> progressState [

	^ self ffiLibrary getWindowProgressState: self
]

{ #category : '*SDL3-API' }
SDL3Window >> progressState: state [

	self ffiLibrary assertSuccess:
		(self ffiLibrary setWindowProgressStateWindow: self state: state)
]

{ #category : '*SDL3-API' }
SDL3Window >> progressValue [

	^ self ffiLibrary getWindowProgressValue: self
]

{ #category : '*SDL3-API' }
SDL3Window >> progressValue: value [

	self ffiLibrary assertSuccess:
		(self ffiLibrary setWindowProgressValueWindow: self value: value)
]

{ #category : '*SDL3-API' }
SDL3Window >> propertiesID [

	^ self ffiLibrary getWindowProperties: self
]

{ #category : '*SDL3-API' }
SDL3Window >> raise [

	self ffiLibrary assertSuccess: (self ffiLibrary raiseWindow: self)
]

{ #category : '*SDL3-API' }
SDL3Window >> relativeMouseModeEnabled: enabled [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			setWindowRelativeMouseModeWindow: self
			enabled: enabled)
]

{ #category : '*SDL3-API' }
SDL3Window >> renderer [

	^ (self ffiLibrary getRenderer: self)
		  assertNotNullReturn;
		  yourself
]

{ #category : '*SDL3-API' }
SDL3Window >> resizable: resizable [

	self ffiLibrary assertSuccess:
		(self ffiLibrary setWindowResizableWindow: self resizable: resizable)
]

{ #category : '*SDL3-API' }
SDL3Window >> restore [

	self ffiLibrary assertSuccess: (self ffiLibrary restoreWindow: self)
]

{ #category : '*SDL3-API' }
SDL3Window >> setiOSAnimationCallbackInterval: interval callback: callback callbackParam: callbackParam [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			setiOSAnimationCallbackWindow: self
			interval: interval
			callback: callback
			callbackParam: callbackParam)
]

{ #category : '*SDL3-API' }
SDL3Window >> shape: shape [

	self ffiLibrary assertSuccess:
		(self ffiLibrary setWindowShapeWindow: self shape: shape)
]

{ #category : '*SDL3-API' }
SDL3Window >> show [

	self ffiLibrary assertSuccess: (self ffiLibrary showWindow: self)
]

{ #category : '*SDL3-API' }
SDL3Window >> showSystemMenuX: x y: y [

	self ffiLibrary assertSuccess:
		(self ffiLibrary showWindowSystemMenuWindow: self x: x y: y)
]

{ #category : '*SDL3-API' }
SDL3Window >> sizeW: w h: h [

	self ffiLibrary assertSuccess:
		(self ffiLibrary setWindowSizeWindow: self w: w h: h)
]

{ #category : '*SDL3-API' }
SDL3Window >> startTextInput [

	self ffiLibrary assertSuccess: (self ffiLibrary startTextInput: self)
]

{ #category : '*SDL3-API' }
SDL3Window >> startTextInputWithPropertiesProps: props [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			startTextInputWithPropertiesWindow: self
			props: props)
]

{ #category : '*SDL3-API' }
SDL3Window >> stopTextInput [

	self ffiLibrary assertSuccess: (self ffiLibrary stopTextInput: self)
]

{ #category : '*SDL3-API' }
SDL3Window >> surface [

	^ (self ffiLibrary getWindowSurface: self)
		  assertNotNullReturn;
		  yourself
]

{ #category : '*SDL3-API' }
SDL3Window >> surfaceVsync: vsync [

	self ffiLibrary assertSuccess:
		(self ffiLibrary setWindowSurfaceVSyncWindow: self vsync: vsync)
]

{ #category : '*SDL3-API' }
SDL3Window >> sync [

	self ffiLibrary assertSuccess: (self ffiLibrary syncWindow: self)
]

{ #category : '*SDL3-API' }
SDL3Window >> textInputAreaRect: rect cursor: cursor [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			setTextInputAreaWindow: self
			rect: rect
			cursor: cursor)
]

{ #category : '*SDL3-API' }
SDL3Window >> title [

	^ self ffiLibrary getWindowTitle: self
]

{ #category : '*SDL3-API' }
SDL3Window >> title: title [

	self ffiLibrary assertSuccess:
		(self ffiLibrary setWindowTitleWindow: self title: title)
]

{ #category : '*SDL3-API' }
SDL3Window >> updateSurface [

	self ffiLibrary assertSuccess: (self ffiLibrary updateWindowSurface: self)
]

{ #category : '*SDL3-API' }
SDL3Window >> updateSurfaceRects: rects numrects: numrects [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			updateWindowSurfaceRectsWindow: self
			rects: rects
			numrects: numrects)
]

{ #category : '*SDL3-API' }
SDL3Window >> warpMouseInX: x y: y [

	self ffiLibrary warpMouseInWindow: self x: x y: y
]
