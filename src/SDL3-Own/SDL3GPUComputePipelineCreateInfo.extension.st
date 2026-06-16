Extension { #name : 'SDL3GPUComputePipelineCreateInfo' }

{ #category : '*SDL3-Own' }
SDL3GPUComputePipelineCreateInfo >> shader: aShader textures: t buffers: b [
	"Populate format, code, and entrypoint from a shader, and set counts."
	self
		format: aShader format;
		code: aShader code;
		codeSize: aShader codeSize;
		entrypoint: aShader entrypoint;
		numReadwriteStorageTextures: t;
		numReadwriteStorageBuffers: b
]
