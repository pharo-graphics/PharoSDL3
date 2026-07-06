Extension { #name : 'SDL3GPUTexture' }

{ #category : '*SDL3-Own' }
SDL3GPUTexture >> releaseFromGPUDevice [

	device ffiLibrary releaseGPUTextureDevice: device texture: self
]
