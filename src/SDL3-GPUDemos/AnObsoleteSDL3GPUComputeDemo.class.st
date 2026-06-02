"
I demonstrate how to process textures using compute shaders in SDL3.
I apply a Gaussian blur filter in real-time.
"
Class {
	#name : 'AnObsoleteSDL3GPUComputeDemo',
	#superclass : 'AnObsoleteSDL3GPUClearDemo',
	#instVars : [
		'gpuPipeline',
		'vertexBuffer',
		'sampler',
		'texture',
		'colorTargetInfos',
		'vertexBufferBindings',
		'textureSamplerBindings',
		'indexBuffer',
		'indexBinding',
		'writeTexture',
		'blurRadius',
		'blurSpread',
		'brightness',
		'bufferIndex',
		'vertexTransferBuffer',
		'lastExtent',
		'filterGraph',
		'hBlurFilter',
		'vBlurFilter',
		'colorFilter',
		'colorMode',
		'computePipeline',
		'intermediateTexture',
		'uniforms',
		'storageTextureArray'
	],
	#category : 'SDL3-Tests-Quads',
	#package : 'SDL3-Tests',
	#tag : 'Quads'
}
