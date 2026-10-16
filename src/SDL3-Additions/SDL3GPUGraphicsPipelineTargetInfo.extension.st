Extension { #name : 'SDL3GPUGraphicsPipelineTargetInfo' }

{ #category : '*SDL3-Additions' }
SDL3GPUGraphicsPipelineTargetInfo >> colorDescriptions: descArray [

	self
		colorTargetDescriptions: descArray;
		numColorTargets: descArray size
]
