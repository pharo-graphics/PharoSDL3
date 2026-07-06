Extension { #name : 'SDL3GPUBuffer' }

{ #category : '*SDL3-Own' }
SDL3GPUBuffer >> releaseFromGPUDevice [

	device ffiLibrary releaseGPUBufferDevice: device buffer: self
]
