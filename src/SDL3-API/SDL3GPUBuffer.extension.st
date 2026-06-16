Extension { #name : 'SDL3GPUBuffer' }

{ #category : '*SDL3-API' }
SDL3GPUBuffer >> releaseFromGPUDevice [

	device ffiLibrary releaseGPUBufferDevice: device buffer: self
]
