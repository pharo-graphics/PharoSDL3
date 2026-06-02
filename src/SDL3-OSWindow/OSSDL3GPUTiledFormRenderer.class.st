"
I am an OSWindow form renderer that uses the SDL3 GPU API to upload and present Form bits using a tiled backing store.
Instead of a single large texture, I maintain a grid of 256x256 tiles to localize updates and ensure robust pitch alignment.
"
Class {
	#name : 'OSSDL3GPUTiledFormRenderer',
	#superclass : 'OSWindowFormRenderer',
	#traits : 'LibTSDL3',
	#classTraits : 'LibTSDL3 classTrait',
	#instVars : [
		'gpuDevice',
		'tiles',
		'extent',
		'mutex',
		'gpuTextureFormat',
		'swapchainTextureHolder',
		'swapchainTextureLocation',
		'tileSourceLocation',
		'needsFlush',
		'deferFlush',
		'uploadStream'
	],
	#classVars : [
		'TileSize'
	],
	#pools : [
		'SDL3GPUTextureFormat',
		'SDL3GPUTextureUsageFlags'
	],
	#category : 'SDL3-OSWindow-Renderers',
	#package : 'SDL3-OSWindow',
	#tag : 'Renderers'
}

{ #category : 'initialization' }
OSSDL3GPUTiledFormRenderer class >> initialize [
	TileSize := 256
]

{ #category : 'morphic integration' }
OSSDL3GPUTiledFormRenderer >> deferUpdatesWhile: aBlock [
	"Defer screen updates during the execution of aBlock."

	deferFlush := true.
	aBlock ensure: [ 
		deferFlush := false.
		self flush ]
]

{ #category : 'deleting' }
OSSDL3GPUTiledFormRenderer >> destroy [
	"Destroy my SDL3 resources."

	mutex critical: [
		tiles ifNotNil: [
			tiles do: [ :tile | 
				tile isNull ifFalse: [ gpuDevice releaseGPUTexture: tile ] ].
			tiles removeAll ].

		uploadStream ifNotNil: [ 
			uploadStream destroy.
			uploadStream := nil ]  ]
]

{ #category : 'updating screen' }
OSSDL3GPUTiledFormRenderer >> flush [
	"Process any pending presentation to the screen."

	mutex critical: [
		| commandBuffer |

		"If nothing dirty to present, just return"
		needsFlush ifFalse: [ ^ self ].

		self validate ifFalse: [ ^ self ].
		
		commandBuffer := gpuDevice acquireGPUCommandBuffer.
		self privateFlush: commandBuffer ]
]

{ #category : 'tile logic' }
OSSDL3GPUTiledFormRenderer >> gridDimensionsFor: aPoint [
	^ (aPoint x + TileSize - 1 // TileSize) @ (aPoint y + TileSize - 1 // TileSize)
]

{ #category : 'initialization' }
OSSDL3GPUTiledFormRenderer >> initialize [

	super initialize.

	deferFlush := false.
	mutex := Mutex new.
	tiles := Dictionary new.
	needsFlush := false.

	"Pre-allocate pooled structures to avoid GC pressure in hot path"
	swapchainTextureHolder := (FFIExternalValueHolder ofType: SDL3GPUTexture) new.
	tileSourceLocation := SDL3GPUTextureLocation new.
	swapchainTextureLocation := SDL3GPUTextureLocation new
]

{ #category : 'private' }
OSSDL3GPUTiledFormRenderer >> initializeGPUResources [

	| gridDims |
	
	extent := form extent.
	
	uploadStream ifNil: [
		uploadStream := OSSDL3GPUUploadStream new ].
	uploadStream gpuDevice: gpuDevice.
	uploadStream resetForExtent: extent.

	"Remove tiles that are now outside the extent."
	gridDims := self gridDimensionsFor: extent.
	tiles keys select: [ :index | 
		index x >= gridDims x or: [ index y >= gridDims y ] 
	] thenDo: [ :index | 
		| tile |
		tile := tiles removeKey: index.
		gpuDevice releaseGPUTexture: tile ]
]

{ #category : 'accessing' }
OSSDL3GPUTiledFormRenderer >> outputExtent [
	
	^ backendWindow sdl3Window pixelExtent
]

{ #category : 'private' }
OSSDL3GPUTiledFormRenderer >> privateFlush: commandBuffer [
	"Composite visible tiles to swapchain"

	| copyPass gridDims |
	(commandBuffer
		acquireGPUSwapchainTextureForWindow: backendWindow sdl3Window
		into: swapchainTextureHolder
		width: nil
		height: nil).

	swapchainTextureHolder value isNull
		ifTrue: [ ^ commandBuffer cancel ].

	copyPass := commandBuffer beginGPUCopyPass.
	
	swapchainTextureLocation texture: swapchainTextureHolder value.
	
	gridDims := self gridDimensionsFor: extent.
	
	0 to: gridDims y - 1 do: [ :y |
		0 to: gridDims x - 1 do: [ :x |
			| index |
			index := x@y.
			
			"We only blit tiles that have been initialized (touched)"
			tiles at: index ifPresent: [ :tile |
				| tileRectangle |
				tileRectangle := self tileRectangleFor: index.
				
				tileSourceLocation texture: tile.
				swapchainTextureLocation x: tileRectangle left; y: tileRectangle top.
				
				copyPass 
					copyGPUTextureToTextureSource: tileSourceLocation 
					destination: swapchainTextureLocation 
					w: tileRectangle width
					h: tileRectangle height
					d: 1 
					cycle: false
		] ] ].
	
	copyPass end.

	commandBuffer submit.
	needsFlush := false
]

{ #category : 'tile logic' }
OSSDL3GPUTiledFormRenderer >> tileAt: aTileIndex [
	"Lazy-initialize and return the texture for the given tile index."

	^ tiles at: aTileIndex ifAbsentPut: [
		gpuDevice
			new2DGPUTextureFormat: SDL_GPU_TEXTUREFORMAT_B8G8R8A8_UNORM
			usage: SDL_GPU_TEXTUREUSAGE_SAMPLER | SDL_GPU_TEXTUREUSAGE_COLOR_TARGET
			width: TileSize
			height: TileSize ]
]

{ #category : 'tile logic' }
OSSDL3GPUTiledFormRenderer >> tileIndexFor: aPoint [

	^ aPoint x // TileSize @ (aPoint y // TileSize)
]

{ #category : 'tile logic' }
OSSDL3GPUTiledFormRenderer >> tileRectangleFor: indexPoint [

	| tileOrigin tileExtent |
	tileOrigin := indexPoint * TileSize.
	tileExtent := (extent - tileOrigin) min: TileSize @ TileSize.

	^ tileOrigin extent: tileExtent
]

{ #category : 'tile logic' }
OSSDL3GPUTiledFormRenderer >> tilesIntersecting: aRectangle do: aBlock [

	| minTile maxTile |
	minTile := self tileIndexFor: aRectangle origin.
	maxTile := self tileIndexFor: aRectangle corner - 1.
	
	minTile y to: maxTile y do: [ :y |
		minTile x to: maxTile x do: [ :x |
			aBlock value: x@y ] ]
]

{ #category : 'updating screen' }
OSSDL3GPUTiledFormRenderer >> updateAll [

	self updateRectangle: (0@0 extent: extent)
]

{ #category : 'updating screen' }
OSSDL3GPUTiledFormRenderer >> updateAreas: allDamage immediate: forceToScreen [

	| tileDamageMap |
	mutex critical: [
		self validate ifFalse: [ ^ self ].

		allDamage ifEmpty: [ ^ self ].

		"1. Map damage to affected tiles"
		tileDamageMap := Dictionary new.
		allDamage do: [ :rect |
			| intersection |
			intersection := rect intersect: (0@0 extent: extent) ifNone: [ nil ].
			(intersection isNotNil and: [ intersection area > 0 ]) ifTrue: [ 
				self tilesIntersecting: intersection do: [ :tileIndex |
					| tileRectangle damageInTile |
					tileRectangle := self tileRectangleFor: tileIndex.
					damageInTile := intersection intersect: tileRectangle.
					(damageInTile isNotNil and: [ damageInTile area > 0 ]) ifTrue: [
						(tileDamageMap at: tileIndex ifAbsentPut: [ OrderedCollection new ])
							add: damageInTile ] ] ] ].
		
		tileDamageMap ifEmpty: [ ^ self ].

		"2. Upload damage per tile via the Upload Stream"
		tileDamageMap keysAndValuesDo: [ :tileIndex :damages |
			| uploadRectangle |
			uploadRectangle := damages first.
			damages allButFirstDo: [ :d | uploadRectangle := uploadRectangle merge: d ].
			
			uploadStream 
				uploadForm: form
				region: uploadRectangle
				to: (self tileAt: tileIndex)
				at: (uploadRectangle origin - (tileIndex * TileSize)) ].
		
		uploadStream finish.

		needsFlush := true.

		"3. If forcing to screen OR not deferred, flush to swapchain."
		(forceToScreen or: [ deferFlush not ]) ifTrue: [ self flush ]
	]
]

{ #category : 'updating screen' }
OSSDL3GPUTiledFormRenderer >> updateRectangle: aRectangle [

	self updateAreas: { aRectangle } immediate: true
]

{ #category : 'events' }
OSSDL3GPUTiledFormRenderer >> updateToNewResolution [

	self validate
]

{ #category : 'private' }
OSSDL3GPUTiledFormRenderer >> validate [

	form ifNil: [ ^ false ].

	(gpuDevice isNil or: [ gpuDevice isNull ]) ifTrue: [
		"The SDL3GPUDevice is shared among windows"
		gpuDevice := OSSDL3Driver current gpuDevice.
		gpuDevice claimWindow: backendWindow sdl3Window ].

	(uploadStream isNil or: [ form extent ~= extent ]) ifTrue: [ 
		uploadStream ifNotNil: [ uploadStream resetForExtent: form extent ].
		self initializeGPUResources ].

	^ true
]
