Extension { #name : 'SDL3Surface' }

{ #category : '*SDL3-API' }
SDL3Surface >> addAlternateImage: image [

	^ self ffiLibrary addSurfaceAlternateImageSurface: self image: image
]

{ #category : '*SDL3-API' }
SDL3Surface >> alphaModAlpha: alpha [

	^ self ffiLibrary setSurfaceAlphaModSurface: self alpha: alpha
]

{ #category : '*SDL3-API' }
SDL3Surface >> blendModeBlendMode: blendMode [

	^ self ffiLibrary
		  setSurfaceBlendModeSurface: self
		  blendMode: blendMode
]

{ #category : '*SDL3-API' }
SDL3Surface >> blitScaledSrcrect: srcrect dst: dst dstrect: dstrect scaleMode: scaleMode [

	^ self ffiLibrary
		  blitSurfaceScaledSrc: self
		  srcrect: srcrect
		  dst: dst
		  dstrect: dstrect
		  scaleMode: scaleMode
]

{ #category : '*SDL3-API' }
SDL3Surface >> blitSrcrect: srcrect dst: dst dstrect: dstrect [

	^ self ffiLibrary
		  blitSurfaceSrc: self
		  srcrect: srcrect
		  dst: dst
		  dstrect: dstrect
]

{ #category : '*SDL3-API' }
SDL3Surface >> blitSurface9GridSrcrect: srcrect leftWidth: left_width rightWidth: right_width topHeight: top_height bottomHeight: bottom_height scale: scale scaleMode: scaleMode dst: dst dstrect: dstrect [

	^ self ffiLibrary
		  blitSurface9GridSrc: self
		  srcrect: srcrect
		  leftWidth: left_width
		  rightWidth: right_width
		  topHeight: top_height
		  bottomHeight: bottom_height
		  scale: scale
		  scaleMode: scaleMode
		  dst: dst
		  dstrect: dstrect
]

{ #category : '*SDL3-API' }
SDL3Surface >> blitTiledSrcrect: srcrect dst: dst dstrect: dstrect [

	^ self ffiLibrary
		  blitSurfaceTiledSrc: self
		  srcrect: srcrect
		  dst: dst
		  dstrect: dstrect
]

{ #category : '*SDL3-API' }
SDL3Surface >> blitTiledWithScaleSrcrect: srcrect scale: scale scaleMode: scaleMode dst: dst dstrect: dstrect [

	^ self ffiLibrary
		  blitSurfaceTiledWithScaleSrc: self
		  srcrect: srcrect
		  scale: scale
		  scaleMode: scaleMode
		  dst: dst
		  dstrect: dstrect
]

{ #category : '*SDL3-API' }
SDL3Surface >> blitUncheckedScaledSrcrect: srcrect dst: dst dstrect: dstrect scaleMode: scaleMode [

	^ self ffiLibrary
		  blitSurfaceUncheckedScaledSrc: self
		  srcrect: srcrect
		  dst: dst
		  dstrect: dstrect
		  scaleMode: scaleMode
]

{ #category : '*SDL3-API' }
SDL3Surface >> blitUncheckedSrcrect: srcrect dst: dst dstrect: dstrect [

	^ self ffiLibrary
		  blitSurfaceUncheckedSrc: self
		  srcrect: srcrect
		  dst: dst
		  dstrect: dstrect
]

{ #category : '*SDL3-API' }
SDL3Surface >> cleaR: r g: g b: b a: a [

	^ self ffiLibrary
		  clearSurface: self
		  r: r
		  g: g
		  b: b
		  a: a
]

{ #category : '*SDL3-API' }
SDL3Surface >> clipRect: rect [

	^ self ffiLibrary setSurfaceClipRectSurface: self rect: rect
]

{ #category : '*SDL3-API' }
SDL3Surface >> colorKeyEnabled: enabled key: key [

	^ self ffiLibrary
		  setSurfaceColorKeySurface: self
		  enabled: enabled
		  key: key
]

{ #category : '*SDL3-API' }
SDL3Surface >> colorModR: r g: g b: b [

	^ self ffiLibrary
		  setSurfaceColorModSurface: self
		  r: r
		  g: g
		  b: b
]

{ #category : '*SDL3-API' }
SDL3Surface >> colorspace [

	^ self ffiLibrary getSurfaceColorspace: self
]

{ #category : '*SDL3-API' }
SDL3Surface >> colorspace: colorspace [

	^ self ffiLibrary
		  setSurfaceColorspaceSurface: self
		  colorspace: colorspace
]

{ #category : '*SDL3-API' }
SDL3Surface >> copyWithFormat: format [

	^ self ffiLibrary convertSurface: self format: format
]

{ #category : '*SDL3-API' }
SDL3Surface >> copyWithFormat: format palette: palette colorspace: colorspace props: props [

	^ self ffiLibrary
		  convertSurfaceAndColorspaceSurface: self
		  format: format
		  palette: palette
		  colorspace: colorspace
		  props: props
]

{ #category : '*SDL3-API' }
SDL3Surface >> destroy [

	^ self ffiLibrary destroySurface: self
]

{ #category : '*SDL3-API' }
SDL3Surface >> duplicate [

	^ self ffiLibrary duplicateSurface: self
]

{ #category : '*SDL3-API' }
SDL3Surface >> fillRectDstRect: rect color: color [

	^ self ffiLibrary fillSurfaceRectDst: self rect: rect color: color
]

{ #category : '*SDL3-API' }
SDL3Surface >> fillRectsDstRects: rects count: count color: color [

	^ self ffiLibrary
		  fillSurfaceRectsDst: self
		  rects: rects
		  count: count
		  color: color
]

{ #category : '*SDL3-API' }
SDL3Surface >> flip: flip [

	^ self ffiLibrary flipSurface: self flip: flip
]

{ #category : '*SDL3-API' }
SDL3Surface >> getAlphaModIntoAlpha: alpha [

	^ self ffiLibrary getSurfaceAlphaModSurface: self alpha: alpha
]

{ #category : '*SDL3-API' }
SDL3Surface >> getBlendModeIntoBlendMode: blendMode [

	^ self ffiLibrary
		  getSurfaceBlendModeSurface: self
		  blendMode: blendMode
]

{ #category : '*SDL3-API' }
SDL3Surface >> getClipRectInto: rect [

	^ self ffiLibrary getSurfaceClipRectSurface: self rect: rect
]

{ #category : '*SDL3-API' }
SDL3Surface >> getColorKeyInto: key [

	^ self ffiLibrary getSurfaceColorKeySurface: self key: key
]

{ #category : '*SDL3-API' }
SDL3Surface >> getColorModIntoR: r g: g b: b [

	^ self ffiLibrary
		  getSurfaceColorModSurface: self
		  r: r
		  g: g
		  b: b
]

{ #category : '*SDL3-API' }
SDL3Surface >> getImagesIntoCount: count [

	^ self ffiLibrary getSurfaceImagesSurface: self count: count
]

{ #category : '*SDL3-API' }
SDL3Surface >> hasAlternateImages [

	^ self ffiLibrary surfaceHasAlternateImages: self
]

{ #category : '*SDL3-API' }
SDL3Surface >> hasColorKey [

	^ self ffiLibrary surfaceHasColorKey: self
]

{ #category : '*SDL3-API' }
SDL3Surface >> hasRLE [

	^ self ffiLibrary surfaceHasRLE: self
]

{ #category : '*SDL3-API' }
SDL3Surface >> isRLEEnabled: enabled [

	^ self ffiLibrary setSurfaceRLESurface: self enabled: enabled
]

{ #category : '*SDL3-API' }
SDL3Surface >> lock [

	^ self ffiLibrary lockSurface: self
]

{ #category : '*SDL3-API' }
SDL3Surface >> mapRGBAR: r g: g b: b a: a [

	^ self ffiLibrary
		  mapSurfaceRGBASurface: self
		  r: r
		  g: g
		  b: b
		  a: a
]

{ #category : '*SDL3-API' }
SDL3Surface >> mapRGBR: r g: g b: b [

	^ self ffiLibrary
		  mapSurfaceRGBSurface: self
		  r: r
		  g: g
		  b: b
]

{ #category : '*SDL3-API' }
SDL3Surface >> newColorCursorHotX: hot_x hotY: hot_y [

	^ self ffiLibrary newColorCursorSurface: self hotX: hot_x hotY: hot_y
]

{ #category : '*SDL3-API' }
SDL3Surface >> newPalette [

	^ self ffiLibrary newSurfacePalette: self
]

{ #category : '*SDL3-API' }
SDL3Surface >> newSoftwareRenderer [

	^ self ffiLibrary newSoftwareRenderer: self
]

{ #category : '*SDL3-API' }
SDL3Surface >> newTrayIconTooltip: tooltip [

	^ self ffiLibrary newTrayIcon: self tooltip: tooltip
]

{ #category : '*SDL3-API' }
SDL3Surface >> palette [

	^ self ffiLibrary getSurfacePalette: self
]

{ #category : '*SDL3-API' }
SDL3Surface >> palette: palette [

	^ self ffiLibrary setSurfacePaletteSurface: self palette: palette
]

{ #category : '*SDL3-API' }
SDL3Surface >> premultiplyAlphaLinear: linear [

	^ self ffiLibrary premultiplySurfaceAlphaSurface: self linear: linear
]

{ #category : '*SDL3-API' }
SDL3Surface >> properties [

	^ self ffiLibrary getSurfaceProperties: self
]

{ #category : '*SDL3-API' }
SDL3Surface >> readPixelFloatX: x y: y r: r g: g b: b a: a [

	^ self ffiLibrary
		  readSurfacePixelFloatSurface: self
		  x: x
		  y: y
		  r: r
		  g: g
		  b: b
		  a: a
]

{ #category : '*SDL3-API' }
SDL3Surface >> readPixelX: x y: y r: r g: g b: b a: a [

	^ self ffiLibrary
		  readSurfacePixelSurface: self
		  x: x
		  y: y
		  r: r
		  g: g
		  b: b
		  a: a
]

{ #category : '*SDL3-API' }
SDL3Surface >> removeAlternateImages [

	^ self ffiLibrary removeSurfaceAlternateImages: self
]

{ #category : '*SDL3-API' }
SDL3Surface >> rotateAngle: angle [

	^ self ffiLibrary rotateSurface: self angle: angle
]

{ #category : '*SDL3-API' }
SDL3Surface >> saveBMPFile: file [

	^ self ffiLibrary saveBMPSurface: self file: file
]

{ #category : '*SDL3-API' }
SDL3Surface >> saveBMPIODst: dst closeio: closeio [

	^ self ffiLibrary saveBMPIOSurface: self dst: dst closeio: closeio
]

{ #category : '*SDL3-API' }
SDL3Surface >> savePNGFile: file [

	^ self ffiLibrary savePNGSurface: self file: file
]

{ #category : '*SDL3-API' }
SDL3Surface >> savePNGIODst: dst closeio: closeio [

	^ self ffiLibrary savePNGIOSurface: self dst: dst closeio: closeio
]

{ #category : '*SDL3-API' }
SDL3Surface >> scaleWidth: width height: height scaleMode: scaleMode [

	^ self ffiLibrary
		  scaleSurface: self
		  width: width
		  height: height
		  scaleMode: scaleMode
]

{ #category : '*SDL3-API' }
SDL3Surface >> stretchSrcrect: srcrect dst: dst dstrect: dstrect scaleMode: scaleMode [

	^ self ffiLibrary
		  stretchSurfaceSrc: self
		  srcrect: srcrect
		  dst: dst
		  dstrect: dstrect
		  scaleMode: scaleMode
]

{ #category : '*SDL3-API' }
SDL3Surface >> unlock [

	^ self ffiLibrary unlockSurface: self
]

{ #category : '*SDL3-API' }
SDL3Surface >> writePixelFloatX: x y: y r: r g: g b: b a: a [

	^ self ffiLibrary
		  writeSurfacePixelFloatSurface: self
		  x: x
		  y: y
		  r: r
		  g: g
		  b: b
		  a: a
]

{ #category : '*SDL3-API' }
SDL3Surface >> writePixelX: x y: y r: r g: g b: b a: a [

	^ self ffiLibrary
		  writeSurfacePixelSurface: self
		  x: x
		  y: y
		  r: r
		  g: g
		  b: b
		  a: a
]
