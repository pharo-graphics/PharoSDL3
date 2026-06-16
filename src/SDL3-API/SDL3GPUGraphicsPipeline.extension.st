Extension { #name : 'SDL3GPUGraphicsPipeline' }

{ #category : '*SDL3-API' }
SDL3GPUGraphicsPipeline >> releaseFromGPUDevice [

	device ffiLibrary
		releaseGPUGraphicsPipelineDevice: device
		graphicsPipeline: self
]
