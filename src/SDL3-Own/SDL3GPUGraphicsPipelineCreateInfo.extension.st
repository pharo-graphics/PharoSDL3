Extension { #name : 'SDL3GPUGraphicsPipelineCreateInfo' }

{ #category : '*SDL3-Own' }
SDL3GPUGraphicsPipelineCreateInfo >> vertex: vShader fragment: fShader targets: targetArray [

	vShader ifNotNil: [ self vertexShader: vShader ].
	fShader ifNotNil: [ self fragmentShader: fShader ].
	self targetInfo colorDescriptions: targetArray
]
