Extension { #name : 'SDL3Window' }

{ #category : '* SDL3-API' }
SDL3Window >> alwaysOnTopOnTop: on_top [

	^ self ffiLibrary setWindowAlwaysOnTopWindow: self onTop: on_top
]

{ #category : '* SDL3-API' }
SDL3Window >> aspectRatioMinAspect: min_aspect maxAspect: max_aspect [

	^ self ffiLibrary
		  setWindowAspectRatioWindow: self
		  minAspect: min_aspect
		  maxAspect: max_aspect
]

{ #category : '* SDL3-API' }
SDL3Window >> bordered: bordered [

	^ self ffiLibrary setWindowBorderedWindow: self bordered: bordered
]

{ #category : '* SDL3-API' }
SDL3Window >> clearComposition [

	^ self ffiLibrary clearComposition: self
]

{ #category : '* SDL3-API' }
SDL3Window >> destroy [

	^ self ffiLibrary destroyWindow: self
]

{ #category : '* SDL3-API' }
SDL3Window >> destroySurface [

	^ self ffiLibrary destroyWindowSurface: self
]

{ #category : '* SDL3-API' }
SDL3Window >> display [

	^ self ffiLibrary getDisplayForWindow: self
]

{ #category : '* SDL3-API' }
SDL3Window >> displayScale [

	^ self ffiLibrary getWindowDisplayScale: self
]

{ #category : '* SDL3-API' }
SDL3Window >> eglSurface [

	^ self ffiLibrary eglGetWindowSurface: self
]

{ #category : '* SDL3-API' }
SDL3Window >> flags [

	^ self ffiLibrary getWindowFlags: self
]

{ #category : '* SDL3-API' }
SDL3Window >> flashWithOperation: operation [

	^ self ffiLibrary flashWindow: self operation: operation
]

{ #category : '* SDL3-API' }
SDL3Window >> focusable: focusable [

	^ self ffiLibrary setWindowFocusableWindow: self focusable: focusable
]

{ #category : '* SDL3-API' }
SDL3Window >> fullscreen: fullscreen [

	^ self ffiLibrary
		  setWindowFullscreenWindow: self
		  fullscreen: fullscreen
]

{ #category : '* SDL3-API' }
SDL3Window >> fullscreenMode: mode [

	^ self ffiLibrary setWindowFullscreenModeWindow: self mode: mode
]

{ #category : '* SDL3-API' }
SDL3Window >> getAspectRatioIntoMinAspect: min_aspect maxAspect: max_aspect [

	^ self ffiLibrary
		  getWindowAspectRatioWindow: self
		  minAspect: min_aspect
		  maxAspect: max_aspect
]

{ #category : '* SDL3-API' }
SDL3Window >> getBordersSizeIntoTop: top left: left bottom: bottom right: right [

	^ self ffiLibrary
		  getWindowBordersSizeWindow: self
		  top: top
		  left: left
		  bottom: bottom
		  right: right
]

{ #category : '* SDL3-API' }
SDL3Window >> getICCProfileIntoSize: size [

	^ self ffiLibrary getWindowICCProfileWindow: self size: size
]

{ #category : '* SDL3-API' }
SDL3Window >> getMaximumSizeIntoW: w h: h [

	^ self ffiLibrary getWindowMaximumSizeWindow: self w: w h: h
]

{ #category : '* SDL3-API' }
SDL3Window >> getMinimumSizeIntoW: w h: h [

	^ self ffiLibrary getWindowMinimumSizeWindow: self w: w h: h
]

{ #category : '* SDL3-API' }
SDL3Window >> getPositionIntoX: x y: y [

	^ self ffiLibrary getWindowPositionWindow: self x: x y: y
]

{ #category : '* SDL3-API' }
SDL3Window >> getSafeAreaIntoRect: rect [

	^ self ffiLibrary getWindowSafeAreaWindow: self rect: rect
]

{ #category : '* SDL3-API' }
SDL3Window >> getSizeInPixelsIntoW: w h: h [

	^ self ffiLibrary getWindowSizeInPixelsWindow: self w: w h: h
]

{ #category : '* SDL3-API' }
SDL3Window >> getSizeIntoW: w h: h [

	^ self ffiLibrary getWindowSizeWindow: self w: w h: h
]

{ #category : '* SDL3-API' }
SDL3Window >> getSurfaceVSyncInto: vsync [

	^ self ffiLibrary getWindowSurfaceVSyncWindow: self vsync: vsync
]

{ #category : '* SDL3-API' }
SDL3Window >> getTextInputAreaIntoRect: rect cursor: cursor [

	^ self ffiLibrary
		  getTextInputAreaWindow: self
		  rect: rect
		  cursor: cursor
]

{ #category : '* SDL3-API' }
SDL3Window >> glMakeCurrentContext: context [

	^ self ffiLibrary glMakeCurrentWindow: self context: context
]

{ #category : '* SDL3-API' }
SDL3Window >> glNewContext [

	^ self ffiLibrary glCreateContext: self
]

{ #category : '* SDL3-API' }
SDL3Window >> glSwap [

	^ self ffiLibrary glSwapWindow: self
]

{ #category : '* SDL3-API' }
SDL3Window >> hasSurface [

	^ self ffiLibrary windowHasSurface: self
]

{ #category : '* SDL3-API' }
SDL3Window >> hide [

	^ self ffiLibrary hideWindow: self
]

{ #category : '* SDL3-API' }
SDL3Window >> hitTestCallback: callback callbackData: callback_data [

	^ self ffiLibrary
		  setWindowHitTestWindow: self
		  callback: callback
		  callbackData: callback_data
]

{ #category : '* SDL3-API' }
SDL3Window >> icon: icon [

	^ self ffiLibrary setWindowIconWindow: self icon: icon
]

{ #category : '* SDL3-API' }
SDL3Window >> id [

	^ self ffiLibrary getWindowID: self
]

{ #category : '* SDL3-API' }
SDL3Window >> isFullscreenMode [

	^ self ffiLibrary getWindowFullscreenMode: self
]

{ #category : '* SDL3-API' }
SDL3Window >> isKeyboardGrabbed [

	^ self ffiLibrary getWindowKeyboardGrab: self
]

{ #category : '* SDL3-API' }
SDL3Window >> isMouseGrabbed [

	^ self ffiLibrary getWindowMouseGrab: self
]

{ #category : '* SDL3-API' }
SDL3Window >> isRelativeMouseMode [

	^ self ffiLibrary getWindowRelativeMouseMode: self
]

{ #category : '* SDL3-API' }
SDL3Window >> isScreenKeyboardShown [

	^ self ffiLibrary screenKeyboardShown: self
]

{ #category : '* SDL3-API' }
SDL3Window >> isTextInputActive [

	^ self ffiLibrary textInputActive: self
]

{ #category : '* SDL3-API' }
SDL3Window >> keyboardGrabbed: grabbed [

	^ self ffiLibrary setWindowKeyboardGrabWindow: self grabbed: grabbed
]

{ #category : '* SDL3-API' }
SDL3Window >> maximize [

	^ self ffiLibrary maximizeWindow: self
]

{ #category : '* SDL3-API' }
SDL3Window >> maximumSizeMaxW: max_w maxH: max_h [

	^ self ffiLibrary
		  setWindowMaximumSizeWindow: self
		  maxW: max_w
		  maxH: max_h
]

{ #category : '* SDL3-API' }
SDL3Window >> minimize [

	^ self ffiLibrary minimizeWindow: self
]

{ #category : '* SDL3-API' }
SDL3Window >> minimumSizeMinW: min_w minH: min_h [

	^ self ffiLibrary
		  setWindowMinimumSizeWindow: self
		  minW: min_w
		  minH: min_h
]

{ #category : '* SDL3-API' }
SDL3Window >> modal: modal [

	^ self ffiLibrary setWindowModalWindow: self modal: modal
]

{ #category : '* SDL3-API' }
SDL3Window >> mouseGrabbed: grabbed [

	^ self ffiLibrary setWindowMouseGrabWindow: self grabbed: grabbed
]

{ #category : '* SDL3-API' }
SDL3Window >> mouseRect [

	^ self ffiLibrary getWindowMouseRect: self
]

{ #category : '* SDL3-API' }
SDL3Window >> mouseRect: rect [

	^ self ffiLibrary setWindowMouseRectWindow: self rect: rect
]

{ #category : '* SDL3-API' }
SDL3Window >> newPopupParentOffsetX: offset_x offsetY: offset_y w: w h: h flags: flags [

	^ self ffiLibrary
		  newPopupWindowParent: self
		  offsetX: offset_x
		  offsetY: offset_y
		  w: w
		  h: h
		  flags: flags
]

{ #category : '* SDL3-API' }
SDL3Window >> newRendererFor: name [

	^ self ffiLibrary newRendererWindow: self name: name
]

{ #category : '* SDL3-API' }
SDL3Window >> opacity [

	^ self ffiLibrary getWindowOpacity: self
]

{ #category : '* SDL3-API' }
SDL3Window >> opacity: opacity [

	^ self ffiLibrary setWindowOpacityWindow: self opacity: opacity
]

{ #category : '* SDL3-API' }
SDL3Window >> parent [

	^ self ffiLibrary getWindowParent: self
]

{ #category : '* SDL3-API' }
SDL3Window >> parent: parent [

	^ self ffiLibrary setWindowParentWindow: self parent: parent
]

{ #category : '* SDL3-API' }
SDL3Window >> pixelDensity [

	^ self ffiLibrary getWindowPixelDensity: self
]

{ #category : '* SDL3-API' }
SDL3Window >> pixelFormat [

	^ self ffiLibrary getWindowPixelFormat: self
]

{ #category : '* SDL3-API' }
SDL3Window >> positionX: x y: y [

	^ self ffiLibrary setWindowPositionWindow: self x: x y: y
]

{ #category : '* SDL3-API' }
SDL3Window >> progressState [

	^ self ffiLibrary getWindowProgressState: self
]

{ #category : '* SDL3-API' }
SDL3Window >> progressState: state [

	^ self ffiLibrary setWindowProgressStateWindow: self state: state
]

{ #category : '* SDL3-API' }
SDL3Window >> progressValue [

	^ self ffiLibrary getWindowProgressValue: self
]

{ #category : '* SDL3-API' }
SDL3Window >> progressValue: value [

	^ self ffiLibrary setWindowProgressValueWindow: self value: value
]

{ #category : '* SDL3-API' }
SDL3Window >> properties [

	^ self ffiLibrary getWindowProperties: self
]

{ #category : '* SDL3-API' }
SDL3Window >> raise [

	^ self ffiLibrary raiseWindow: self
]

{ #category : '* SDL3-API' }
SDL3Window >> relativeMouseModeEnabled: enabled [

	^ self ffiLibrary
		  setWindowRelativeMouseModeWindow: self
		  enabled: enabled
]

{ #category : '* SDL3-API' }
SDL3Window >> renderer [

	^ self ffiLibrary getRenderer: self
]

{ #category : '* SDL3-API' }
SDL3Window >> resizable: resizable [

	^ self ffiLibrary setWindowResizableWindow: self resizable: resizable
]

{ #category : '* SDL3-API' }
SDL3Window >> restore [

	^ self ffiLibrary restoreWindow: self
]

{ #category : '* SDL3-API' }
SDL3Window >> shape: shape [

	^ self ffiLibrary setWindowShapeWindow: self shape: shape
]

{ #category : '* SDL3-API' }
SDL3Window >> show [

	^ self ffiLibrary showWindow: self
]

{ #category : '* SDL3-API' }
SDL3Window >> showSystemMenuX: x y: y [

	^ self ffiLibrary showWindowSystemMenuWindow: self x: x y: y
]

{ #category : '* SDL3-API' }
SDL3Window >> sizeW: w h: h [

	^ self ffiLibrary setWindowSizeWindow: self w: w h: h
]

{ #category : '* SDL3-API' }
SDL3Window >> startTextInput [

	^ self ffiLibrary startTextInput: self
]

{ #category : '* SDL3-API' }
SDL3Window >> startTextInputWithPropertiesProps: props [

	^ self ffiLibrary
		  startTextInputWithPropertiesWindow: self
		  props: props
]

{ #category : '* SDL3-API' }
SDL3Window >> stopTextInput [

	^ self ffiLibrary stopTextInput: self
]

{ #category : '* SDL3-API' }
SDL3Window >> surface [

	^ self ffiLibrary getWindowSurface: self
]

{ #category : '* SDL3-API' }
SDL3Window >> surfaceVsync: vsync [

	^ self ffiLibrary setWindowSurfaceVSyncWindow: self vsync: vsync
]

{ #category : '* SDL3-API' }
SDL3Window >> sync [

	^ self ffiLibrary syncWindow: self
]

{ #category : '* SDL3-API' }
SDL3Window >> textInputAreaRect: rect cursor: cursor [

	^ self ffiLibrary
		  setTextInputAreaWindow: self
		  rect: rect
		  cursor: cursor
]

{ #category : '* SDL3-API' }
SDL3Window >> title [

	^ self ffiLibrary getWindowTitle: self
]

{ #category : '* SDL3-API' }
SDL3Window >> title: title [

	^ self ffiLibrary setWindowTitleWindow: self title: title
]

{ #category : '* SDL3-API' }
SDL3Window >> updateSurface [

	^ self ffiLibrary updateWindowSurface: self
]

{ #category : '* SDL3-API' }
SDL3Window >> updateSurfaceRects: rects numrects: numrects [

	^ self ffiLibrary
		  updateWindowSurfaceRectsWindow: self
		  rects: rects
		  numrects: numrects
]

{ #category : '* SDL3-API' }
SDL3Window >> warpMouseInX: x y: y [

	^ self ffiLibrary warpMouseInWindow: self x: x y: y
]
