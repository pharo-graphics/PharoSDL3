Extension { #name : 'SDL3GPUShader' }

{ #category : '*SDL3-Own' }
SDL3GPUShader >> releaseFromGPUDevice [

	device ffiLibrary releaseGPUShaderDevice: device shader: self
]
