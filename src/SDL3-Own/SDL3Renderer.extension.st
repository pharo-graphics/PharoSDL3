Extension { #name : 'SDL3Renderer' }

{ #category : '*SDL3-Own' }
SDL3Renderer >> gpuRenderStateClear [
	"Use NULL to clear custom GPU render state"

	^ self gpuRenderState: ExternalAddress null
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
SDL3Renderer >> renderDrawColor: aColor [

	^ self
		  renderDrawColorFloatR: aColor red
		  g: aColor green
		  b: aColor blue
		  a: aColor alpha
]
