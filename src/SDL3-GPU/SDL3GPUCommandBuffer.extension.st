Extension { #name : 'SDL3GPUCommandBuffer' }

{ #category : '*SDL3-GPU' }
SDL3GPUCommandBuffer >> uploadToGPUDo: aBlock [
	"Yields an uploader using an already active copy pass on this command buffer."

	self copyPassDo: [ :copyPass |
		SDL3GPUUploader on: self device copyPass: copyPass do: aBlock ]
]
