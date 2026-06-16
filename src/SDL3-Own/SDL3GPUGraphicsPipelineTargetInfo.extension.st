Extension { #name : 'SDL3GPUGraphicsPipelineTargetInfo' }

{ #category : '*SDL3-Own' }
SDL3GPUGraphicsPipelineTargetInfo >> colorDescriptions: descArray [

	self
		colorTargetDescriptions: descArray;
		numColorTargets: descArray size
]
