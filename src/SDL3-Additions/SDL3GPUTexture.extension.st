Extension { #name : 'SDL3GPUTexture' }

{ #category : '*SDL3-Additions' }
SDL3GPUTexture >> releaseFromGPUDevice [

	device ffiLibrary releaseGPUTextureDevice: device texture: self
]
