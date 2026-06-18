Extension { #name : 'SDL3GPUCommandBuffer' }

{ #category : '*SDL3-Own' }
SDL3GPUCommandBuffer >> beginComputePassTextures: storageTextureBindings storageBuffers: storageBuffers [

	^ self
		 beginComputePassTextures: (storageTextureBindings ifEmpty: [ ExternalAddress null ])
		 count: storageTextureBindings size
		 storageBuffers: (storageBuffers ifEmpty: [ ExternalAddress null ])
		 count: storageBuffers size
]

{ #category : '*SDL3-Own' }
SDL3GPUCommandBuffer >> beginRenderPassTargets: colorTargetInfos [

	^ self beginRenderPassTargets: colorTargetInfos depthStencil: nil
]

{ #category : '*SDL3-Own' }
SDL3GPUCommandBuffer >> beginRenderPassTargets: colorTargetInfos depthStencil: depthStencilTargetInfo [

	^ self
		 beginRenderPassTargets: (colorTargetInfos ifEmpty: [ ExternalAddress null ])
		 count: colorTargetInfos size
		 depthStencil: depthStencilTargetInfo
]

{ #category : '*SDL3-Own' }
SDL3GPUCommandBuffer >> blitFrom: sourceTexture to: destinationTexture do: aBlock [

	| info |
	info := SDL3GPUBlitInfo externalNew.
	[ 
	info
		beSource: sourceTexture
		destination: destinationTexture
		filter: SDL3GPUFilter linear.
	aBlock value: info.
	^ self blit: info ] ensure: [ info free ]
]

{ #category : '*SDL3-Own' }
SDL3GPUCommandBuffer >> computePassTextures: texArray computeStorageBuffers: bufArray do: aBlock [

	| pass |
	pass := self beginComputePassTextures: texArray storageBuffers: bufArray.
	[ aBlock value: pass ] ensure: [ pass end ]
]

{ #category : '*SDL3-Own' }
SDL3GPUCommandBuffer >> copyPassDo: aBlock [

	| pass |
	pass := self beginCopyPass.
	[ aBlock value: pass ] ensure: [ pass end ]
]

{ #category : '*SDL3-Own' }
SDL3GPUCommandBuffer >> pushComputeUniform: data slot: slot [

	^ self
		  pushComputeUniformSlot: slot
		  data: data
		  length: data class structureSize
]

{ #category : '*SDL3-Own' }
SDL3GPUCommandBuffer >> pushFragmentUniform: data slot: slot [

	^ self
		  pushFragmentUniformSlot: slot
		  data: data
		  length: data class structureSize
]

{ #category : '*SDL3-Own' }
SDL3GPUCommandBuffer >> pushVertexUniform: data slot: slot [

	^ self
		  pushVertexUniformSlot: slot
		  data: data
		  length: data class structureSize
]

{ #category : '*SDL3-Own' }
SDL3GPUCommandBuffer >> renderPassTargets: targetArray depthStencil: depthInfo do: aBlock [

	| pass |
	pass := self beginRenderPassTargets: targetArray depthStencil: depthInfo.
	[ aBlock value: pass ] ensure: [ pass end ]
]

{ #category : '*SDL3-Own' }
SDL3GPUCommandBuffer >> renderPassTargets: targetArray do: aBlock [

	self renderPassTargets: targetArray depthStencil: nil do: aBlock
]

{ #category : '*SDL3-Own' }
SDL3GPUCommandBuffer >> uploadToGPUDo: aBlock [
	"Yields an uploader using an already active copy pass on this command buffer."

	self copyPassDo: [ :copyPass |
		SDL3GPUUploader on: self device copyPass: copyPass do: aBlock ]
]
