Extension { #name : 'SDL3Renderer' }

{ #category : '*SDL3-API' }
SDL3Renderer >> addVulkanRenderSemaphoresWaitStageMask: wait_stage_mask waitSemaphore: wait_semaphore signalSemaphore: signal_semaphore [

	^ self ffiLibrary
		  addVulkanRenderSemaphoresRenderer: self
		  waitStageMask: wait_stage_mask
		  waitSemaphore: wait_semaphore
		  signalSemaphore: signal_semaphore
]

{ #category : '*SDL3-API' }
SDL3Renderer >> convertEventToRenderCoordinatesEvent: event [

	^ self ffiLibrary
		  convertEventToRenderCoordinatesRenderer: self
		  event: event
]

{ #category : '*SDL3-API' }
SDL3Renderer >> convertRenderCoordinatesFromWindowX: window_x windowY: window_y intoX: x y: y [

	^ self ffiLibrary
		  renderCoordinatesFromWindowRenderer: self
		  windowX: window_x
		  windowY: window_y
		  x: x
		  y: y
]

{ #category : '*SDL3-API' }
SDL3Renderer >> convertRenderCoordinatesToWindowX: x y: y intoWindowX: window_x windowY: window_y [

	^ self ffiLibrary
		  renderCoordinatesToWindowRenderer: self
		  x: x
		  y: y
		  windowX: window_x
		  windowY: window_y
]

{ #category : '*SDL3-API' }
SDL3Renderer >> defaultTextureScaleModeScaleMode: scale_mode [

	^ self ffiLibrary
		  setDefaultTextureScaleModeRenderer: self
		  scaleMode: scale_mode
]

{ #category : '*SDL3-API' }
SDL3Renderer >> destroy [

	^ self ffiLibrary destroyRenderer: self
]

{ #category : '*SDL3-API' }
SDL3Renderer >> flush [

	^ self ffiLibrary flushRenderer: self
]

{ #category : '*SDL3-API' }
SDL3Renderer >> getCurrentRenderOutputSizeIntoW: w h: h [

	^ self ffiLibrary getCurrentRenderOutputSizeRenderer: self w: w h: h
]

{ #category : '*SDL3-API' }
SDL3Renderer >> getDefaultTextureScaleModeIntoScaleMode: scale_mode [

	^ self ffiLibrary
		  getDefaultTextureScaleModeRenderer: self
		  scaleMode: scale_mode
]

{ #category : '*SDL3-API' }
SDL3Renderer >> getRenderClipRectInto: rect [

	^ self ffiLibrary getRenderClipRectRenderer: self rect: rect
]

{ #category : '*SDL3-API' }
SDL3Renderer >> getRenderColorScaleInto: scale [

	^ self ffiLibrary getRenderColorScaleRenderer: self scale: scale
]

{ #category : '*SDL3-API' }
SDL3Renderer >> getRenderDrawBlendModeIntoBlendMode: blendMode [

	^ self ffiLibrary
		  getRenderDrawBlendModeRenderer: self
		  blendMode: blendMode
]

{ #category : '*SDL3-API' }
SDL3Renderer >> getRenderDrawColorFloatIntoR: r g: g b: b a: a [

	^ self ffiLibrary
		  getRenderDrawColorFloatRenderer: self
		  r: r
		  g: g
		  b: b
		  a: a
]

{ #category : '*SDL3-API' }
SDL3Renderer >> getRenderDrawColorIntoR: r g: g b: b a: a [

	^ self ffiLibrary
		  getRenderDrawColorRenderer: self
		  r: r
		  g: g
		  b: b
		  a: a
]

{ #category : '*SDL3-API' }
SDL3Renderer >> getRenderLogicalPresentationIntoW: w h: h mode: mode [

	^ self ffiLibrary
		  getRenderLogicalPresentationRenderer: self
		  w: w
		  h: h
		  mode: mode
]

{ #category : '*SDL3-API' }
SDL3Renderer >> getRenderLogicalPresentationRectInto: rect [

	^ self ffiLibrary
		  getRenderLogicalPresentationRectRenderer: self
		  rect: rect
]

{ #category : '*SDL3-API' }
SDL3Renderer >> getRenderOutputSizeIntoW: w h: h [

	^ self ffiLibrary getRenderOutputSizeRenderer: self w: w h: h
]

{ #category : '*SDL3-API' }
SDL3Renderer >> getRenderSafeAreaIntoRect: rect [

	^ self ffiLibrary getRenderSafeAreaRenderer: self rect: rect
]

{ #category : '*SDL3-API' }
SDL3Renderer >> getRenderTextureAddressModeIntoUMode: u_mode vMode: v_mode [

	^ self ffiLibrary
		  getRenderTextureAddressModeRenderer: self
		  uMode: u_mode
		  vMode: v_mode
]

{ #category : '*SDL3-API' }
SDL3Renderer >> getRenderVSyncInto: vsync [

	^ self ffiLibrary getRenderVSyncRenderer: self vsync: vsync
]

{ #category : '*SDL3-API' }
SDL3Renderer >> getRenderViewportIntoRect: rect [

	^ self ffiLibrary getRenderViewportRenderer: self rect: rect
]

{ #category : '*SDL3-API' }
SDL3Renderer >> getScaleIntoX: scaleX y: scaleY [

	^ self ffiLibrary
		  getRenderScaleRenderer: self
		  scaleX: scaleX
		  scaleY: scaleY
]

{ #category : '*SDL3-API' }
SDL3Renderer >> gpuDevice [

	^ self ffiLibrary getGPURendererDevice: self
]

{ #category : '*SDL3-API' }
SDL3Renderer >> gpuRenderState: state [

	^ self ffiLibrary setGPURenderStateRenderer: self state: state
]

{ #category : '*SDL3-API' }
SDL3Renderer >> isRenderClipEnabled [

	^ self ffiLibrary renderClipEnabled: self
]

{ #category : '*SDL3-API' }
SDL3Renderer >> isRenderViewportSet [

	^ self ffiLibrary renderViewportSet: self
]

{ #category : '*SDL3-API' }
SDL3Renderer >> name [

	^ self ffiLibrary getRendererName: self
]

{ #category : '*SDL3-API' }
SDL3Renderer >> newGPURenderStateCreateinfo: createinfo [

	^ self ffiLibrary
		  newGPURenderStateRenderer: self
		  createinfo: createinfo
]

{ #category : '*SDL3-API' }
SDL3Renderer >> newTextureFormat: format access: access w: w h: h [

	^ self ffiLibrary
		  newTextureRenderer: self
		  format: format
		  access: access
		  w: w
		  h: h
]

{ #category : '*SDL3-API' }
SDL3Renderer >> newTextureFromSurface: surface [

	^ self ffiLibrary
		  newTextureFromSurfaceRenderer: self
		  surface: surface
]

{ #category : '*SDL3-API' }
SDL3Renderer >> newTextureWithProperties: props [

	^ self ffiLibrary newTextureWithPropertiesRenderer: self props: props
]

{ #category : '*SDL3-API' }
SDL3Renderer >> properties [

	^ self ffiLibrary getRendererProperties: self
]

{ #category : '*SDL3-API' }
SDL3Renderer >> renderClear [

	^ self ffiLibrary renderClear: self
]

{ #category : '*SDL3-API' }
SDL3Renderer >> renderClipRect: rect [

	^ self ffiLibrary setRenderClipRectRenderer: self rect: rect
]

{ #category : '*SDL3-API' }
SDL3Renderer >> renderColorScale: scale [

	^ self ffiLibrary setRenderColorScaleRenderer: self scale: scale
]

{ #category : '*SDL3-API' }
SDL3Renderer >> renderDebugTextX: x y: y str: str [

	^ self ffiLibrary
		  renderDebugTextRenderer: self
		  x: x
		  y: y
		  str: str
]

{ #category : '*SDL3-API' }
SDL3Renderer >> renderDrawBlendModeBlendMode: blendMode [

	^ self ffiLibrary
		  setRenderDrawBlendModeRenderer: self
		  blendMode: blendMode
]

{ #category : '*SDL3-API' }
SDL3Renderer >> renderDrawColorFloatR: r g: g b: b a: a [

	^ self ffiLibrary
		  setRenderDrawColorFloatRenderer: self
		  r: r
		  g: g
		  b: b
		  a: a
]

{ #category : '*SDL3-API' }
SDL3Renderer >> renderDrawColorR: r g: g b: b a: a [

	^ self ffiLibrary
		  setRenderDrawColorRenderer: self
		  r: r
		  g: g
		  b: b
		  a: a
]

{ #category : '*SDL3-API' }
SDL3Renderer >> renderFillRect: rect [

	^ self ffiLibrary renderFillRectRenderer: self rect: rect
]

{ #category : '*SDL3-API' }
SDL3Renderer >> renderFillRects: rects count: count [

	^ self ffiLibrary
		  renderFillRectsRenderer: self
		  rects: rects
		  count: count
]

{ #category : '*SDL3-API' }
SDL3Renderer >> renderGeometryRawTexture: texture xy: xy xyStride: xy_stride color: color colorStride: color_stride uv: uv uvStride: uv_stride numVertices: num_vertices indices: indices numIndices: num_indices sizeIndices: size_indices [

	^ self ffiLibrary
		  renderGeometryRawRenderer: self
		  texture: texture
		  xy: xy
		  xyStride: xy_stride
		  color: color
		  colorStride: color_stride
		  uv: uv
		  uvStride: uv_stride
		  numVertices: num_vertices
		  indices: indices
		  numIndices: num_indices
		  sizeIndices: size_indices
]

{ #category : '*SDL3-API' }
SDL3Renderer >> renderGeometryTexture: texture vertices: vertices numVertices: num_vertices indices: indices numIndices: num_indices [

	^ self ffiLibrary
		  renderGeometryRenderer: self
		  texture: texture
		  vertices: vertices
		  numVertices: num_vertices
		  indices: indices
		  numIndices: num_indices
]

{ #category : '*SDL3-API' }
SDL3Renderer >> renderLineX1: x1 y1: y1 x2: x2 y2: y2 [

	^ self ffiLibrary
		  renderLineRenderer: self
		  x1: x1
		  y1: y1
		  x2: x2
		  y2: y2
]

{ #category : '*SDL3-API' }
SDL3Renderer >> renderLinesPoints: points count: count [

	^ self ffiLibrary
		  renderLinesRenderer: self
		  points: points
		  count: count
]

{ #category : '*SDL3-API' }
SDL3Renderer >> renderLogicalPresentationW: w h: h mode: mode [

	^ self ffiLibrary
		  setRenderLogicalPresentationRenderer: self
		  w: w
		  h: h
		  mode: mode
]

{ #category : '*SDL3-API' }
SDL3Renderer >> renderMetalCommandEncoder [

	^ self ffiLibrary getRenderMetalCommandEncoder: self
]

{ #category : '*SDL3-API' }
SDL3Renderer >> renderMetalLayer [

	^ self ffiLibrary getRenderMetalLayer: self
]

{ #category : '*SDL3-API' }
SDL3Renderer >> renderPointX: x y: y [

	^ self ffiLibrary renderPointRenderer: self x: x y: y
]

{ #category : '*SDL3-API' }
SDL3Renderer >> renderPoints: points count: count [

	^ self ffiLibrary
		  renderPointsRenderer: self
		  points: points
		  count: count
]

{ #category : '*SDL3-API' }
SDL3Renderer >> renderPresent [

	^ self ffiLibrary renderPresent: self
]

{ #category : '*SDL3-API' }
SDL3Renderer >> renderReadPixelsRect: rect [

	^ self ffiLibrary renderReadPixelsRenderer: self rect: rect
]

{ #category : '*SDL3-API' }
SDL3Renderer >> renderRect: rect [

	^ self ffiLibrary renderRectRenderer: self rect: rect
]

{ #category : '*SDL3-API' }
SDL3Renderer >> renderRects: rects count: count [

	^ self ffiLibrary renderRectsRenderer: self rects: rects count: count
]

{ #category : '*SDL3-API' }
SDL3Renderer >> renderScaleX: scaleX scaleY: scaleY [

	^ self ffiLibrary
		  setRenderScaleRenderer: self
		  scaleX: scaleX
		  scaleY: scaleY
]

{ #category : '*SDL3-API' }
SDL3Renderer >> renderTarget [

	^ self ffiLibrary getRenderTarget: self
]

{ #category : '*SDL3-API' }
SDL3Renderer >> renderTargetTexture: texture [

	^ self ffiLibrary setRenderTargetRenderer: self texture: texture
]

{ #category : '*SDL3-API' }
SDL3Renderer >> renderTexture9GridTexture: texture srcrect: srcrect leftWidth: left_width rightWidth: right_width topHeight: top_height bottomHeight: bottom_height scale: scale dstrect: dstrect [

	^ self ffiLibrary
		  renderTexture9GridRenderer: self
		  texture: texture
		  srcrect: srcrect
		  leftWidth: left_width
		  rightWidth: right_width
		  topHeight: top_height
		  bottomHeight: bottom_height
		  scale: scale
		  dstrect: dstrect
]

{ #category : '*SDL3-API' }
SDL3Renderer >> renderTexture9GridTiledTexture: texture srcrect: srcrect leftWidth: left_width rightWidth: right_width topHeight: top_height bottomHeight: bottom_height scale: scale dstrect: dstrect tileScale: tileScale [

	^ self ffiLibrary
		  renderTexture9GridTiledRenderer: self
		  texture: texture
		  srcrect: srcrect
		  leftWidth: left_width
		  rightWidth: right_width
		  topHeight: top_height
		  bottomHeight: bottom_height
		  scale: scale
		  dstrect: dstrect
		  tileScale: tileScale
]

{ #category : '*SDL3-API' }
SDL3Renderer >> renderTexture: texture srcrect: srcrect dstrect: dstrect [

	^ self ffiLibrary
		  renderTextureRenderer: self
		  texture: texture
		  srcrect: srcrect
		  dstrect: dstrect
]

{ #category : '*SDL3-API' }
SDL3Renderer >> renderTextureAddressModeUMode: u_mode vMode: v_mode [

	^ self ffiLibrary
		  setRenderTextureAddressModeRenderer: self
		  uMode: u_mode
		  vMode: v_mode
]

{ #category : '*SDL3-API' }
SDL3Renderer >> renderTextureAffineTexture: texture srcrect: srcrect origin: origin right: right down: down [

	^ self ffiLibrary
		  renderTextureAffineRenderer: self
		  texture: texture
		  srcrect: srcrect
		  origin: origin
		  right: right
		  down: down
]

{ #category : '*SDL3-API' }
SDL3Renderer >> renderTextureRotatedTexture: texture srcrect: srcrect dstrect: dstrect angle: angle center: center flip: flip [

	^ self ffiLibrary
		  renderTextureRotatedRenderer: self
		  texture: texture
		  srcrect: srcrect
		  dstrect: dstrect
		  angle: angle
		  center: center
		  flip: flip
]

{ #category : '*SDL3-API' }
SDL3Renderer >> renderTextureTiledTexture: texture srcrect: srcrect scale: scale dstrect: dstrect [

	^ self ffiLibrary
		  renderTextureTiledRenderer: self
		  texture: texture
		  srcrect: srcrect
		  scale: scale
		  dstrect: dstrect
]

{ #category : '*SDL3-API' }
SDL3Renderer >> renderViewportRect: rect [

	^ self ffiLibrary setRenderViewportRenderer: self rect: rect
]

{ #category : '*SDL3-API' }
SDL3Renderer >> renderVsync: vsync [

	^ self ffiLibrary setRenderVSyncRenderer: self vsync: vsync
]

{ #category : '*SDL3-API' }
SDL3Renderer >> renderWindow [

	^ self ffiLibrary getRenderWindow: self
]
