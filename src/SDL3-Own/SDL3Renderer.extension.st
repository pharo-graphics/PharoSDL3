Extension { #name : 'SDL3Renderer' }

{ #category : '*SDL3-Own' }
SDL3Renderer >> gpuRenderStateClear [
	"Use NULL to clear custom GPU render state"

	^ self gpuRenderState: ExternalAddress null
]

{ #category : '*SDL3-Own' }
SDL3Renderer >> logicalPresentationRect [

	| rectHolder |
	rectHolder := (FFIExternalValueHolder ofType: SDL_FRect) new.
	self getRenderLogicalPresentationRectInto: rectHolder.
	^ rectHolder value


]

{ #category : '*SDL3-Own' }
SDL3Renderer >> newRenderState: aBlock [

	| info |
	info := SDL3GPURenderStateCreateInfo externalNew.
	^ [
		aBlock value: info. 
		(self ffiLibrary
			newGPURenderStateRenderer: self
			createinfo: info)
			assertNotNullReturn;
			device: self gpuDevice;
			yourself
		] ensure: [ info free ]
]

{ #category : '*SDL3-Own' }
SDL3Renderer >> newTextureFromForm: aForm [
	"Answer a new `SDL_Texture`. The form pixels will be uploaded to the new texture, assuming form depth is 32 bits. Sender is responsible of destroying the texture."

	| surface texture |
	surface := aForm asUnownedNewSDL3Surface.
	texture := self newTextureFromSurface: surface.
	surface destroy.
	^ texture
]

{ #category : '*SDL3-Own' }
SDL3Renderer >> outputExtent [
	
	| widthHolder heightHolder |
	widthHolder := FFIInt32 newValueHolder.
	heightHolder := FFIInt32 newValueHolder.

	self getRenderOutputSizeIntoW: widthHolder h: heightHolder.
	^ widthHolder value @ heightHolder value
]

{ #category : '*SDL3-Own' }
SDL3Renderer >> propertyGroup [

	^ SDL3PropertyGroup id: self propertiesID
]

{ #category : '*SDL3-Own' }
SDL3Renderer >> renderDrawColor: aColor [

	^ self
		 renderDrawColorFloatR: aColor red
		 g: aColor green
		 b: aColor blue
		 a: aColor alpha
]

{ #category : '*SDL3-Own' }
SDL3Renderer >> scale [
	
	| widthHolder heightHolder |
	widthHolder := FFIFloat32 newValueHolder.
	heightHolder := FFIFloat32 newValueHolder.

	self getScaleIntoX: widthHolder y: heightHolder.
	^ widthHolder value @ heightHolder value
]
