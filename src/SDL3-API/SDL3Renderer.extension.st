Extension { #name : 'SDL3Renderer' }

{ #category : '*SDL3-API' }
SDL3Renderer >> addVulkanRenderSemaphoresWaitStageMask: waitStageMask waitSemaphore: waitSemaphore signalSemaphore: signalSemaphore [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			addVulkanRenderSemaphoresRenderer: self
			waitStageMask: waitStageMask
			waitSemaphore: waitSemaphore
			signalSemaphore: signalSemaphore)
]

{ #category : '*SDL3-API' }
SDL3Renderer >> convertEventToRenderCoordinatesEvent: event [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			convertEventToRenderCoordinatesRenderer: self
			event: event)
]

{ #category : '*SDL3-API' }
SDL3Renderer >> convertRenderCoordinatesFromWindowX: windowX windowY: windowY intoX: x y: y [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			renderCoordinatesFromWindowRenderer: self
			windowX: windowX
			windowY: windowY
			x: x
			y: y)
]

{ #category : '*SDL3-API' }
SDL3Renderer >> convertRenderCoordinatesToWindowX: x y: y intoWindowX: windowX windowY: windowY [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			renderCoordinatesToWindowRenderer: self
			x: x
			y: y
			windowX: windowX
			windowY: windowY)
]

{ #category : '*SDL3-API' }
SDL3Renderer >> defaultTextureScaleModeScaleMode: scaleMode [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			setDefaultTextureScaleModeRenderer: self
			scaleMode: scaleMode)
]

{ #category : '*SDL3-API' }
SDL3Renderer >> destroy [

	self ffiLibrary destroyRenderer: self
]

{ #category : '*SDL3-API' }
SDL3Renderer >> flush [

	self ffiLibrary assertSuccess: (self ffiLibrary flushRenderer: self)
]

{ #category : '*SDL3-API' }
SDL3Renderer >> getCurrentRenderOutputSizeIntoW: w h: h [

	self ffiLibrary assertSuccess:
		(self ffiLibrary getCurrentRenderOutputSizeRenderer: self w: w h: h)
]

{ #category : '*SDL3-API' }
SDL3Renderer >> getDefaultTextureScaleModeIntoScaleMode: scaleMode [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			getDefaultTextureScaleModeRenderer: self
			scaleMode: scaleMode)
]

{ #category : '*SDL3-API' }
SDL3Renderer >> getRenderClipRectInto: rect [

	self ffiLibrary assertSuccess:
		(self ffiLibrary getRenderClipRectRenderer: self rect: rect)
]

{ #category : '*SDL3-API' }
SDL3Renderer >> getRenderColorScaleInto: scale [

	self ffiLibrary assertSuccess:
		(self ffiLibrary getRenderColorScaleRenderer: self scale: scale)
]

{ #category : '*SDL3-API' }
SDL3Renderer >> getRenderDrawBlendModeIntoBlendMode: blendMode [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			getRenderDrawBlendModeRenderer: self
			blendMode: blendMode)
]

{ #category : '*SDL3-API' }
SDL3Renderer >> getRenderDrawColorFloatIntoR: r g: g b: b a: a [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			getRenderDrawColorFloatRenderer: self
			r: r
			g: g
			b: b
			a: a)
]

{ #category : '*SDL3-API' }
SDL3Renderer >> getRenderDrawColorIntoR: r g: g b: b a: a [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			getRenderDrawColorRenderer: self
			r: r
			g: g
			b: b
			a: a)
]

{ #category : '*SDL3-API' }
SDL3Renderer >> getRenderLogicalPresentationIntoW: w h: h mode: mode [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			getRenderLogicalPresentationRenderer: self
			w: w
			h: h
			mode: mode)
]

{ #category : '*SDL3-API' }
SDL3Renderer >> getRenderLogicalPresentationRectInto: rect [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			getRenderLogicalPresentationRectRenderer: self
			rect: rect)
]

{ #category : '*SDL3-API' }
SDL3Renderer >> getRenderOutputSizeIntoW: w h: h [

	self ffiLibrary assertSuccess:
		(self ffiLibrary getRenderOutputSizeRenderer: self w: w h: h)
]

{ #category : '*SDL3-API' }
SDL3Renderer >> getRenderSafeAreaIntoRect: rect [

	self ffiLibrary assertSuccess:
		(self ffiLibrary getRenderSafeAreaRenderer: self rect: rect)
]

{ #category : '*SDL3-API' }
SDL3Renderer >> getRenderTextureAddressModeIntoUMode: uMode vMode: vMode [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			getRenderTextureAddressModeRenderer: self
			uMode: uMode
			vMode: vMode)
]

{ #category : '*SDL3-API' }
SDL3Renderer >> getRenderVSyncInto: vsync [

	self ffiLibrary assertSuccess:
		(self ffiLibrary getRenderVSyncRenderer: self vsync: vsync)
]

{ #category : '*SDL3-API' }
SDL3Renderer >> getRenderViewportIntoRect: rect [

	self ffiLibrary assertSuccess:
		(self ffiLibrary getRenderViewportRenderer: self rect: rect)
]

{ #category : '*SDL3-API' }
SDL3Renderer >> getScaleIntoX: scaleX y: scaleY [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			getRenderScaleRenderer: self
			scaleX: scaleX
			scaleY: scaleY)
]

{ #category : '*SDL3-API' }
SDL3Renderer >> gpuDevice [

	^ (self ffiLibrary getGPURendererDevice: self)
		  assertNotNullReturn;
		  yourself
]

{ #category : '*SDL3-API' }
SDL3Renderer >> gpuRenderState: state [

	self ffiLibrary assertSuccess:
		(self ffiLibrary setGPURenderStateRenderer: self state: state)
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

	^ (self ffiLibrary
		   newGPURenderStateRenderer: self
		   createinfo: createinfo)
		  assertNotNullReturn;
		  yourself
]

{ #category : '*SDL3-API' }
SDL3Renderer >> newTextureFormat: format access: access w: w h: h [

	^ (self ffiLibrary
		   newTextureRenderer: self
		   format: format
		   access: access
		   w: w
		   h: h)
		  assertNotNullReturn;
		  yourself
]

{ #category : '*SDL3-API' }
SDL3Renderer >> newTextureFromSurface: surface [

	^ (self ffiLibrary
		   newTextureFromSurfaceRenderer: self
		   surface: surface)
		  assertNotNullReturn;
		  yourself
]

{ #category : '*SDL3-API' }
SDL3Renderer >> newTextureWithProperties: props [

	^ (self ffiLibrary newTextureWithPropertiesRenderer: self props: props)
		  assertNotNullReturn;
		  yourself
]

{ #category : '*SDL3-API' }
SDL3Renderer >> propertiesID [

	^ self ffiLibrary getRendererProperties: self
]

{ #category : '*SDL3-API' }
SDL3Renderer >> renderClear [

	self ffiLibrary assertSuccess: (self ffiLibrary renderClear: self)
]

{ #category : '*SDL3-API' }
SDL3Renderer >> renderClipRect: rect [

	self ffiLibrary assertSuccess:
		(self ffiLibrary setRenderClipRectRenderer: self rect: rect)
]

{ #category : '*SDL3-API' }
SDL3Renderer >> renderColorScale: scale [

	self ffiLibrary assertSuccess:
		(self ffiLibrary setRenderColorScaleRenderer: self scale: scale)
]

{ #category : '*SDL3-API' }
SDL3Renderer >> renderDebugTextX: x y: y str: str [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			renderDebugTextRenderer: self
			x: x
			y: y
			str: str)
]

{ #category : '*SDL3-API' }
SDL3Renderer >> renderDrawBlendMode: blendMode [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			setRenderDrawBlendModeRenderer: self
			blendMode: blendMode)
]

{ #category : '*SDL3-API' }
SDL3Renderer >> renderDrawColorFloatR: r g: g b: b a: a [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			setRenderDrawColorFloatRenderer: self
			r: r
			g: g
			b: b
			a: a)
]

{ #category : '*SDL3-API' }
SDL3Renderer >> renderDrawColorR: r g: g b: b a: a [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			setRenderDrawColorRenderer: self
			r: r
			g: g
			b: b
			a: a)
]

{ #category : '*SDL3-API' }
SDL3Renderer >> renderFillRect: rect [

	self ffiLibrary assertSuccess:
		(self ffiLibrary renderFillRectRenderer: self rect: rect)
]

{ #category : '*SDL3-API' }
SDL3Renderer >> renderFillRects: rects count: count [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			renderFillRectsRenderer: self
			rects: rects
			count: count)
]

{ #category : '*SDL3-API' }
SDL3Renderer >> renderGeometryRawTexture: texture xy: xy xyStride: xyStride color: color colorStride: colorStride uv: uv uvStride: uvStride numVertices: numVertices indices: indices numIndices: numIndices sizeIndices: sizeIndices [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			renderGeometryRawRenderer: self
			texture: texture
			xy: xy
			xyStride: xyStride
			color: color
			colorStride: colorStride
			uv: uv
			uvStride: uvStride
			numVertices: numVertices
			indices: indices
			numIndices: numIndices
			sizeIndices: sizeIndices)
]

{ #category : '*SDL3-API' }
SDL3Renderer >> renderGeometryTexture: texture vertices: vertices numVertices: numVertices indices: indices numIndices: numIndices [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			renderGeometryRenderer: self
			texture: texture
			vertices: vertices
			numVertices: numVertices
			indices: indices
			numIndices: numIndices)
]

{ #category : '*SDL3-API' }
SDL3Renderer >> renderLineX1: x1 y1: y1 x2: x2 y2: y2 [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			renderLineRenderer: self
			x1: x1
			y1: y1
			x2: x2
			y2: y2)
]

{ #category : '*SDL3-API' }
SDL3Renderer >> renderLinesPoints: points count: count [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			renderLinesRenderer: self
			points: points
			count: count)
]

{ #category : '*SDL3-API' }
SDL3Renderer >> renderLogicalPresentationW: w h: h mode: mode [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			setRenderLogicalPresentationRenderer: self
			w: w
			h: h
			mode: mode)
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

	self ffiLibrary assertSuccess:
		(self ffiLibrary renderPointRenderer: self x: x y: y)
]

{ #category : '*SDL3-API' }
SDL3Renderer >> renderPoints: points count: count [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			renderPointsRenderer: self
			points: points
			count: count)
]

{ #category : '*SDL3-API' }
SDL3Renderer >> renderPresent [

	self ffiLibrary assertSuccess: (self ffiLibrary renderPresent: self)
]

{ #category : '*SDL3-API' }
SDL3Renderer >> renderReadPixelsRect: rect [

	^ (self ffiLibrary renderReadPixelsRenderer: self rect: rect)
		  assertNotNullReturn;
		  yourself
]

{ #category : '*SDL3-API' }
SDL3Renderer >> renderRect: rect [

	self ffiLibrary assertSuccess: (self ffiLibrary renderRectRenderer: self rect: rect)
]

{ #category : '*SDL3-API' }
SDL3Renderer >> renderRects: rects count: count [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			renderRectsRenderer: self rects: rects count: count)
]

{ #category : '*SDL3-API' }
SDL3Renderer >> renderScaleX: scaleX scaleY: scaleY [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			setRenderScaleRenderer: self
			scaleX: scaleX
			scaleY: scaleY)
]

{ #category : '*SDL3-API' }
SDL3Renderer >> renderTargetIfPresent: presentBlock ifAbsent: absentBlock [

	| result |
	result := self ffiLibrary getRenderTarget: self.
	^ result isNull
		ifTrue: [ absentBlock value ]
		ifFalse: [ presentBlock value: result ]
]

{ #category : '*SDL3-API' }
SDL3Renderer >> renderTargetOrNil [

	^ self renderTargetIfPresent: [ :t | t ] ifAbsent: [ nil ]
]

{ #category : '*SDL3-API' }
SDL3Renderer >> renderTargetTexture: texture [

	self ffiLibrary assertSuccess:
		(self ffiLibrary setRenderTargetRenderer: self texture: texture)
]

{ #category : '*SDL3-API' }
SDL3Renderer >> renderTexture9GridTexture: texture srcrect: srcrect leftWidth: leftWidth rightWidth: rightWidth topHeight: topHeight bottomHeight: bottomHeight scale: scale dstrect: dstrect [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			renderTexture9GridRenderer: self
			texture: texture
			srcrect: srcrect
			leftWidth: leftWidth
			rightWidth: rightWidth
			topHeight: topHeight
			bottomHeight: bottomHeight
			scale: scale
			dstrect: dstrect)
]

{ #category : '*SDL3-API' }
SDL3Renderer >> renderTexture9GridTiledTexture: texture srcrect: srcrect leftWidth: leftWidth rightWidth: rightWidth topHeight: topHeight bottomHeight: bottomHeight scale: scale dstrect: dstrect tileScale: tileScale [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			renderTexture9GridTiledRenderer: self
			texture: texture
			srcrect: srcrect
			leftWidth: leftWidth
			rightWidth: rightWidth
			topHeight: topHeight
			bottomHeight: bottomHeight
			scale: scale
			dstrect: dstrect
			tileScale: tileScale)
]

{ #category : '*SDL3-API' }
SDL3Renderer >> renderTexture: texture srcrect: srcrect dstrect: dstrect [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			renderTextureRenderer: self
			texture: texture
			srcrect: srcrect
			dstrect: dstrect)
]

{ #category : '*SDL3-API' }
SDL3Renderer >> renderTextureAddressModeUMode: uMode vMode: vMode [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			setRenderTextureAddressModeRenderer: self
			uMode: uMode
			vMode: vMode)
]

{ #category : '*SDL3-API' }
SDL3Renderer >> renderTextureAffineTexture: texture srcrect: srcrect origin: origin right: right down: down [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			renderTextureAffineRenderer: self
			texture: texture
			srcrect: srcrect
			origin: origin
			right: right
			down: down)
]

{ #category : '*SDL3-API' }
SDL3Renderer >> renderTextureRotatedTexture: texture srcrect: srcrect dstrect: dstrect angle: angle center: center flip: flip [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			renderTextureRotatedRenderer: self
			texture: texture
			srcrect: srcrect
			dstrect: dstrect
			angle: angle
			center: center
			flip: flip)
]

{ #category : '*SDL3-API' }
SDL3Renderer >> renderTextureTiledTexture: texture srcrect: srcrect scale: scale dstrect: dstrect [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			renderTextureTiledRenderer: self
			texture: texture
			srcrect: srcrect
			scale: scale
			dstrect: dstrect)
]

{ #category : '*SDL3-API' }
SDL3Renderer >> renderViewportRect: rect [

	self ffiLibrary assertSuccess:
		(self ffiLibrary setRenderViewportRenderer: self rect: rect)
]

{ #category : '*SDL3-API' }
SDL3Renderer >> renderVsync: vsync [

	self ffiLibrary assertSuccess:
		(self ffiLibrary setRenderVSyncRenderer: self vsync: vsync)
]

{ #category : '*SDL3-API' }
SDL3Renderer >> renderWindow [

	^ (self ffiLibrary getRenderWindow: self)
		  assertNotNullReturn;
		  yourself
]
