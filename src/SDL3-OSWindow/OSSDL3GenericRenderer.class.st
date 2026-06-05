"
My instances implement OSWindowGenericRenderer interface by wrapping a SDL3 renderer.

I provide hardware-accelerated 2D drawing operations using the SDL3 Renderer API.
"
Class {
	#name : 'OSSDL3GenericRenderer',
	#superclass : 'OSSDL3Renderer',
	#instVars : [
		'staticTextureCache',
		'activeBlendMode',
		'activeRed',
		'activeGreen',
		'activeBlue',
		'activeAlpha',
		'renderTargetTextureCache',
		'currentRenderTarget',
		'textureForObjectCache',
		'subpixelFontFirstPassBlendMode',
		'subpixelFontSecondPassBlendMode',
		'premultipliedCompositeAlphaBlending'
	],
	#pools : [
		'SDL3ZConstants'
	],
	#category : 'SDL3-OSWindow-Renderers',
	#package : 'SDL3-OSWindow',
	#tag : 'Renderers'
}

{ #category : 'rendering' }
OSSDL3GenericRenderer >> clear [
	sdl3Renderer renderClear
]

{ #category : 'rendering' }
OSSDL3GenericRenderer >> clippingBounds: aRectangle [
	sdl3Renderer renderClipRect: (SDL3Rect newFrom: aRectangle)
]

{ #category : 'rendering' }
OSSDL3GenericRenderer >> color: aColor [
	activeRed := self mapColorChannel: aColor red.
	activeGreen := self mapColorChannel: aColor green.
	activeBlue := self mapColorChannel: aColor blue.
	activeAlpha := self mapColorChannel: aColor alpha.
	sdl3Renderer renderDrawColorR: activeRed g: activeGreen b: activeBlue a: activeAlpha
]

{ #category : 'resources' }
OSSDL3GenericRenderer >> createRenderTargetTextureWithExtent: anExtent [
	| texture |
	texture := sdl3Renderer newTextureFormat: SDL3PixelFormat argb8888 access: SDL3TextureAccess target w: anExtent x h: anExtent y.
	^ OSSDL3WindowRendererTexture new
		extent: anExtent copy;
		handle: texture;
		yourself
]

{ #category : 'initialization' }
OSSDL3GenericRenderer >> createSDL3Renderer [

	sdl3Renderer := backendWindow sdlWindow newRenderer.

	self useNoBlending;
		color: Color white
]

{ #category : 'private' }
OSSDL3GenericRenderer >> createStaticTextureFromForm32: form [
	| texture |
	self assert: form depth = 32.
	texture := sdl3Renderer newTextureFormat: SDL3PixelFormat argb8888 access: SDL3TextureAccess static w: form width h: form height.
	form unhibernate.
	texture updateRect: nil pixels: form bits pitch: form width * FFIUInt32 externalTypeSize.
	^ OSSDL3WindowRendererTexture new
		extent: form extent copy;
		handle: texture;
		yourself
]

{ #category : 'private' }
OSSDL3GenericRenderer >> createStaticTextureFromForm: form [
	form depth = 32 ifTrue: [ ^ self createStaticTextureFromForm32: form ].
	^ self createStaticTextureFromForm: (form asFormOfDepth: 32)
]

{ #category : 'resources' }
OSSDL3GenericRenderer >> createTextureForObjectWithExtent: anExtent [
	| texture |
	texture := sdl3Renderer newTextureFormat: SDL3PixelFormat argb8888 access: SDL3TextureAccess static w: anExtent x h: anExtent y.
	^ OSSDL3WindowRendererTexture new
		extent: anExtent copy;
		handle: texture;
		yourself
]

{ #category : 'rendering' }
OSSDL3GenericRenderer >> drawLine: startPoint end: endPoint [
	sdl3Renderer renderLineX1: startPoint x asFloat y1: startPoint y asFloat x2: endPoint x asFloat y2: endPoint y asFloat
]

{ #category : 'rendering' }
OSSDL3GenericRenderer >> drawPoint: aPoint [
	sdl3Renderer renderPointX: aPoint x asFloat y: aPoint y asFloat
]

{ #category : 'rendering' }
OSSDL3GenericRenderer >> drawRectangle: aRectangle [
	sdl3Renderer renderRect: (SDL3FRect newFrom: aRectangle)
]

{ #category : 'rendering' }
OSSDL3GenericRenderer >> drawTexture: texture in: aRectangle [
	self setupTextureBlendingState: texture handle.
	sdl3Renderer renderTexture: texture handle srcrect: nil dstrect: (SDL3FRect newFrom: aRectangle)
]

{ #category : 'rendering' }
OSSDL3GenericRenderer >> drawTexture: texture rectangle: sourceRectangle in: destRectangle [
	self setupTextureBlendingState: texture handle.
	sdl3Renderer renderTexture: texture handle srcrect: (SDL3FRect newFrom: sourceRectangle) dstrect: (SDL3FRect newFrom: destRectangle)
]

{ #category : 'rendering' }
OSSDL3GenericRenderer >> fillRectangle: aRectangle [
	sdl3Renderer renderFillRect: (SDL3FRect newFrom: aRectangle)
]

{ #category : 'clipping' }
OSSDL3GenericRenderer >> fullClippingExtent [
	^ ExternalAddress allocate: 2 * FFIInt32 externalTypeSize bytesDuring: [ :buffer |
		 sdl3Renderer getCurrentRenderOutputSizeIntoW: buffer h: buffer + FFIInt32 externalTypeSize.
		 (buffer signedLongAt: 1) @ (buffer signedLongAt: 1 + FFIInt32 externalTypeSize) ]
]

{ #category : 'resources' }
OSSDL3GenericRenderer >> getOrCreateRenderTargetTextureFor: anObject withExtent: anExtent [
	| result |
	result := self renderTargetTextureCache at: anObject ifAbsentPut: [ self createRenderTargetTextureWithExtent: anExtent ].
	result extent ~= anExtent ifTrue: [
		result := self createRenderTargetTextureWithExtent: anExtent.
		self renderTargetTextureCache at: anObject put: result
	].
	^ result
]

{ #category : 'resources' }
OSSDL3GenericRenderer >> getOrCreateStaticTextureFromForm: form [
	^ self staticTextureCache at: form ifAbsentPut: [ self createStaticTextureFromForm: form ]
]

{ #category : 'resources' }
OSSDL3GenericRenderer >> getOrCreateTextureFor: anObject withExtent: anExtent [
	| result |
	result := self textureForObjectCache at: anObject ifAbsentPut: [ self createTextureForObjectWithExtent: anExtent ].
	result extent ~= anExtent ifTrue: [
		result := self createTextureForObjectWithExtent: anExtent.
		self textureForObjectCache at: anObject put: result
	].
	^ result
]

{ #category : 'resources' }
OSSDL3GenericRenderer >> getRenderTargetTextureForObjectOrNil: anObject [
	^ self renderTargetTextureCache at: anObject ifAbsent: [ nil ]
]

{ #category : 'resources' }
OSSDL3GenericRenderer >> getTextureForObjectOrNil: anObject [
	^ self textureForObjectCache at: anObject ifAbsent: [ nil ]
]

{ #category : 'private' }
OSSDL3GenericRenderer >> mapColorChannel: colorChannel [
	^ (colorChannel * 255) asInteger min: 255 max: 0
]

{ #category : 'clipping' }
OSSDL3GenericRenderer >> pixelExtent [
	^ self fullClippingExtent
]

{ #category : 'blending mode' }
OSSDL3GenericRenderer >> premultipliedCompositeAlphaBlending [
	^ premultipliedCompositeAlphaBlending ifNil: [premultipliedCompositeAlphaBlending :=
		LibSDL3 uniqueInstance composeCustomBlendModeSrcColorFactor: SDL3BlendFactor one dstColorFactor: SDL3BlendFactor oneMinusSrcAlpha colorOperation: SDL3BlendOperation add
		srcAlphaFactor: SDL3BlendFactor one dstAlphaFactor: SDL3BlendFactor oneMinusSrcAlpha alphaOperation: SDL3BlendOperation add ]
]

{ #category : 'private' }
OSSDL3GenericRenderer >> renderTargetTextureCache [
	^ renderTargetTextureCache ifNil: [ renderTargetTextureCache := WeakKeyDictionary new ]
]

{ #category : 'rendering' }
OSSDL3GenericRenderer >> setBlendMode: blendMode [
	activeBlendMode := blendMode.
	sdl3Renderer renderDrawBlendMode: blendMode
]

{ #category : 'rendering' }
OSSDL3GenericRenderer >> setupTextureBlendingState: texture [
	texture
		blendModeBlendMode: activeBlendMode;
		colorModR: activeRed g: activeGreen b: activeBlue;
		alphaModAlpha: activeAlpha
]

{ #category : 'private' }
OSSDL3GenericRenderer >> staticTextureCache [
	^ staticTextureCache ifNil: [ staticTextureCache := WeakKeyDictionary new ]
]

{ #category : 'blending mode' }
OSSDL3GenericRenderer >> subpixelFontFirstPassBlendMode [
	^ subpixelFontFirstPassBlendMode ifNil: [subpixelFontFirstPassBlendMode :=
		LibSDL3 uniqueInstance composeCustomBlendModeSrcColorFactor: SDL3BlendFactor zero dstColorFactor: SDL3BlendFactor oneMinusSrcColor colorOperation: SDL3BlendOperation add
		srcAlphaFactor: SDL3BlendFactor zero dstAlphaFactor: SDL3BlendFactor oneMinusSrcAlpha alphaOperation: SDL3BlendOperation add ]
]

{ #category : 'blending mode' }
OSSDL3GenericRenderer >> subpixelFontSecondPassBlendMode [
	^ subpixelFontSecondPassBlendMode ifNil: [subpixelFontSecondPassBlendMode :=
		LibSDL3 uniqueInstance composeCustomBlendModeSrcColorFactor: SDL3BlendFactor one dstColorFactor: SDL3BlendFactor one colorOperation: SDL3BlendOperation add
		srcAlphaFactor: SDL3BlendFactor one dstAlphaFactor: SDL3BlendFactor one alphaOperation: SDL3BlendOperation add ]
]

{ #category : 'testing' }
OSSDL3GenericRenderer >> supportsRenderTargets [
	"SDL3 renderers generally support render targets"
	^ true
]

{ #category : 'private' }
OSSDL3GenericRenderer >> textureForObjectCache [
	^ textureForObjectCache ifNil: [ textureForObjectCache := WeakKeyDictionary new ]
]

{ #category : 'rendering' }
OSSDL3GenericRenderer >> useAdditiveColorBlending [
	self setBlendMode: SDL_BLENDMODE_ADD
]

{ #category : 'rendering' }
OSSDL3GenericRenderer >> useCompositeAlphaBlending [
	self setBlendMode: SDL_BLENDMODE_BLEND
]

{ #category : 'rendering' }
OSSDL3GenericRenderer >> useModulatingColorBlending [
	self setBlendMode: SDL_BLENDMODE_MOD
]

{ #category : 'rendering' }
OSSDL3GenericRenderer >> useNoBlending [
	self setBlendMode: SDL_BLENDMODE_NONE
]

{ #category : 'rendering' }
OSSDL3GenericRenderer >> usePremultipliedCompositeAlphaBlending [
	self setBlendMode: self premultipliedCompositeAlphaBlending
]

{ #category : 'blending mode' }
OSSDL3GenericRenderer >> useSubpixelFontFirstPassBlending [
	self setBlendMode: self subpixelFontFirstPassBlendMode
]

{ #category : 'blending mode' }
OSSDL3GenericRenderer >> useSubpixelFontSecondPassBlending [
	self setBlendMode: self subpixelFontSecondPassBlendMode
]

{ #category : 'rendering' }
OSSDL3GenericRenderer >> withRenderTarget: aRenderTargetTexture do: aBlock [
	| oldRenderTarget |
	oldRenderTarget := currentRenderTarget.
	currentRenderTarget := aRenderTargetTexture ifNotNil: [ aRenderTargetTexture handle ].
	sdl3Renderer renderTargetTexture: currentRenderTarget.
	aBlock ensure: [
		currentRenderTarget := oldRenderTarget.
		sdl3Renderer renderTargetTexture: currentRenderTarget.
	]
]
