Extension { #name : 'SDL3GPUFence' }

{ #category : '*SDL3-Own' }
SDL3GPUFence >> releaseFromGPUDevice [

	device ffiLibrary releaseGPUFenceDevice: device fence: self
]
