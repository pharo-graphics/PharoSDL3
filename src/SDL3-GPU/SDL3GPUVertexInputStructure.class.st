"
I am an abstract base class for structures representing vertex or instance buffer data passed into the GPU Vertex Input State (SDL_GPUVertexInputState).

Subclasses must define their memory layout via #fieldsDesc and describe their GPU attribute mapping (location, offset, format) via #gpuVertexElementsDescription.
"
Class {
	#name : 'SDL3GPUVertexInputStructure',
	#superclass : 'SDL3Structure',
	#category : 'SDL3-GPU-Pipeline',
	#package : 'SDL3-GPU',
	#tag : 'Pipeline'
}

{ #category : 'converting' }
SDL3GPUVertexInputStructure class >> asVertexBufferDescriptionForSlot: aSlot inputRate: anInputRate [

	| bufferDescription |
	bufferDescription := SDL3GPUVertexBufferDescription new.
	bufferDescription
		slot: aSlot;
		pitch: self structureSize;
		inputRate: anInputRate;
		instanceStepRate: 0.
	^ bufferDescription
]

{ #category : 'accessing' }
SDL3GPUVertexInputStructure class >> gpuVertexElementsDescription [
	"Subclasses representing vertex or instance buffer layouts must override this method
	to describe their GPU vertex attributes (location, offset, format).

	Example:
		^ {
			SDL3GPUVertexElement location: 0 oneBasedOffset: OFFSET_POSITION format: SDL3GPUVertexElementFormat float3.
			SDL3GPUVertexElement location: 1 oneBasedOffset: OFFSET_TEXCOORD format: SDL3GPUVertexElementFormat float2
		}"

	^ self subclassResponsibility
]
