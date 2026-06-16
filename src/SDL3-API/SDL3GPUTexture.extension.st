Extension { #name : 'SDL3GPUTexture' }

{ #category : '*SDL3-API' }
SDL3GPUTexture >> releaseFromGPUDevice [

	device ffiLibrary releaseGPUTextureDevice: device texture: self
]
