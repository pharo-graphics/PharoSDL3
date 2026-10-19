"
I am a SDL3 FFI binding for `SDL_Surface`.

A collection of pixels used in software blitting.

See: https://wiki.libsdl.org/SDL3/SDL_Surface
"
Class {
	#name : 'SDL3Surface',
	#superclass : 'SDL3Structure',
	#classVars : [
		'OFFSET_FLAGS',
		'OFFSET_FORMAT',
		'OFFSET_H',
		'OFFSET_PITCH',
		'OFFSET_PIXELS',
		'OFFSET_REFCOUNT',
		'OFFSET_RESERVED',
		'OFFSET_W'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'field definition' }
SDL3Surface class >> fieldsDesc [

	^ #(
	SDL_SurfaceFlags flags;
	SDL_PixelFormat format;
	int w;
	int h;
	int pitch;
	void* pixels;
	int refcount;
	void* reserved
	)
]

{ #category : 'instance creation' }
SDL3Surface class >> unownedNewFromWidth: width height: height format: aFormat pixels: pixels pitch: pitch [

	^ (self ffiLibrary
		   createSurfaceFromWidth: width
		   height: height
		   format: aFormat
		   pixels: pixels
		   pitch: pitch)
		  assertNotNullReturn;
		  yourself
]

{ #category : 'instance creation' }
SDL3Surface class >> unownedNewWidth: width height: height format: aFormat [

	^ (self ffiLibrary
		   createSurfaceWidth: width
		   height: height
		   format: aFormat)
		  assertNotNullReturn;
		  yourself
]

{ #category : 'operations' }
SDL3Surface >> addAlternateImage: image [

	self ffiLibrary assertSuccess:
		(self ffiLibrary addSurfaceAlternateImageSurface: self image: image)
]

{ #category : 'accessing' }
SDL3Surface >> alphaModAlpha: alpha [

	self ffiLibrary assertSuccess:
		(self ffiLibrary setSurfaceAlphaModSurface: self alpha: alpha)
]

{ #category : 'converting' }
SDL3Surface >> asForm [
	"Answer a Form with my pixels."

	^ self format = SDL_PixelFormat argb8888
		ifTrue: [ self asFormARGB32 ]
		ifFalse: [
			| copy |
			copy := self unownedCopyWithFormat: SDL_PixelFormat argb8888.
			[ copy asForm ] ensure: [ copy destroy ] ]
]

{ #category : 'converting' }
SDL3Surface >> asFormARGB32 [
	"Answer a Form with my pixels. Assumes my format is SDL_PIXELFORMAT_ARGB8888."

	| result theData |
	self lock.
	theData := FFIArray
		fromHandle: self pixels getHandle
		type: FFIUInt32
		size: self w * self h.

	result := Form
		extent: self w @ self h
		depth: 32
		bits: (Bitmap newFrom: theData).

	self unlock.

	^ result
]

{ #category : 'accessing' }
SDL3Surface >> blendModeBlendMode: blendMode [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			setSurfaceBlendModeSurface: self
			blendMode: blendMode)
]

{ #category : 'drawing' }
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

{ #category : 'drawing' }
SDL3Surface >> blitScaledSrcrect: srcrect dst: dst dstrect: dstrect scaleMode: scaleMode [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			blitSurfaceScaledSrc: self
			srcrect: srcrect
			dst: dst
			dstrect: dstrect
			scaleMode: scaleMode)
]

{ #category : 'drawing' }
SDL3Surface >> blitSrcrect: srcrect dst: dst dstrect: dstrect [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			blitSurfaceSrc: self
			srcrect: srcrect
			dst: dst
			dstrect: dstrect)
]

{ #category : 'drawing' }
SDL3Surface >> blitTiledSrcrect: srcrect dst: dst dstrect: dstrect [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			blitSurfaceTiledSrc: self
			srcrect: srcrect
			dst: dst
			dstrect: dstrect)
]

{ #category : 'drawing' }
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

{ #category : 'drawing' }
SDL3Surface >> blitUncheckedScaledSrcrect: srcrect dst: dst dstrect: dstrect scaleMode: scaleMode [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			blitSurfaceUncheckedScaledSrc: self
			srcrect: srcrect
			dst: dst
			dstrect: dstrect
			scaleMode: scaleMode)
]

{ #category : 'drawing' }
SDL3Surface >> blitUncheckedSrcrect: srcrect dst: dst dstrect: dstrect [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			blitSurfaceUncheckedSrc: self
			srcrect: srcrect
			dst: dst
			dstrect: dstrect)
]

{ #category : 'drawing' }
SDL3Surface >> clearColor: aColor [
	"Clear the surface with a color."

	self
		clearR: aColor red
		g: aColor green
		b: aColor blue
		a: aColor alpha
]

{ #category : 'drawing' }
SDL3Surface >> clearR: r g: g b: b a: a [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			clearSurface: self
			r: r
			g: g
			b: b
			a: a)
]

{ #category : 'accessing' }
SDL3Surface >> clipRect: rect [

	self ffiLibrary assertSuccess:
		(self ffiLibrary setSurfaceClipRectSurface: self rect: rect)
]

{ #category : 'accessing' }
SDL3Surface >> colorAtX: x y: y [

	ExternalAddress
		allocateMemoryOfSizes: #(4 4 4 4)
		during: [ :r :g :b :a |
			self ffiLibrary assertSuccess: (self readPixelFloatX: x y: y r: r g: g b: b a: a).
			^ Color
				r: (r float32AtOffset: 0)
				g: (g float32AtOffset: 0)
				b: (b float32AtOffset: 0)
				alpha: (a float32AtOffset: 0) ]
]

{ #category : 'accessing' }
SDL3Surface >> colorKeyEnabled: enabled key: key [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			setSurfaceColorKeySurface: self
			enabled: enabled
			key: key)
]

{ #category : 'accessing' }
SDL3Surface >> colorModR: r g: g b: b [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			setSurfaceColorModSurface: self
			r: r
			g: g
			b: b)
]

{ #category : 'accessing' }
SDL3Surface >> colorspace [

	^ self ffiLibrary getSurfaceColorspace: self
]

{ #category : 'accessing' }
SDL3Surface >> colorspace: colorspace [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			setSurfaceColorspaceSurface: self
			colorspace: colorspace)
]

{ #category : 'finalization' }
SDL3Surface >> destroy [

	self ffiLibrary destroySurface: self
]

{ #category : 'finalization' }
SDL3Surface >> dispose [

	(handle isNil or: [ self isNull ]) ifTrue: [ ^ self ].
	self destroy.
	handle := nil
]

{ #category : 'accessing' }
SDL3Surface >> extent [

	^ self w @ self h
]

{ #category : 'drawing' }
SDL3Surface >> fillRectDstRect: rect color: color [

	self ffiLibrary assertSuccess:
		(self ffiLibrary fillSurfaceRectDst: self rect: rect color: color)
]

{ #category : 'drawing' }
SDL3Surface >> fillRectsDstRects: rects count: count color: color [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			fillSurfaceRectsDst: self
			rects: rects
			count: count
			color: color)
]

{ #category : 'accessing - structure variables' }
SDL3Surface >> flags [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_FLAGS
]

{ #category : 'accessing - structure variables' }
SDL3Surface >> flags: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_FLAGS put: anObject
]

{ #category : 'operations' }
SDL3Surface >> flip: flip [

	self ffiLibrary assertSuccess:
		(self ffiLibrary flipSurface: self flip: flip)
]

{ #category : 'accessing - structure variables' }
SDL3Surface >> format [
	"This method was automatically generated"
	^SDL3PixelFormat fromInteger: (handle unsignedLongAt: OFFSET_FORMAT)
]

{ #category : 'accessing - structure variables' }
SDL3Surface >> format: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_FORMAT put: anObject value
]

{ #category : 'accessing' }
SDL3Surface >> getAlphaModIntoAlpha: alpha [

	self ffiLibrary assertSuccess:
		(self ffiLibrary getSurfaceAlphaModSurface: self alpha: alpha)
]

{ #category : 'accessing' }
SDL3Surface >> getBlendModeIntoBlendMode: blendMode [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			getSurfaceBlendModeSurface: self
			blendMode: blendMode)
]

{ #category : 'accessing' }
SDL3Surface >> getClipRectInto: rect [

	self ffiLibrary assertSuccess:
		(self ffiLibrary getSurfaceClipRectSurface: self rect: rect)
]

{ #category : 'accessing' }
SDL3Surface >> getColorKeyInto: key [

	self ffiLibrary assertSuccess:
		(self ffiLibrary getSurfaceColorKeySurface: self key: key)
]

{ #category : 'accessing' }
SDL3Surface >> getColorModIntoR: r g: g b: b [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			getSurfaceColorModSurface: self
			r: r
			g: g
			b: b)
]

{ #category : 'accessing' }
SDL3Surface >> getImagesIntoCount: count [

	^ (self ffiLibrary getSurfaceImagesSurface: self count: count)
		  assertNotNullReturn;
		  yourself
]

{ #category : 'accessing - structure variables' }
SDL3Surface >> h [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_H
]

{ #category : 'accessing - structure variables' }
SDL3Surface >> h: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_H put: anObject
]

{ #category : 'testing' }
SDL3Surface >> hasAlternateImages [

	^ self ffiLibrary surfaceHasAlternateImages: self
]

{ #category : 'testing' }
SDL3Surface >> hasColorKey [

	^ self ffiLibrary surfaceHasColorKey: self
]

{ #category : 'testing' }
SDL3Surface >> hasRLE [

	^ self ffiLibrary surfaceHasRLE: self
]

{ #category : 'testing' }
SDL3Surface >> isRLEEnabled: enabled [

	self ffiLibrary assertSuccess:
		(self ffiLibrary setSurfaceRLESurface: self enabled: enabled)
]

{ #category : 'operations' }
SDL3Surface >> lock [

	self ffiLibrary assertSuccess: (self ffiLibrary lockSurface: self)
]

{ #category : 'accessing' }
SDL3Surface >> mapRGBAR: r g: g b: b a: a [

	^ self ffiLibrary
		  mapSurfaceRGBASurface: self
		  r: r
		  g: g
		  b: b
		  a: a
]

{ #category : 'accessing' }
SDL3Surface >> mapRGBR: r g: g b: b [

	^ self ffiLibrary
		  mapSurfaceRGBSurface: self
		  r: r
		  g: g
		  b: b
]

{ #category : 'accessing' }
SDL3Surface >> palette: palette [

	self ffiLibrary assertSuccess:
		(self ffiLibrary setSurfacePaletteSurface: self palette: palette)
]

{ #category : 'accessing' }
SDL3Surface >> paletteIfPresent: presentBlock ifAbsent: absentBlock [

	| result |
	result := self ffiLibrary getSurfacePalette: self.
	^ result isNull
		ifTrue: [ absentBlock value ]
		ifFalse: [ presentBlock value: result ]
]

{ #category : 'accessing' }
SDL3Surface >> paletteOrNil [

	^ self paletteIfPresent: [ :p | p ] ifAbsent: [ nil ]
]

{ #category : 'accessing - structure variables' }
SDL3Surface >> pitch [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_PITCH
]

{ #category : 'accessing - structure variables' }
SDL3Surface >> pitch: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_PITCH put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3Surface >> pixels [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_PIXELS) type: ExternalType void asPointerType
]

{ #category : 'accessing - structure variables' }
SDL3Surface >> pixels: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_PIXELS put: anObject getHandle.
]

{ #category : 'operations' }
SDL3Surface >> premultiplyAlphaLinear: linear [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			premultiplySurfaceAlphaSurface: self
			linear: linear)
]

{ #category : 'accessing' }
SDL3Surface >> propertiesID [

	^ self ffiLibrary getSurfaceProperties: self
]

{ #category : 'accessing' }
SDL3Surface >> propertyGroup [

	^ SDL3PropertyGroup id: self propertiesID
]

{ #category : 'operations' }
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

{ #category : 'operations' }
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

{ #category : 'accessing - structure variables' }
SDL3Surface >> refcount [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_REFCOUNT
]

{ #category : 'accessing - structure variables' }
SDL3Surface >> refcount: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_REFCOUNT put: anObject
]

{ #category : 'operations' }
SDL3Surface >> removeAlternateImages [

	self ffiLibrary removeSurfaceAlternateImages: self
]

{ #category : 'input/output' }
SDL3Surface >> saveBMPFile: file [

	self ffiLibrary assertSuccess:
		(self ffiLibrary saveBMPSurface: self file: file)
]

{ #category : 'input/output' }
SDL3Surface >> saveBMPIODst: dst closeio: closeIO [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			saveBMPIOSurface: self
			dst: dst
			closeio: closeIO)
]

{ #category : 'input/output' }
SDL3Surface >> savePNGFile: file [

	self ffiLibrary assertSuccess:
		(self ffiLibrary savePNGSurface: self file: file)
]

{ #category : 'input/output' }
SDL3Surface >> savePNGIODst: dst closeio: closeIO [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			savePNGIOSurface: self
			dst: dst
			closeio: closeIO)
]

{ #category : 'drawing' }
SDL3Surface >> stretchSrcrect: srcrect dst: dst dstrect: dstrect scaleMode: scaleMode [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			stretchSurfaceSrc: self
			srcrect: srcrect
			dst: dst
			dstrect: dstrect
			scaleMode: scaleMode)
]

{ #category : 'operations' }
SDL3Surface >> unlock [

	self ffiLibrary unlockSurface: self
]

{ #category : 'copying' }
SDL3Surface >> unownedCopyWithFormat: format [

	^ (self ffiLibrary convertSurface: self format: format)
		  assertNotNullReturn;
		  yourself
]

{ #category : 'copying' }
SDL3Surface >> unownedCopyWithFormat: format palette: palette colorspace: colorspace props: props [

	^ (self ffiLibrary
		   convertSurfaceAndColorspaceSurface: self
		   format: format
		   palette: palette
		   colorspace: colorspace
		   props: props)
		  assertNotNullReturn;
		  yourself
]

{ #category : 'copying' }
SDL3Surface >> unownedDuplicate [

	^ (self ffiLibrary duplicateSurface: self)
		  assertNotNullReturn;
		  yourself
]

{ #category : 'instance creation' }
SDL3Surface >> unownedNewColorCursorHotX: hotX hotY: hotY [

	^ (self ffiLibrary createColorCursorSurface: self hotX: hotX hotY: hotY)
		  assertNotNullReturn;
		  yourself
]

{ #category : 'instance creation' }
SDL3Surface >> unownedNewPalette [

	^ (self ffiLibrary createSurfacePalette: self)
		  assertNotNullReturn;
		  yourself
]

{ #category : 'instance creation' }
SDL3Surface >> unownedNewSoftwareRenderer [

	^ (self ffiLibrary createSoftwareRenderer: self)
		  assertNotNullReturn;
		  yourself
]

{ #category : 'instance creation' }
SDL3Surface >> unownedNewTrayIconTooltip: tooltip [

	^ self ffiLibrary createTrayIcon: self tooltip: tooltip
]

{ #category : 'copying' }
SDL3Surface >> unownedRotatedByDegrees: angle [

	^ (self ffiLibrary rotateSurface: self angle: angle)
		  assertNotNullReturn;
		  yourself
]

{ #category : 'copying' }
SDL3Surface >> unownedScaledToWidth: width height: height [

	^ self
		unownedScaledToWidth: width
		height: height
		scaleMode: SDL3ScaleMode linear
]

{ #category : 'copying' }
SDL3Surface >> unownedScaledToWidth: width height: height scaleMode: scalemode [

	^ (self ffiLibrary
		   scaleSurface: self
		   width: width
		   height: height
		   scaleMode: scalemode)
		  assertNotNullReturn;
		  yourself
]

{ #category : 'accessing - structure variables' }
SDL3Surface >> w [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_W
]

{ #category : 'accessing - structure variables' }
SDL3Surface >> w: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_W put: anObject
]

{ #category : 'operations' }
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

{ #category : 'operations' }
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
