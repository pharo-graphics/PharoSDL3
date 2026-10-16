Extension { #name : 'SDL3GPUBuffer' }

{ #category : '*SDL3-Additions' }
SDL3GPUBuffer >> releaseFromGPUDevice [

	device ffiLibrary releaseGPUBufferDevice: device buffer: self
]
