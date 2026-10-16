"
I test SDL3GPUShaderMetadata scanning, descriptor space validation, and metadata serialization.
"
Class {
	#name : 'SDL3GPUShaderMetadataTest',
	#superclass : 'TestCase',
	#category : 'SDL3-GPU-Tests-ShaderMetadata',
	#package : 'SDL3-GPU-Tests',
	#tag : 'ShaderMetadata'
}

{ #category : 'tests' }
SDL3GPUShaderMetadataTest >> testBindingStoreOn [

	| binding1 binding2 |
	binding1 := SDL3GPUSamplerBinding index: 0 space: 2.
	self assert: binding1 storeString equals: '(SDL3GPUSamplerBinding index: 0 space: 2)'.

	binding2 := SDL3GPUUniformBinding index: 0 space: 1 linkedClass: SDL3GPUInstancedQuadUniforms.
	self assert: binding2 storeString equals: '(SDL3GPUUniformBinding index: 0 space: 1 linkedClass: SDL3GPUInstancedQuadUniforms)'
]

{ #category : 'tests' }
SDL3GPUShaderMetadataTest >> testScanDirectClassNaming [

	| hlsl metadata |
	hlsl := '
cbuffer SDL3GPUBoidsUniforms : register(b0, space2);
struct SDL3GPUNode { float x; };
StructuredBuffer<SDL3GPUNode> nodes : register(t0, space0);
'.
	metadata := SDL3GPUShaderMetadata scanFromSource: hlsl.

	self assert: metadata uniformBuffers first linkedClass equals: SDL3GPUBoidsUniforms.
	self assert: metadata storageBuffers first linkedClass equals: SDL3GPUNode
]

{ #category : 'tests' }
SDL3GPUShaderMetadataTest >> testScanEmptySource [

	| metadata vertexMetadata computeMetadata |
	metadata := SDL3GPUShaderMetadata scanFromSource: ''.

	self assert: metadata uniformBuffers isEmpty.
	self assert: metadata samplers isEmpty.
	self assert: metadata storageBuffers isEmpty.
	self assert: metadata storageTextures isEmpty.

	vertexMetadata := SDL3GPUVertexShaderMetadata scanFromSource: ''.

	self assert: vertexMetadata inputAttributes isEmpty.
	self deny: vertexMetadata hasCustomMetadata.

	computeMetadata := SDL3GPUComputeShaderMetadata scanFromSource: ''.

	self assert: computeMetadata threadCountX equals: 1.
	self assert: computeMetadata threadCountY equals: 1.
	self assert: computeMetadata threadCountZ equals: 1
]

{ #category : 'tests' }
SDL3GPUShaderMetadataTest >> testScanFragmentShader [

	| hlsl metadata |
	hlsl := 'float4 main() : SV_Target { return 0; }'.
	metadata := SDL3GPUFragmentShaderMetadata scanFromSource: hlsl.

	self assert: metadata class equals: SDL3GPUFragmentShaderMetadata
]

{ #category : 'tests' }
SDL3GPUShaderMetadataTest >> testScanSamplers [

	| hlsl metadata |
	hlsl := 'SamplerState sam : register(s0, space2);'.
	metadata := SDL3GPUShaderMetadata scanFromSource: hlsl.

	self assert: metadata samplers size equals: 1.
	self assert: metadata samplers first class equals: SDL3GPUSamplerBinding.
	self assert: metadata samplers first index equals: 0.
	self assert: metadata samplers first space equals: 2
]

{ #category : 'tests' }
SDL3GPUShaderMetadataTest >> testScanStorageBuffers [

	| hlsl metadata |
	hlsl := '
StructuredBuffer<Boid> boidsIn : register(t0, space0);
RWStructuredBuffer<Boid> boidsOut : register(u0, space1);
'.
	metadata := SDL3GPUComputeShaderMetadata scanFromSource: hlsl.

	self assert: metadata storageBuffers size equals: 2.
	self assert: metadata storageBuffers first class equals: SDL3GPUReadOnlyStorageBufferBinding.
	self assert: metadata storageBuffers first index equals: 0.
	self assert: metadata storageBuffers first space equals: 0.

	self assert: metadata storageBuffers second class equals: SDL3GPUReadWriteStorageBufferBinding.
	self assert: metadata storageBuffers second index equals: 0.
	self assert: metadata storageBuffers second space equals: 1
]

{ #category : 'tests' }
SDL3GPUShaderMetadataTest >> testScanStorageTextures [

	| hlsl metadata |
	hlsl := '
Texture2D<float4> texIn : register(t1, space0);
RWTexture2D<float4> texOut : register(u1, space1);
'.
	metadata := SDL3GPUComputeShaderMetadata scanFromSource: hlsl.

	self assert: metadata storageTextures size equals: 2.
	self assert: metadata storageTextures first class equals: SDL3GPUReadOnlyStorageTextureBinding.
	self assert: metadata storageTextures first index equals: 1.
	self assert: metadata storageTextures first space equals: 0.

	self assert: metadata storageTextures second class equals: SDL3GPUReadWriteStorageTextureBinding.
	self assert: metadata storageTextures second index equals: 1.
	self assert: metadata storageTextures second space equals: 1
]

{ #category : 'tests' }
SDL3GPUShaderMetadataTest >> testScanUniformBuffers [

	| hlsl metadata |
	hlsl := '
cbuffer VertParams : register(b0, space1) {
   float3 offset;
};
cbuffer FragParams : register(b1, space2) {
   float4 color;
}
'.
	metadata := SDL3GPUShaderMetadata scanFromSource: hlsl.

	self assert: metadata uniformBuffers size equals: 2.
	self assert: metadata uniformBuffers first class equals: SDL3GPUUniformBinding.
	self assert: metadata uniformBuffers first index equals: 0.
	self assert: metadata uniformBuffers first space equals: 1.

	self assert: metadata uniformBuffers second index equals: 1.
	self assert: metadata uniformBuffers second space equals: 2
]

{ #category : 'tests' }
SDL3GPUShaderMetadataTest >> testScanVertexInputAttributes [

	| hlsl metadata attr1 attr2 |
	hlsl := '
struct VertexInput {
	float3 position : POSITION;
	float2 uv : TEXCOORD0;
};
float4 main(VertexInput input) : SV_Position { return float4(input.position, 1.0); }'.
	metadata := SDL3GPUVertexShaderMetadata scanFromSource: hlsl.
	self assert: metadata class equals: SDL3GPUVertexShaderMetadata.
	self assert: metadata inputAttributes size equals: 2.
	self assert: metadata hasCustomMetadata.

	attr1 := metadata inputAttributes first.
	self assert: attr1 name equals: 'position'.
	self assert: attr1 type equals: 'float3'.
	self assert: attr1 semantic equals: 'POSITION'.
	self assert: attr1 location equals: 0.

	attr2 := metadata inputAttributes second.
	self assert: attr2 name equals: 'uv'.
	self assert: attr2 type equals: 'float2'.
	self assert: attr2 semantic equals: 'TEXCOORD0'.
	self assert: attr2 location equals: 1
]

{ #category : 'tests' }
SDL3GPUShaderMetadataTest >> testScanVertexInputAttributesIgnoresSystemValues [

	| hlsl metadata |
	hlsl := '
struct VertexInput {
	float2 position : TEXCOORD0;
	float2 uv : TEXCOORD1;
	uint instanceID : SV_InstanceID;
};
float4 main(VertexInput input) : SV_Position { return float4(input.position, 0.0, 1.0); }'.
	metadata := SDL3GPUVertexShaderMetadata scanFromSource: hlsl.
	self assert: metadata inputAttributes size equals: 2.
	self assert: metadata inputAttributes first name equals: 'position'.
	self assert: metadata inputAttributes first location equals: 0.
	self assert: metadata inputAttributes second name equals: 'uv'.
	self assert: metadata inputAttributes second location equals: 1
]

{ #category : 'tests' }
SDL3GPUShaderMetadataTest >> testScanVertexShader [

	| hlsl metadata |
	hlsl := 'float4 main(float4 pos : SV_Position) : SV_Position { return pos; }'.
	metadata := SDL3GPUVertexShaderMetadata scanFromSource: hlsl.

	self assert: metadata class equals: SDL3GPUVertexShaderMetadata
]

{ #category : 'tests' }
SDL3GPUShaderMetadataTest >> testScanWorkgroups [

	| hlsl metadata |
	hlsl := '
[numthreads(64, 1, 1)]
void main() {
   // ...
}
'.
	metadata := SDL3GPUComputeShaderMetadata scanFromSource: hlsl.

	self assert: metadata threadCountX equals: 64.
	self assert: metadata threadCountY equals: 1.
	self assert: metadata threadCountZ equals: 1
]

{ #category : 'tests' }
SDL3GPUShaderMetadataTest >> testValidateGroundTruth [

	| hlsl metadata |
	"Valid: t in space0, u in space1, b in space1/2/3, s in space0/2"
	hlsl := '
cbuffer Params : register(b0, space2);
SamplerState sam : register(s0, space0);
StructuredBuffer<Data> dataIn : register(t0, space0);
RWStructuredBuffer<Data> dataOut : register(u0, space1);
'.
	metadata := SDL3GPUShaderMetadata scanFromSource: hlsl.
	self shouldnt: [ metadata validateGroundTruth ] raise: Error.

	"Invalid: t in space1"
	hlsl := 'StructuredBuffer<Data> dataIn : register(t0, space1);'.
	metadata := SDL3GPUShaderMetadata scanFromSource: hlsl.
	self should: [ metadata validateGroundTruth ] raise: Error.

	"Invalid: u in space0"
	hlsl := 'RWStructuredBuffer<Data> dataOut : register(u0, space0);'.
	metadata := SDL3GPUShaderMetadata scanFromSource: hlsl.
	self should: [ metadata validateGroundTruth ] raise: Error
]

{ #category : 'tests' }
SDL3GPUShaderMetadataTest >> testValidationNoSpaceCollision [

	| hlsl metadata |
	"No Collision: t0 in space0, u0 in space1"
	hlsl := '
StructuredBuffer<Boid> boidsIn : register(t0, space0);
RWStructuredBuffer<Boid> boidsOut : register(u0, space1);
'.
	metadata := SDL3GPUShaderMetadata scanFromSource: hlsl.

	self deny: metadata hasSpaceCollision
]

{ #category : 'tests' }
SDL3GPUShaderMetadataTest >> testValidationSamplerMismatch [

	| hlsl metadata |
	hlsl := 'SamplerState sam : register(s0, space2);'.
	metadata := SDL3GPUShaderMetadata scanFromSource: hlsl.

	"Matches HLSL"
	self shouldnt: [ metadata validateSamplerCount: 1 ] raise: Error.

	"Mismatch"
	self should: [ metadata validateSamplerCount: 0 ] raise: Error
]

{ #category : 'tests' }
SDL3GPUShaderMetadataTest >> testValidationSpaceCollision [

	| hlsl metadata |
	"Collision: t0 and u0 both in space0"
	hlsl := '
StructuredBuffer<Boid> boidsIn : register(t0, space0);
RWStructuredBuffer<Boid> boidsOut : register(u0, space0);
'.
	metadata := SDL3GPUShaderMetadata scanFromSource: hlsl.

	self assert: metadata hasSpaceCollision
]
