Extension { #name : 'SDL3GPUComputePipeline' }

{ #category : '*SDL3-Additions' }
SDL3GPUComputePipeline >> releaseFromGPUDevice [

	device ffiLibrary
		releaseGPUComputePipelineDevice: device
		computePipeline: self
]
