Extension { #name : 'SDL3GPUVertexInputState' }

{ #category : '*SDL3-Own' }
SDL3GPUVertexInputState >> attributes: attrArray bindings: bindArray [

	self
		vertexAttributes: attrArray;
		numVertexAttributes: attrArray size;
		vertexBufferDescriptions: bindArray;
		numVertexBuffers: bindArray size
]
