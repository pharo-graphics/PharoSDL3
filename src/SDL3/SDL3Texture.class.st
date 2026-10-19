"
I am a SDL3 FFI binding for `SDL_Texture`.

An efficient driver-specific representation of pixel data

See: https://wiki.libsdl.org/SDL3/SDL_Texture
"
Class {
	#name : 'SDL3Texture',
	#superclass : 'SDL3Structure',
	#classVars : [
		'OFFSET_FORMAT',
		'OFFSET_H',
		'OFFSET_REFCOUNT',
		'OFFSET_W'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'field definition' }
SDL3Texture class >> fieldsDesc [

	^ #(
	SDL_PixelFormat format;
	int w;
	int h;
	int refcount
	)
]

{ #category : 'accessing' }
SDL3Texture >> alphaModAlpha: alpha [

	self ffiLibrary assertSuccess:
		(self ffiLibrary setTextureAlphaModTexture: self alpha: alpha)
]

{ #category : 'accessing' }
SDL3Texture >> alphaModFloatAlpha: alpha [

	self ffiLibrary assertSuccess:
		(self ffiLibrary setTextureAlphaModFloatTexture: self alpha: alpha)
]

{ #category : 'accessing' }
SDL3Texture >> blendModeBlendMode: blendMode [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			setTextureBlendModeTexture: self
			blendMode: blendMode)
]

{ #category : 'accessing' }
SDL3Texture >> colorModFloatR: r g: g b: b [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			setTextureColorModFloatTexture: self
			r: r
			g: g
			b: b)
]

{ #category : 'accessing' }
SDL3Texture >> colorModR: r g: g b: b [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			setTextureColorModTexture: self
			r: r
			g: g
			b: b)
]

{ #category : 'finalization' }
SDL3Texture >> destroy [

	self ffiLibrary destroyTexture: self
]

{ #category : 'finalization' }
SDL3Texture >> dispose [

	(handle isNil or: [ self isNull ]) ifTrue: [ ^ self ].
	self destroy.
	handle := nil
]

{ #category : 'accessing' }
SDL3Texture >> extent [
	^ self w @ self h
]

{ #category : 'accessing' }
SDL3Texture >> floatExtent [
	"Use API to answer my (float) extent"

	| widthValueHolder heightValueHolder |
	widthValueHolder := FFIFloat32 newValueHolder.
	heightValueHolder := FFIFloat32 newValueHolder.

	self getSizeIntoW: widthValueHolder h: heightValueHolder.

	^ widthValueHolder value @ heightValueHolder value
]

{ #category : 'accessing - structure variables' }
SDL3Texture >> format [
	"This method was automatically generated"
	^SDL3PixelFormat fromInteger: (handle unsignedLongAt: OFFSET_FORMAT)
]

{ #category : 'accessing - structure variables' }
SDL3Texture >> format: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_FORMAT put: anObject value
]

{ #category : 'accessing' }
SDL3Texture >> getAlphaModFloatIntoAlpha: alpha [

	self ffiLibrary assertSuccess:
		(self ffiLibrary getTextureAlphaModFloatTexture: self alpha: alpha)
]

{ #category : 'accessing' }
SDL3Texture >> getAlphaModIntoAlpha: alpha [

	self ffiLibrary assertSuccess:
		(self ffiLibrary getTextureAlphaModTexture: self alpha: alpha)
]

{ #category : 'accessing' }
SDL3Texture >> getBlendModeIntoBlendMode: blendMode [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			getTextureBlendModeTexture: self
			blendMode: blendMode)
]

{ #category : 'accessing' }
SDL3Texture >> getColorModFloatIntoR: r g: g b: b [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			getTextureColorModFloatTexture: self
			r: r
			g: g
			b: b)
]

{ #category : 'accessing' }
SDL3Texture >> getColorModIntoR: r g: g b: b [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			getTextureColorModTexture: self
			r: r
			g: g
			b: b)
]

{ #category : 'accessing' }
SDL3Texture >> getScaleModeIntoScaleMode: scaleMode [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			getTextureScaleModeTexture: self
			scaleMode: scaleMode)
]

{ #category : 'accessing' }
SDL3Texture >> getSizeIntoW: w h: h [

	self ffiLibrary assertSuccess:
		(self ffiLibrary getTextureSizeTexture: self w: w h: h)
]

{ #category : 'accessing - structure variables' }
SDL3Texture >> h [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_H
]

{ #category : 'accessing - structure variables' }
SDL3Texture >> h: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_H put: anObject
]

{ #category : 'operations' }
SDL3Texture >> lockRect: rect pixels: pixels pitch: pitch [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			lockTexture: self
			rect: rect
			pixels: pixels
			pitch: pitch)
]

{ #category : 'operations' }
SDL3Texture >> lockToSurfaceRect: rect surface: surface [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			lockTextureToSurfaceTexture: self
			rect: rect
			surface: surface)
]

{ #category : 'accessing' }
SDL3Texture >> palette: palette [

	self ffiLibrary assertSuccess:
		(self ffiLibrary setTexturePaletteTexture: self palette: palette)
]

{ #category : 'accessing' }
SDL3Texture >> paletteIfPresent: presentBlock ifAbsent: absentBlock [

	| result |
	result := self ffiLibrary getTexturePalette: self.
	^ result isNull
		ifTrue: [ absentBlock value ]
		ifFalse: [ presentBlock value: result ]
]

{ #category : 'accessing' }
SDL3Texture >> paletteOrNil [

	^ self paletteIfPresent: [ :p | p ] ifAbsent: [ nil ]
]

{ #category : 'accessing' }
SDL3Texture >> propertiesID [

	^ self ffiLibrary getTextureProperties: self
]

{ #category : 'accessing' }
SDL3Texture >> propertyGroup [

	^ SDL3PropertyGroup id: self propertiesID
]

{ #category : 'accessing - structure variables' }
SDL3Texture >> refcount [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_REFCOUNT
]

{ #category : 'accessing - structure variables' }
SDL3Texture >> refcount: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_REFCOUNT put: anObject
]

{ #category : 'accessing' }
SDL3Texture >> renderer [

	^ (self ffiLibrary getRendererFromTexture: self)
		  assertNotNullReturn;
		  yourself
]

{ #category : 'accessing' }
SDL3Texture >> scaleMode: scaleMode [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			setTextureScaleModeTexture: self
			scaleMode: scaleMode)
]

{ #category : 'operations' }
SDL3Texture >> unlock [

	self ffiLibrary unlockTexture: self
]

{ #category : 'operations' }
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

{ #category : 'operations' }
SDL3Texture >> updateRect: rect pixels: pixels pitch: pitch [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			updateTexture: self
			rect: rect
			pixels: pixels
			pitch: pitch)
]

{ #category : 'operations' }
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

{ #category : 'accessing - structure variables' }
SDL3Texture >> w [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_W
]

{ #category : 'accessing - structure variables' }
SDL3Texture >> w: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_W put: anObject
]
