"
I am an Athens renderer which uses SDL3.
"
Class {
	#name : 'OSSDL3AthensRenderer',
	#superclass : 'OSWindowAthensRenderer',
	#instVars : [
		'texture',
		'sdl3Renderer',
		'textureExtent',
		'mutex'
	],
	#pools : [
		'SDL3ZConstants'
	],
	#category : 'SDL3-OSWindow-Renderers',
	#package : 'SDL3-OSWindow',
	#tag : 'Renderers'
}

{ #category : 'instance creation' }
OSSDL3AthensRenderer class >> for: aWindowHandle [
	^ self basicNew
		initializeWindowHandle: aWindowHandle;
		yourself
]

{ #category : 'instance creation' }
OSSDL3AthensRenderer class >> new [
	self error: 'Use #for:'
]

{ #category : 'accessing' }
OSSDL3AthensRenderer >> athensSurface [
	^ mutex critical: [super athensSurface]
]

{ #category : 'deleting' }
OSSDL3AthensRenderer >> destroy [

	mutex critical: [
		texture ifNotNil: [ texture destroy ].
		texture := nil.
		sdl3Renderer ifNotNil: [ sdl3Renderer destroy ].
		sdl3Renderer := nil.
	].

	super destroy
]

{ #category : 'private' }
OSSDL3AthensRenderer >> drawTexturePixelsWith: aBlock [
	| pixels pitch externalForm |
	pixels := ExternalAddress new.
	pitch := ExternalAddress allocate: 4 bytesDuring: [:pitchHolder |
		texture lockRect: nil pixels: pixels pitch: pitchHolder.
		pitchHolder signedLongAt: 1 ].

	externalForm := OSSDL3ExternalForm extent: textureExtent depth: 32 bits: pixels.
	[
		aBlock value: externalForm
	] ensure: [
		texture unlock.
		externalForm destroySurface
	]
]

{ #category : 'initialization' }
OSSDL3AthensRenderer >> initialize [
	super initialize.
	mutex := Mutex new
]

{ #category : 'initialization' }
OSSDL3AthensRenderer >> initializeWindowHandle: aBackendWindow [
	self initialize.
	self backendWindow: aBackendWindow.
	sdl3Renderer := backendWindow sdl3Window newRenderer.
	mutex critical: [
		self resetResources.
	]
]

{ #category : 'updating screen' }
OSSDL3AthensRenderer >> pixelExtent [
	mutex critical: [
		(sdl3Renderer isNil or: [ sdl3Renderer isNull ]) ifFalse: [ 
			^ ExternalAddress allocate: 8 bytesDuring: [ :buffer |
		 		sdl3Renderer getCurrentRenderOutputSizeIntoW: buffer h: buffer + 4.
		 		(buffer signedLongAt: 1) @ (buffer signedLongAt: 5) ]
		].
	].
	^ super pixelExtent
]

{ #category : 'drawing' }
OSSDL3AthensRenderer >> prepareForDrawing [
	mutex critical: [
		| currentExtent |
		currentExtent := self pixelExtent.
		textureExtent ~= currentExtent ifTrue: [ self resized ].
	]
]

{ #category : 'updating screen' }
OSSDL3AthensRenderer >> present [
	mutex critical: [
		self validate ifFalse: [ ^ self ].
		sdl3Renderer
			renderClear;
			renderTexture: texture srcrect: nil dstrect: nil;
			renderPresent
	]
]

{ #category : 'private' }
OSSDL3AthensRenderer >> primitiveUpdateRectangle: rectangle externalForm: externalForm [
	externalForm getCanvas
		drawImage: athensSurface asForm at: rectangle origin sourceRect: rectangle
]

{ #category : 'updating resources' }
OSSDL3AthensRenderer >> resetResources [
	| extent |
	self checkSession.
	extent := self pixelExtent.
	athensSurface := AthensCairoSurface extent: extent.
	athensSurface deviceScale: extent / (backendWindow extent max: 1@1).

	texture ifNotNil: [
		texture destroy.
		texture := nil.
	].
	texture := sdl3Renderer
		newTextureFormat: SDL3PixelFormat xrgb8888 
		access: SDL3TextureAccess streaming 
		w: extent x
		h: extent y.
	textureExtent := extent
]

{ #category : 'updating screen' }
OSSDL3AthensRenderer >> resized [
	mutex critical: [
		self resetResources.
		super resized
	]
]

{ #category : 'accessing' }
OSSDL3AthensRenderer >> surface [
	^ mutex critical: [super surface]
]

{ #category : 'updating screen' }
OSSDL3AthensRenderer >> updateAll [
	mutex critical: [
		self validate ifFalse: [ ^ self ].

		self drawTexturePixelsWith: [ :textureForm |
			self primitiveUpdateRectangle: (0 @ 0 corner: textureExtent) externalForm: textureForm.
		].
	]
]

{ #category : 'updating screen' }
OSSDL3AthensRenderer >> updateRectangle: aRectangle [
	mutex critical: [
		| intersection |
		self validate ifFalse: [ ^ self ].
		intersection := aRectangle
			intersect: (0 @ 0 corner: textureExtent)
			ifNone: [ ^ self ].

		self drawTexturePixelsWith: [ :textureForm |
			self primitiveUpdateRectangle: intersection externalForm: textureForm
		].
	]
]

{ #category : 'updating screen' }
OSSDL3AthensRenderer >> updateRectangles: allDamage [
	mutex critical: [
		| fullBounds |
		self validate ifFalse: [ ^ self ].

		fullBounds := 0 @ 0 corner: textureExtent.
		self drawTexturePixelsWith: [ :textureForm |
			| intersection |
			allDamage do: [ :rectangle |
				intersection := rectangle intersect: fullBounds ifNone: [ nil ].
				intersection ifNotNil: [
					self primitiveUpdateRectangle: rectangle externalForm: textureForm.
				]
			].
		].
	]
]

{ #category : 'updating screen' }
OSSDL3AthensRenderer >> validate [
	self checkSession.
	athensSurface ifNil: [ ^ false ].
	(texture isNil or: [ texture isNull ]) ifTrue: [ ^ false ].
	(sdl3Renderer isNil or: [ sdl3Renderer isNull ]) ifTrue: [ ^ false ].
	^ true
]
