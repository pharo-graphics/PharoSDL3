Extension { #name : 'SDL3GPUGraphicsPipelineCreateInfo' }

{ #category : '*SDL3-Own' }
SDL3GPUGraphicsPipelineCreateInfo >> vertex: vShader fragment: fShader targets: targetArray [

	vShader ifNotNil: [ 
		self vertexShader: vShader.
		self vertexMetadata: vShader metadata ].
	fShader ifNotNil: [ 
		self fragmentShader: fShader.
		self fragmentMetadata: fShader metadata ].
	self targetInfo colorDescriptions: targetArray
]
