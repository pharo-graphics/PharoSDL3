Extension { #name : 'SDL3Texture' }

{ #category : '*SDL3-API' }
SDL3Texture >> alphaModAlpha: alpha [

	self ffiLibrary assertSuccess:
		(self ffiLibrary setTextureAlphaModTexture: self alpha: alpha)
]

{ #category : '*SDL3-API' }
SDL3Texture >> alphaModFloatAlpha: alpha [

	self ffiLibrary assertSuccess:
		(self ffiLibrary setTextureAlphaModFloatTexture: self alpha: alpha)
]

{ #category : '*SDL3-API' }
SDL3Texture >> blendModeBlendMode: blendMode [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			setTextureBlendModeTexture: self
			blendMode: blendMode)
]

{ #category : '*SDL3-API' }
SDL3Texture >> colorModFloatR: r g: g b: b [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			setTextureColorModFloatTexture: self
			r: r
			g: g
			b: b)
]

{ #category : '*SDL3-API' }
SDL3Texture >> colorModR: r g: g b: b [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			setTextureColorModTexture: self
			r: r
			g: g
			b: b)
]

{ #category : '*SDL3-API' }
SDL3Texture >> destroy [

	self ffiLibrary destroyTexture: self
]

{ #category : '*SDL3-API' }
SDL3Texture >> getAlphaModFloatIntoAlpha: alpha [

	self ffiLibrary assertSuccess:
		(self ffiLibrary getTextureAlphaModFloatTexture: self alpha: alpha)
]

{ #category : '*SDL3-API' }
SDL3Texture >> getAlphaModIntoAlpha: alpha [

	self ffiLibrary assertSuccess:
		(self ffiLibrary getTextureAlphaModTexture: self alpha: alpha)
]

{ #category : '*SDL3-API' }
SDL3Texture >> getBlendModeIntoBlendMode: blendMode [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			getTextureBlendModeTexture: self
			blendMode: blendMode)
]

{ #category : '*SDL3-API' }
SDL3Texture >> getColorModFloatIntoR: r g: g b: b [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			getTextureColorModFloatTexture: self
			r: r
			g: g
			b: b)
]

{ #category : '*SDL3-API' }
SDL3Texture >> getColorModIntoR: r g: g b: b [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			getTextureColorModTexture: self
			r: r
			g: g
			b: b)
]

{ #category : '*SDL3-API' }
SDL3Texture >> getScaleModeIntoScaleMode: scaleMode [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			getTextureScaleModeTexture: self
			scaleMode: scaleMode)
]

{ #category : '*SDL3-API' }
SDL3Texture >> getSizeIntoW: w h: h [

	self ffiLibrary assertSuccess:
		(self ffiLibrary getTextureSizeTexture: self w: w h: h)
]

{ #category : '*SDL3-API' }
SDL3Texture >> lockRect: rect pixels: pixels pitch: pitch [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			lockTexture: self
			rect: rect
			pixels: pixels
			pitch: pitch)
]

{ #category : '*SDL3-API' }
SDL3Texture >> lockToSurfaceRect: rect surface: surface [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			lockTextureToSurfaceTexture: self
			rect: rect
			surface: surface)
]

{ #category : '*SDL3-API' }
SDL3Texture >> palette: palette [

	self ffiLibrary assertSuccess:
		(self ffiLibrary setTexturePaletteTexture: self palette: palette)
]

{ #category : '*SDL3-API' }
SDL3Texture >> paletteIfPresent: presentBlock ifAbsent: absentBlock [

	| result |
	result := self ffiLibrary getTexturePalette: self.
	^ result isNull
		ifTrue: [ absentBlock value ]
		ifFalse: [ presentBlock value: result ]
]

{ #category : '*SDL3-API' }
SDL3Texture >> paletteOrNil [

	^ self paletteIfPresent: [ :p | p ] ifAbsent: [ nil ]
]

{ #category : '*SDL3-API' }
SDL3Texture >> propertiesID [

	^ self ffiLibrary getTextureProperties: self
]

{ #category : '*SDL3-API' }
SDL3Texture >> renderer [

	^ (self ffiLibrary getRendererFromTexture: self)
		  assertNotNullReturn;
		  yourself
]

{ #category : '*SDL3-API' }
SDL3Texture >> scaleMode: scaleMode [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			setTextureScaleModeTexture: self
			scaleMode: scaleMode)
]

{ #category : '*SDL3-API' }
SDL3Texture >> unlock [

	self ffiLibrary unlockTexture: self
]

{ #category : '*SDL3-API' }
SDL3Texture >> updateNVRect: rect yplane: Yplane ypitch: Ypitch uVplane: UVplane uVpitch: UVpitch [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			updateNVTexture: self
			rect: rect
			yplane: Yplane
			ypitch: Ypitch
			uVplane: UVplane
			uVpitch: UVpitch)
]

{ #category : '*SDL3-API' }
SDL3Texture >> updateRect: rect pixels: pixels pitch: pitch [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			updateTexture: self
			rect: rect
			pixels: pixels
			pitch: pitch)
]

{ #category : '*SDL3-API' }
SDL3Texture >> updateYUVRect: rect yplane: Yplane ypitch: Ypitch uplane: Uplane upitch: Upitch vplane: Vplane vpitch: Vpitch [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			updateYUVTexture: self
			rect: rect
			yplane: Yplane
			ypitch: Ypitch
			uplane: Uplane
			upitch: Upitch
			vplane: Vplane
			vpitch: Vpitch)
]
