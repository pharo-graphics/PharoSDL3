Extension { #name : 'SDL3GPUSampler' }

{ #category : '*SDL3-Additions' }
SDL3GPUSampler >> releaseFromGPUDevice [

	device ffiLibrary releaseGPUSamplerDevice: device sampler: self
]
