Extension { #name : 'SDL3Surface' }

{ #category : '*SDL3-API' }
SDL3Surface >> addAlternateImage: image [

	self ffiLibrary assertSuccess:
		(self ffiLibrary addSurfaceAlternateImageSurface: self image: image)
]

{ #category : '*SDL3-API' }
SDL3Surface >> alphaModAlpha: alpha [

	self ffiLibrary assertSuccess:
		(self ffiLibrary setSurfaceAlphaModSurface: self alpha: alpha)
]

{ #category : '*SDL3-API' }
SDL3Surface >> blendModeBlendMode: blendMode [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			setSurfaceBlendModeSurface: self
			blendMode: blendMode)
]

{ #category : '*SDL3-API' }
SDL3Surface >> blit9GridSrcrect: srcrect leftWidth: leftWidth rightWidth: rightWidth topHeight: topHeight bottomHeight: bottomHeight scale: scale scaleMode: scaleMode dst: dst dstrect: dstrect [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			blitSurface9GridSrc: self
			srcrect: srcrect
			leftWidth: leftWidth
			rightWidth: rightWidth
			topHeight: topHeight
			bottomHeight: bottomHeight
			scale: scale
			scaleMode: scaleMode
			dst: dst
			dstrect: dstrect)
]

{ #category : '*SDL3-API' }
SDL3Surface >> blitScaledSrcrect: srcrect dst: dst dstrect: dstrect scaleMode: scaleMode [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			blitSurfaceScaledSrc: self
			srcrect: srcrect
			dst: dst
			dstrect: dstrect
			scaleMode: scaleMode)
]

{ #category : '*SDL3-API' }
SDL3Surface >> blitSrcrect: srcrect dst: dst dstrect: dstrect [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			blitSurfaceSrc: self
			srcrect: srcrect
			dst: dst
			dstrect: dstrect)
]

{ #category : '*SDL3-API' }
SDL3Surface >> blitTiledSrcrect: srcrect dst: dst dstrect: dstrect [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			blitSurfaceTiledSrc: self
			srcrect: srcrect
			dst: dst
			dstrect: dstrect)
]

{ #category : '*SDL3-API' }
SDL3Surface >> blitTiledWithScaleSrcrect: srcrect scale: scale scaleMode: scaleMode dst: dst dstrect: dstrect [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			blitSurfaceTiledWithScaleSrc: self
			srcrect: srcrect
			scale: scale
			scaleMode: scaleMode
			dst: dst
			dstrect: dstrect)
]

{ #category : '*SDL3-API' }
SDL3Surface >> blitUncheckedScaledSrcrect: srcrect dst: dst dstrect: dstrect scaleMode: scaleMode [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			blitSurfaceUncheckedScaledSrc: self
			srcrect: srcrect
			dst: dst
			dstrect: dstrect
			scaleMode: scaleMode)
]

{ #category : '*SDL3-API' }
SDL3Surface >> blitUncheckedSrcrect: srcrect dst: dst dstrect: dstrect [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			blitSurfaceUncheckedSrc: self
			srcrect: srcrect
			dst: dst
			dstrect: dstrect)
]

{ #category : '*SDL3-API' }
SDL3Surface >> clearR: r g: g b: b a: a [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			clearSurface: self
			r: r
			g: g
			b: b
			a: a)
]

{ #category : '*SDL3-API' }
SDL3Surface >> clipRect: rect [

	self ffiLibrary assertSuccess:
		(self ffiLibrary setSurfaceClipRectSurface: self rect: rect)
]

{ #category : '*SDL3-API' }
SDL3Surface >> colorKeyEnabled: enabled key: key [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			setSurfaceColorKeySurface: self
			enabled: enabled
			key: key)
]

{ #category : '*SDL3-API' }
SDL3Surface >> colorModR: r g: g b: b [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			setSurfaceColorModSurface: self
			r: r
			g: g
			b: b)
]

{ #category : '*SDL3-API' }
SDL3Surface >> colorspace [

	^ self ffiLibrary getSurfaceColorspace: self
]

{ #category : '*SDL3-API' }
SDL3Surface >> colorspace: colorspace [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			setSurfaceColorspaceSurface: self
			colorspace: colorspace)
]

{ #category : '*SDL3-API' }
SDL3Surface >> copyWithFormat: format [

	^ (self ffiLibrary convertSurface: self format: format)
		  assertNotNullReturn;
		  yourself
]

{ #category : '*SDL3-API' }
SDL3Surface >> copyWithFormat: format palette: palette colorspace: colorspace props: props [

	^ (self ffiLibrary
		   convertSurfaceAndColorspaceSurface: self
		   format: format
		   palette: palette
		   colorspace: colorspace
		   props: props)
		  assertNotNullReturn;
		  yourself
]

{ #category : '*SDL3-API' }
SDL3Surface >> destroy [

	self ffiLibrary destroySurface: self
]

{ #category : '*SDL3-API' }
SDL3Surface >> duplicate [

	^ (self ffiLibrary duplicateSurface: self)
		  assertNotNullReturn;
		  yourself
]

{ #category : '*SDL3-API' }
SDL3Surface >> fillRectDstRect: rect color: color [

	self ffiLibrary assertSuccess:
		(self ffiLibrary fillSurfaceRectDst: self rect: rect color: color)
]

{ #category : '*SDL3-API' }
SDL3Surface >> fillRectsDstRects: rects count: count color: color [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			fillSurfaceRectsDst: self
			rects: rects
			count: count
			color: color)
]

{ #category : '*SDL3-API' }
SDL3Surface >> flip: flip [

	self ffiLibrary assertSuccess:
		(self ffiLibrary flipSurface: self flip: flip)
]

{ #category : '*SDL3-API' }
SDL3Surface >> getAlphaModIntoAlpha: alpha [

	self ffiLibrary assertSuccess:
		(self ffiLibrary getSurfaceAlphaModSurface: self alpha: alpha)
]

{ #category : '*SDL3-API' }
SDL3Surface >> getBlendModeIntoBlendMode: blendMode [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			getSurfaceBlendModeSurface: self
			blendMode: blendMode)
]

{ #category : '*SDL3-API' }
SDL3Surface >> getClipRectInto: rect [

	self ffiLibrary assertSuccess:
		(self ffiLibrary getSurfaceClipRectSurface: self rect: rect)
]

{ #category : '*SDL3-API' }
SDL3Surface >> getColorKeyInto: key [

	self ffiLibrary assertSuccess:
		(self ffiLibrary getSurfaceColorKeySurface: self key: key)
]

{ #category : '*SDL3-API' }
SDL3Surface >> getColorModIntoR: r g: g b: b [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			getSurfaceColorModSurface: self
			r: r
			g: g
			b: b)
]

{ #category : '*SDL3-API' }
SDL3Surface >> getImagesIntoCount: count [

	^ (self ffiLibrary getSurfaceImagesSurface: self count: count)
		  assertNotNullReturn;
		  yourself
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

	self ffiLibrary assertSuccess:
		(self ffiLibrary setSurfaceRLESurface: self enabled: enabled)
]

{ #category : '*SDL3-API' }
SDL3Surface >> lock [

	self ffiLibrary assertSuccess: (self ffiLibrary lockSurface: self)
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
SDL3Surface >> newColorCursorHotX: hotX hotY: hotY [

	^ (self ffiLibrary newColorCursorSurface: self hotX: hotX hotY: hotY)
		  assertNotNullReturn;
		  yourself
]

{ #category : '*SDL3-API' }
SDL3Surface >> newPalette [

	^ (self ffiLibrary newSurfacePalette: self)
		  assertNotNullReturn;
		  yourself
]

{ #category : '*SDL3-API' }
SDL3Surface >> newSoftwareRenderer [

	^ (self ffiLibrary newSoftwareRenderer: self)
		  assertNotNullReturn;
		  yourself
]

{ #category : '*SDL3-API' }
SDL3Surface >> newTrayIconTooltip: tooltip [

	^ self ffiLibrary newTrayIcon: self tooltip: tooltip
]

{ #category : '*SDL3-API' }
SDL3Surface >> palette: palette [

	self ffiLibrary assertSuccess:
		(self ffiLibrary setSurfacePaletteSurface: self palette: palette)
]

{ #category : '*SDL3-API' }
SDL3Surface >> paletteIfPresent: presentBlock ifAbsent: absentBlock [

	| result |
	result := self ffiLibrary getSurfacePalette: self.
	^ result isNull
		ifTrue: [ absentBlock value ]
		ifFalse: [ presentBlock value: result ]
]

{ #category : '*SDL3-API' }
SDL3Surface >> paletteOrNil [

	^ self paletteIfPresent: [ :p | p ] ifAbsent: [ nil ]
]

{ #category : '*SDL3-API' }
SDL3Surface >> premultiplyAlphaLinear: linear [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			premultiplySurfaceAlphaSurface: self
			linear: linear)
]

{ #category : '*SDL3-API' }
SDL3Surface >> propertiesID [

	^ self ffiLibrary getSurfaceProperties: self
]

{ #category : '*SDL3-API' }
SDL3Surface >> readPixelFloatX: x y: y r: r g: g b: b a: a [

	self ffiLibrary assertSuccess: (self ffiLibrary
			 readSurfacePixelFloatSurface: self
			 x: x
			 y: y
			 r: r
			 g: g
			 b: b
			 a: a)
]

{ #category : '*SDL3-API' }
SDL3Surface >> readPixelX: x y: y r: r g: g b: b a: a [

	self ffiLibrary assertSuccess: (self ffiLibrary
			 readSurfacePixelSurface: self
			 x: x
			 y: y
			 r: r
			 g: g
			 b: b
			 a: a)
]

{ #category : '*SDL3-API' }
SDL3Surface >> removeAlternateImages [

	self ffiLibrary removeSurfaceAlternateImages: self
]

{ #category : '*SDL3-API' }
SDL3Surface >> rotateAngle: angle [

	^ (self ffiLibrary rotateSurface: self angle: angle)
		  assertNotNullReturn;
		  yourself
]

{ #category : '*SDL3-API' }
SDL3Surface >> saveBMPFile: file [

	self ffiLibrary assertSuccess:
		(self ffiLibrary saveBMPSurface: self file: file)
]

{ #category : '*SDL3-API' }
SDL3Surface >> saveBMPIODst: dst closeio: closeIO [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			saveBMPIOSurface: self
			dst: dst
			closeio: closeIO)
]

{ #category : '*SDL3-API' }
SDL3Surface >> savePNGFile: file [

	self ffiLibrary assertSuccess:
		(self ffiLibrary savePNGSurface: self file: file)
]

{ #category : '*SDL3-API' }
SDL3Surface >> savePNGIODst: dst closeio: closeIO [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			savePNGIOSurface: self
			dst: dst
			closeio: closeIO)
]

{ #category : '*SDL3-API' }
SDL3Surface >> scaleWidth: width height: height scaleMode: scalemode [

	^ (self ffiLibrary
		   scaleSurface: self
		   width: width
		   height: height
		   scaleMode: scalemode)
		  assertNotNullReturn;
		  yourself
]

{ #category : '*SDL3-API' }
SDL3Surface >> stretchSrcrect: srcrect dst: dst dstrect: dstrect scaleMode: scaleMode [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			stretchSurfaceSrc: self
			srcrect: srcrect
			dst: dst
			dstrect: dstrect
			scaleMode: scaleMode)
]

{ #category : '*SDL3-API' }
SDL3Surface >> unlock [

	self ffiLibrary unlockSurface: self
]

{ #category : '*SDL3-API' }
SDL3Surface >> writePixelFloatX: x y: y r: r g: g b: b a: a [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			writeSurfacePixelFloatSurface: self
			x: x
			y: y
			r: r
			g: g
			b: b
			a: a)
]

{ #category : '*SDL3-API' }
SDL3Surface >> writePixelX: x y: y r: r g: g b: b a: a [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			writeSurfacePixelSurface: self
			x: x
			y: y
			r: r
			g: g
			b: b
			a: a)
]
