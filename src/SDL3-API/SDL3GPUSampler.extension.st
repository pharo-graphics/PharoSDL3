Extension { #name : 'SDL3GPUSampler' }

{ #category : '*SDL3-API' }
SDL3GPUSampler >> releaseFromGPUDevice [

	device ffiLibrary releaseGPUSamplerDevice: device sampler: self
]
