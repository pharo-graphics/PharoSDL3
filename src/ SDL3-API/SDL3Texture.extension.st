Extension { #name : 'SDL3Texture' }

{ #category : '* SDL3-API' }
SDL3Texture >> alphaModAlpha: alpha [

	^ self ffiLibrary setTextureAlphaModTexture: self alpha: alpha
]

{ #category : '* SDL3-API' }
SDL3Texture >> alphaModFloatAlpha: alpha [

	^ self ffiLibrary setTextureAlphaModFloatTexture: self alpha: alpha
]

{ #category : '* SDL3-API' }
SDL3Texture >> blendModeBlendMode: blendMode [

	^ self ffiLibrary
		  setTextureBlendModeTexture: self
		  blendMode: blendMode
]

{ #category : '* SDL3-API' }
SDL3Texture >> colorModFloatR: r g: g b: b [

	^ self ffiLibrary
		  setTextureColorModFloatTexture: self
		  r: r
		  g: g
		  b: b
]

{ #category : '* SDL3-API' }
SDL3Texture >> colorModR: r g: g b: b [

	^ self ffiLibrary
		  setTextureColorModTexture: self
		  r: r
		  g: g
		  b: b
]

{ #category : '* SDL3-API' }
SDL3Texture >> destroy [

	^ self ffiLibrary destroyTexture: self
]

{ #category : '* SDL3-API' }
SDL3Texture >> getAlphaModFloatIntoAlpha: alpha [

	^ self ffiLibrary getTextureAlphaModFloatTexture: self alpha: alpha
]

{ #category : '* SDL3-API' }
SDL3Texture >> getAlphaModIntoAlpha: alpha [

	^ self ffiLibrary getTextureAlphaModTexture: self alpha: alpha
]

{ #category : '* SDL3-API' }
SDL3Texture >> getBlendModeIntoBlendMode: blendMode [

	^ self ffiLibrary
		  getTextureBlendModeTexture: self
		  blendMode: blendMode
]

{ #category : '* SDL3-API' }
SDL3Texture >> getColorModFloatIntoR: r g: g b: b [

	^ self ffiLibrary
		  getTextureColorModFloatTexture: self
		  r: r
		  g: g
		  b: b
]

{ #category : '* SDL3-API' }
SDL3Texture >> getColorModIntoR: r g: g b: b [

	^ self ffiLibrary
		  getTextureColorModTexture: self
		  r: r
		  g: g
		  b: b
]

{ #category : '* SDL3-API' }
SDL3Texture >> getScaleModeIntoScaleMode: scaleMode [

	^ self ffiLibrary
		  getTextureScaleModeTexture: self
		  scaleMode: scaleMode
]

{ #category : '* SDL3-API' }
SDL3Texture >> getSizeIntoW: w h: h [

	^ self ffiLibrary getTextureSizeTexture: self w: w h: h
]

{ #category : '* SDL3-API' }
SDL3Texture >> lockRect: rect pixels: pixels pitch: pitch [

	^ self ffiLibrary
		  lockTexture: self
		  rect: rect
		  pixels: pixels
		  pitch: pitch
]

{ #category : '* SDL3-API' }
SDL3Texture >> lockToSurfaceRect: rect surface: surface [

	^ self ffiLibrary
		  lockTextureToSurfaceTexture: self
		  rect: rect
		  surface: surface
]

{ #category : '* SDL3-API' }
SDL3Texture >> palette [

	^ self ffiLibrary getTexturePalette: self
]

{ #category : '* SDL3-API' }
SDL3Texture >> palette: palette [

	^ self ffiLibrary setTexturePaletteTexture: self palette: palette
]

{ #category : '* SDL3-API' }
SDL3Texture >> properties [

	^ self ffiLibrary getTextureProperties: self
]

{ #category : '* SDL3-API' }
SDL3Texture >> renderer [

	^ self ffiLibrary getRendererFromTexture: self
]

{ #category : '* SDL3-API' }
SDL3Texture >> scaleMode: scaleMode [

	^ self ffiLibrary
		  setTextureScaleModeTexture: self
		  scaleMode: scaleMode
]

{ #category : '* SDL3-API' }
SDL3Texture >> unlock [

	^ self ffiLibrary unlockTexture: self
]

{ #category : '* SDL3-API' }
SDL3Texture >> updateNVRect: rect Yplane: Yplane Ypitch: Ypitch UVplane: UVplane UVpitch: UVpitch [

	^ self ffiLibrary
		  updateNVTexture: self
		  rect: rect
		  Yplane: Yplane
		  Ypitch: Ypitch
		  UVplane: UVplane
		  UVpitch: UVpitch
]

{ #category : '* SDL3-API' }
SDL3Texture >> updateRect: rect pixels: pixels pitch: pitch [

	^ self ffiLibrary
		  updateTexture: self
		  rect: rect
		  pixels: pixels
		  pitch: pitch
]

{ #category : '* SDL3-API' }
SDL3Texture >> updateYUVRect: rect Yplane: Yplane Ypitch: Ypitch Uplane: Uplane Upitch: Upitch Vplane: Vplane Vpitch: Vpitch [

	^ self ffiLibrary
		  updateYUVTexture: self
		  rect: rect
		  Yplane: Yplane
		  Ypitch: Ypitch
		  Uplane: Uplane
		  Upitch: Upitch
		  Vplane: Vplane
		  Vpitch: Vpitch
]
