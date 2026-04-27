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
		'gpuTransferBuffer',
		'gpuTextureFormat',
		'swapchainTextureHolder',
		'externalForm',
		'needsFlush',
		'deferFlush',
		'gpuTransferBufferSize',
		'swapchainTextureLocation',
		'gpuTransferInfo',
		'tileSourceLocation',
		'tileSourceRegion'
	],
	#classVars : [
		'MaxBufferSize',
		'MinBufferSize',
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

{ #category : 'class initialization' }
OSSDL3GPUTiledFormRenderer class >> initialize [

	TileSize := 256.
	MinBufferSize := 16 * 1024 * 1024. "16MB"
	MaxBufferSize := 64 * 1024 * 1024  "64MB"
]

{ #category : 'initialization' }
OSSDL3GPUTiledFormRenderer class >> tileSize [

	^ TileSize
]

{ #category : 'initialization' }
OSSDL3GPUTiledFormRenderer class >> tileSize: anInteger [

	TileSize := anInteger
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
		tiles do: [ :tile | 
			gpuDevice releaseGPUTexture: tile ].
		tiles removeAll.

		gpuTransferBuffer ifNotNil: [
			gpuDevice releaseGPUTransferBuffer: gpuTransferBuffer.
			gpuTransferBuffer := nil ].

		externalForm ifNotNil: [
			externalForm destroySurface ].

		gpuDevice := nil ]
]

{ #category : 'updating screen' }
OSSDL3GPUTiledFormRenderer >> flush [
	"Process any pending presentation to the screen."

	mutex critical: [
		| commandBuffer |
		self validate ifFalse: [ ^ self ].
		
		needsFlush ifFalse: [ ^ self ].

		commandBuffer := gpuDevice acquireGPUCommandBuffer.
		commandBuffer assertNotNullReturn.

		self privateFlush: commandBuffer ]
]

{ #category : 'tile logic' }
OSSDL3GPUTiledFormRenderer >> gridDimensionsFor: aPoint [

	^ (aPoint x + TileSize - 1 // TileSize) @ (aPoint y + TileSize - 1 // TileSize)
]

{ #category : 'private' }
OSSDL3GPUTiledFormRenderer >> handleExtentChanged [
	"After a change in form extent:
	- Remove tiles that are now outside the new extent.
	- New tiles are be lazy-initialized."

	| gridDimensions |
	extent := form extent.
	
	gridDimensions := self gridDimensionsFor: extent.

	tiles keys
		select: [ :index | 
			index x >= gridDimensions x or: [ index y >= gridDimensions y ] ]
		thenDo: [ :index |
			| tile |
			tile := tiles removeKey: index.
			gpuDevice releaseGPUTexture: tile ]
]

{ #category : 'initialization' }
OSSDL3GPUTiledFormRenderer >> initialize [

	super initialize.
	deferFlush := false.
	mutex := Mutex new.
	needsFlush := false. "Update upload tiles and mark this flag"
	swapchainTextureHolder := (FFIExternalValueHolder ofType: SDL3GPUTexture) new.
	externalForm := OSSDL3ExternalForm new.
	tiles := Dictionary new
]

{ #category : 'private' }
OSSDL3GPUTiledFormRenderer >> initializeGPUDevice [

	gpuDevice := backendWindow gpuDevice.

	"Query swapchain format to match our internal texture for fast copies"
	gpuTextureFormat := self ffiLibrary 
		getGPUSwapchainTextureFormatDevice: gpuDevice 
		window: backendWindow sdl3Window.

	"Explicitly set VSYNC mode to avoid tearing"
	self ffiLibrary assertSuccess:
		(self ffiLibrary
			setGPUSwapchainParametersDevice: gpuDevice 
			window: backendWindow sdl3Window 
			swapchainComposition: SDL3GPUSwapchainComposition sdr 
			presentMode: SDL3GPUPresentMode vsync)
]

{ #category : 'private' }
OSSDL3GPUTiledFormRenderer >> initializeGPUResources [
	"We use a transfer buffer large enough for many tiles to allow batch uploads.
	 We adapt the size to the window extent (enough for one full update) 
	 but with a minimum and a maximum for initial allocation."
	
	| preferredSize |
	gpuTransferBuffer ifNotNil: [
		gpuDevice releaseGPUTransferBuffer: gpuTransferBuffer ].

	extent := form extent.
	preferredSize := extent x * extent y * 4.
	gpuTransferBufferSize := preferredSize min: MinBufferSize max: MaxBufferSize.

	gpuTransferBuffer := gpuDevice newUploadTransferBuffer: gpuTransferBufferSize.
	gpuTransferBuffer assertNotNullReturn.

	"Pre-allocate pooled structures to avoid GC pressure in hot path"
	gpuTransferInfo := SDL3GPUTextureTransferInfo new.
	gpuTransferInfo transferBuffer: gpuTransferBuffer.
	gpuTransferInfo pixelsPerRow: 0; rowsPerLayer: 0.
	gpuTransferInfo offset: 0.

	tileSourceRegion := SDL3GPUTextureRegion new.
	tileSourceRegion z: 0; d: 1; mipLevel: 0; layer: 0.

	tileSourceLocation := SDL3GPUTextureLocation new.
	tileSourceLocation x: 0; y: 0.
	tileSourceLocation z: 0; mipLevel: 0; layer: 0.

	swapchainTextureLocation := SDL3GPUTextureLocation new.
	swapchainTextureLocation z: 0; mipLevel: 0; layer: 0
]

{ #category : 'accessing' }
OSSDL3GPUTiledFormRenderer >> outputExtent [
	
	^ backendWindow sdl3Window pixelExtent
]

{ #category : 'private' }
OSSDL3GPUTiledFormRenderer >> privateFlush: commandBuffer [
	"Composite visible tiles to swapchain"

	| copyPass gridDimensions |
	(commandBuffer
		acquireGPUSwapchainTextureForWindow: backendWindow sdl3Window
		into: swapchainTextureHolder
		width: nil
		height: nil).
				
	swapchainTextureHolder value isNull ifTrue: [ 
		self ffiLibrary assertSuccess: commandBuffer submit.
		^ self ].
	
	swapchainTextureLocation texture: swapchainTextureHolder value.

	copyPass := commandBuffer beginGPUCopyPass.
		
	gridDimensions := self gridDimensionsFor: extent.
	
	0 to: gridDimensions y - 1 do: [ :y |
		0 to: gridDimensions x - 1 do: [ :x |
			| index tileOriginX tileOriginY |
			index := x@y.
			
			"We only blit tiles that have been initialized (touched)"
			tiles at: index ifPresent: [ :tile |
				tileSourceLocation texture: tile.

				tileOriginX := x * TileSize.
				tileOriginY := y * TileSize.
				swapchainTextureLocation x: tileOriginX; y: tileOriginY.
				
				copyPass 
					copyGPUTextureToTextureSource: tileSourceLocation 
					destination: swapchainTextureLocation 
					w: ((extent x - tileOriginX) min: TileSize)
					h: ((extent y - tileOriginY) min: TileSize)
					d: 1 
					cycle: false
		] ] ].
	
	copyPass end.

	self ffiLibrary assertSuccess: commandBuffer submit.
	needsFlush := false
]

{ #category : 'tile logic' }
OSSDL3GPUTiledFormRenderer >> tileAt: aTileIndex [
	"Lazy-initialize and return the texture for the given tile index."

	^ tiles at: aTileIndex ifAbsentPut: [
		  | tile |
		  tile := gpuDevice
			          new2DTextureFormat: gpuTextureFormat
			          usage: (SDL_GPU_TEXTUREUSAGE_SAMPLER | SDL_GPU_TEXTUREUSAGE_COLOR_TARGET) asInteger
			          width: TileSize
			          height: TileSize.
		  tile assertNotNullReturn.
		  tile ]
]

{ #category : 'tile logic' }
OSSDL3GPUTiledFormRenderer >> tileIndexFor: aPoint [

	^ aPoint x // TileSize @ (aPoint y // TileSize)
]

{ #category : 'tile logic' }
OSSDL3GPUTiledFormRenderer >> tileIndexesIntersecting: aRectangle do: aBlock [

	| minTile maxTile |
	minTile := self tileIndexFor: aRectangle origin.
	maxTile := self tileIndexFor: aRectangle corner - 1.
	
	minTile y to: maxTile y do: [ :y |
		minTile x to: maxTile x do: [ :x |
			aBlock value: x@y ] ]
]

{ #category : 'updating screen' }
OSSDL3GPUTiledFormRenderer >> updateAll [

	self updateAreas: { 0@0 extent: form extent } immediate: true
]

{ #category : 'updating screen' }
OSSDL3GPUTiledFormRenderer >> updateAreas: allDamage immediate: forceToScreen [

	| tileDamageMap mappedAddress commandBuffer currentOffset |
	mutex critical: [
		self validate ifFalse: [ ^ self ].

		allDamage ifEmpty: [ ^ self ].

		"1. Map damage to affected tiles"
		tileDamageMap := Dictionary new.
		allDamage do: [ :rect |
			| intersection |
			intersection := rect intersect: (0@0 extent: extent) ifNone: [ nil ].
			(intersection isNotNil and: [ intersection area > 0 ]) ifTrue: [ 
				self tileIndexesIntersecting: intersection do: [ :tileIndex |
					| damageInTile |
					damageInTile := intersection intersect:
						(tileIndex * TileSize extent: TileSize @ TileSize).
					(damageInTile isNotNil and: [ damageInTile area > 0 ]) ifTrue: [
						(tileDamageMap at: tileIndex ifAbsentPut: [ OrderedCollection new ])
							add: damageInTile ] ] ] ].
		
		tileDamageMap ifEmpty: [ ^ self ].

		"2. Capture and Upload damage per tile"
		mappedAddress := gpuDevice mapGPUTransferBuffer: gpuTransferBuffer cycle: true.
		mappedAddress isNull ifTrue: [ SDL3Error signalFromLibraryErrorMessage ].
		
		commandBuffer := gpuDevice acquireGPUCommandBuffer.
		commandBuffer assertNotNullReturn.

		currentOffset := 0.
		
		[ | copyPass |
			copyPass := commandBuffer beginGPUCopyPass.
			
			tileDamageMap keysAndValuesDo: [ :tileIndex :damages |
				| tileUnion inTileUnion localSurgicalRect globalSurgicalRect bytesNeeded |
				tileUnion := damages first.
				damages allButFirstDo: [ :d | tileUnion := tileUnion merge: d ].
				
				"Expand to FULL WIDTH of the tile to ensure 256-byte alignment (TileSize * 4 = 1024)"
				inTileUnion := tileUnion translateBy: (tileIndex * TileSize) negated.
				localSurgicalRect := 0 @ inTileUnion top extent: TileSize @ inTileUnion height.
				
				"Clip source rectangle to window extent to prevent reading out of bounds"
				globalSurgicalRect := (localSurgicalRect translateBy: (tileIndex * TileSize)) 
					intersect: (0@0 extent: extent).
				
				bytesNeeded := localSurgicalRect width * localSurgicalRect height * 4.
				
				"If this tile doesn't fit in the remaining buffer, flush and start a new batch"
				(currentOffset + bytesNeeded) > gpuTransferBufferSize ifTrue: [
					copyPass end.
					gpuDevice unmapGPUTransferBuffer: gpuTransferBuffer.
					self ffiLibrary assertSuccess: commandBuffer submit.
					
					"Start a new batch"
					mappedAddress := gpuDevice mapGPUTransferBuffer: gpuTransferBuffer cycle: true.
					mappedAddress isNull ifTrue: [ SDL3Error signalFromLibraryErrorMessage ].

					commandBuffer := gpuDevice acquireGPUCommandBuffer.
					commandBuffer assertNotNullReturn.
					copyPass := commandBuffer beginGPUCopyPass.
					currentOffset := 0 ].
				
				externalForm
					resetExtent: localSurgicalRect extent
					depth: 32
					pitch: TileSize * 4
					bits: mappedAddress + currentOffset.
				[ 
					"Clear the buffer slice first to avoid garbage on edge tiles"
					externalForm fill: (0@0 extent: localSurgicalRect extent) fillColor: Color transparent.

					"Copy from global form coordinates to the start of this buffer slice.
					 Destination X is relative to the tile's left edge."
					externalForm 
						copy: globalSurgicalRect 
						from: form 
						to: (globalSurgicalRect origin x - (tileIndex x * TileSize)) @ 0 
						rule: Form over
				] ensure: [ 
					externalForm destroySurface 
				].
				
				gpuTransferInfo offset: currentOffset.
				tileSourceRegion 
					texture: (self tileAt: tileIndex);
					x: 0; y: localSurgicalRect top; w: TileSize; h: localSurgicalRect height.
				
				copyPass
					uploadToGPUTextureSource: gpuTransferInfo
					destination: tileSourceRegion
					cycle: false.
				
				"Advance offset for the next tile"
				currentOffset := currentOffset + bytesNeeded.
			].
				
			copyPass end.
		] ensure: [ 
			gpuDevice unmapGPUTransferBuffer: gpuTransferBuffer
		].

		self ffiLibrary assertSuccess: commandBuffer submit.
		needsFlush := true.

		"3. If forcing to screen OR not deferred, flush to swapchain."
		(forceToScreen or: [ deferFlush not ]) ifTrue: [ self flush ]
	]
]

{ #category : 'private' }
OSSDL3GPUTiledFormRenderer >> validate [

	form ifNil: [ ^ false ].

	(gpuDevice isNil or: [ gpuDevice isNull ])
		ifTrue: [ self initializeGPUDevice ].

	gpuTransferBuffer ifNil: [ self initializeGPUResources ].

	(form extent ~= extent) ifTrue: [ self handleExtentChanged ].

	^ true
]
