"
I test the SDL3ShaderMetadataScanner.
"
Class {
	#name : 'SDL3ShaderMetadataScannerTest',
	#superclass : 'TestCase',
	#category : 'SDL3-ShaderScanner-Tests',
	#package : 'SDL3-ShaderScanner-Tests'
}

{ #category : 'tests' }
SDL3ShaderMetadataScannerTest >> testScanDirectClassNaming [
	| hlsl metadata |
	hlsl := '
cbuffer SDL3GPUBoidsUniforms : register(b0, space2);
struct SDL3GPUNode { float x; };
StructuredBuffer<SDL3GPUNode> nodes : register(t0, space0);
'.
	metadata := SDL3ShaderMetadataScanner scan: hlsl.
	
	self assert: metadata uniformBuffers first linkedClass equals: SDL3GPUBoidsUniforms.
	self assert: metadata storageBuffers first linkedClass equals: SDL3GPUNode.
]

{ #category : 'tests' }
SDL3ShaderMetadataScannerTest >> testScanFragmentShader [
	| hlsl metadata |
	hlsl := 'float4 main() : SV_Target { return 0; }'.
	metadata := SDL3ShaderMetadataScanner scan: hlsl.
	
	self assert: (metadata isKindOf: SDL3GPUFragmentShaderMetadata).
]

{ #category : 'tests' }
SDL3ShaderMetadataScannerTest >> testScanSamplers [
	| hlsl metadata |
	hlsl := 'SamplerState sam : register(s0, space2);'.
	metadata := SDL3ShaderMetadataScanner scan: hlsl.
	
	self assert: metadata samplers size equals: 1.
	self assert: (metadata samplers first isKindOf: SDL3GPUSamplerBinding).
	self assert: metadata samplers first index equals: 0.
	self assert: metadata samplers first space equals: 2.
]

{ #category : 'tests' }
SDL3ShaderMetadataScannerTest >> testScanStorageBuffers [
	| hlsl metadata |
	hlsl := '
StructuredBuffer<Boid> boidsIn : register(t0, space0);
RWStructuredBuffer<Boid> boidsOut : register(u0, space1);
'.
	metadata := SDL3ShaderMetadataScanner scan: hlsl.
	
	self assert: metadata storageBuffers size equals: 2.
	
	self assert: (metadata storageBuffers first isKindOf: SDL3GPUReadOnlyStorageBufferBinding).
	self assert: metadata storageBuffers first index equals: 0.
	self assert: metadata storageBuffers first space equals: 0.
	
	self assert: (metadata storageBuffers second isKindOf: SDL3GPUReadWriteStorageBufferBinding).
	self assert: metadata storageBuffers second index equals: 0.
	self assert: metadata storageBuffers second space equals: 1.
]

{ #category : 'tests' }
SDL3ShaderMetadataScannerTest >> testScanStorageTextures [
	| hlsl metadata |
	hlsl := '
Texture2D<float4> texIn : register(t1, space0);
RWTexture2D<float4> texOut : register(u1, space1);
'.
	metadata := SDL3ShaderMetadataScanner scan: hlsl.
	
	self assert: metadata storageTextures size equals: 2.
	
	self assert: (metadata storageTextures first isKindOf: SDL3GPUReadOnlyStorageTextureBinding).
	self assert: metadata storageTextures first index equals: 1.
	self assert: metadata storageTextures first space equals: 0.
	
	self assert: (metadata storageTextures second isKindOf: SDL3GPUReadWriteStorageTextureBinding).
	self assert: metadata storageTextures second index equals: 1.
	self assert: metadata storageTextures second space equals: 1.
]

{ #category : 'tests' }
SDL3ShaderMetadataScannerTest >> testScanUniformBuffers [
	| hlsl metadata |
	hlsl := '
cbuffer VertParams : register(b0, space1) {
   float3 offset;
};
cbuffer FragParams : register(b1, space2) {
   float4 color;
}
'.
	metadata := SDL3ShaderMetadataScanner scan: hlsl.
	
	self assert: metadata uniformBuffers size equals: 2.
	self assert: (metadata uniformBuffers first isKindOf: SDL3GPUUniformBinding).
	
	self assert: metadata uniformBuffers first index equals: 0.
	self assert: metadata uniformBuffers first space equals: 1.
	
	self assert: metadata uniformBuffers second index equals: 1.
	self assert: metadata uniformBuffers second space equals: 2.
]

{ #category : 'tests' }
SDL3ShaderMetadataScannerTest >> testScanVertexShader [
	| hlsl metadata |
	hlsl := 'float4 main(float4 pos : SV_Position) : SV_Position { return pos; }'.
	metadata := SDL3ShaderMetadataScanner scan: hlsl.
	
	self assert: (metadata isKindOf: SDL3GPUVertexShaderMetadata).
]

{ #category : 'tests' }
SDL3ShaderMetadataScannerTest >> testScanWorkgroups [
	| hlsl metadata |
	hlsl := '
[numthreads(64, 1, 1)]
void main() {
   // ...
}
'.
	metadata := SDL3ShaderMetadataScanner scan: hlsl.
	
	self assert: metadata threadCountX equals: 64.
	self assert: metadata threadCountY equals: 1.
	self assert: metadata threadCountZ equals: 1.
]

{ #category : 'tests' }
SDL3ShaderMetadataScannerTest >> testValidateGroundTruth [
	| hlsl metadata |
	"Valid: t in space0, u in space1, b in space1/2/3, s in space0/2"
	hlsl := '
cbuffer Params : register(b0, space2);
SamplerState sam : register(s0, space0);
StructuredBuffer<Data> dataIn : register(t0, space0);
RWStructuredBuffer<Data> dataOut : register(u0, space1);
'.
	metadata := SDL3ShaderMetadataScanner scan: hlsl.
	self shouldnt: [ metadata validateGroundTruth ] raise: Error.
	
	"Invalid: t in space1"
	hlsl := 'StructuredBuffer<Data> dataIn : register(t0, space1);'.
	metadata := SDL3ShaderMetadataScanner scan: hlsl.
	self should: [ metadata validateGroundTruth ] raise: Error.
	
	"Invalid: u in space0"
	hlsl := 'RWStructuredBuffer<Data> dataOut : register(u0, space0);'.
	metadata := SDL3ShaderMetadataScanner scan: hlsl.
	self should: [ metadata validateGroundTruth ] raise: Error.
]

{ #category : 'tests' }
SDL3ShaderMetadataScannerTest >> testValidationNoSpaceCollision [
	| hlsl metadata |
	"No Collision: t0 in space0, u0 in space1"
	hlsl := '
StructuredBuffer<Boid> boidsIn : register(t0, space0);
RWStructuredBuffer<Boid> boidsOut : register(u0, space1);
'.
	metadata := SDL3ShaderMetadataScanner scan: hlsl.
	
	self deny: metadata hasSpaceCollision.
]

{ #category : 'tests' }
SDL3ShaderMetadataScannerTest >> testValidationSamplerMismatch [
	| hlsl metadata |
	hlsl := 'SamplerState sam : register(s0, space2);'.
	metadata := SDL3ShaderMetadataScanner scan: hlsl.
	
	"Matches HLSL"
	self shouldnt: [ metadata validateSamplerCount: 1 ] raise: Error.
	
	"Mismatch"
	self should: [ metadata validateSamplerCount: 0 ] raise: Error.
]

{ #category : 'tests' }
SDL3ShaderMetadataScannerTest >> testValidationSpaceCollision [
	| hlsl metadata |
	"Collision: t0 and u0 both in space0"
	hlsl := '
StructuredBuffer<Boid> boidsIn : register(t0, space0);
RWStructuredBuffer<Boid> boidsOut : register(u0, space0);
'.
	metadata := SDL3ShaderMetadataScanner scan: hlsl.
	
	self assert: metadata hasSpaceCollision.
]
