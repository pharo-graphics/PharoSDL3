Extension { #name : 'SDL3GPUGraphicsPipeline' }

{ #category : '*SDL3-Own' }
SDL3GPUGraphicsPipeline >> releaseFromGPUDevice [

	device ffiLibrary
		releaseGPUGraphicsPipelineDevice: device
		graphicsPipeline: self
]
