Extension { #name : 'SDL3GPUTransferBuffer' }

{ #category : '*SDL3-API' }
SDL3GPUTransferBuffer >> releaseFromGPUDevice [

	device ffiLibrary
		releaseGPUTransferBufferDevice: device
		transferBuffer: self
]
