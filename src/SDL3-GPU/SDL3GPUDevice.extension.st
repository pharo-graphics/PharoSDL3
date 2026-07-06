Extension { #name : 'SDL3GPUDevice' }

{ #category : '*SDL3-GPU' }
SDL3GPUDevice >> uploadToGPUDo: aBlock [
	"Acquires a command buffer, starts a copy pass, yields an uploader for batching, and submits the commands."

	SDL3GPUUploader on: self do: aBlock
]
