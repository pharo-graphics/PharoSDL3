Extension { #name : 'SDL3GPUFence' }

{ #category : '*SDL3-Additions' }
SDL3GPUFence >> releaseFromGPUDevice [

	device ffiLibrary releaseGPUFenceDevice: device fence: self
]
