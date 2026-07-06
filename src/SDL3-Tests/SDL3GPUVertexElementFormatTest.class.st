Class {
	#name : 'SDL3GPUVertexElementFormatTest',
	#superclass : 'SDL3Test',
	#category : 'SDL3-Tests-Library',
	#package : 'SDL3-Tests',
	#tag : 'Library'
}

{ #category : 'tests' }
SDL3GPUVertexElementFormatTest >> testAlignment [

	self assert: SDL_GPU_VERTEXELEMENTFORMAT_FLOAT alignment equals: 4.
	self assert: SDL_GPU_VERTEXELEMENTFORMAT_FLOAT2 alignment equals: 4.
	self assert: SDL_GPU_VERTEXELEMENTFORMAT_FLOAT3 alignment equals: 4.
	self assert: SDL_GPU_VERTEXELEMENTFORMAT_FLOAT4 alignment equals: 4.

	self assert: SDL_GPU_VERTEXELEMENTFORMAT_INT alignment equals: 4.
	self assert: SDL_GPU_VERTEXELEMENTFORMAT_INT2 alignment equals: 4.
	self assert: SDL_GPU_VERTEXELEMENTFORMAT_INT3 alignment equals: 4.
	self assert: SDL_GPU_VERTEXELEMENTFORMAT_INT4 alignment equals: 4.

	self assert: SDL_GPU_VERTEXELEMENTFORMAT_UINT alignment equals: 4.
	self assert: SDL_GPU_VERTEXELEMENTFORMAT_UINT2 alignment equals: 4.
	self assert: SDL_GPU_VERTEXELEMENTFORMAT_UINT3 alignment equals: 4.
	self assert: SDL_GPU_VERTEXELEMENTFORMAT_UINT4 alignment equals: 4.

	self assert: SDL_GPU_VERTEXELEMENTFORMAT_HALF2 alignment equals: 2.
	self assert: SDL_GPU_VERTEXELEMENTFORMAT_HALF4 alignment equals: 2.
	self assert: SDL_GPU_VERTEXELEMENTFORMAT_SHORT2 alignment equals: 2.
	self assert: SDL_GPU_VERTEXELEMENTFORMAT_SHORT4 alignment equals: 2.
	self assert: SDL_GPU_VERTEXELEMENTFORMAT_USHORT2 alignment equals: 2.
	self assert: SDL_GPU_VERTEXELEMENTFORMAT_USHORT4 alignment equals: 2.

	self assert: SDL_GPU_VERTEXELEMENTFORMAT_BYTE2 alignment equals: 1.
	self assert: SDL_GPU_VERTEXELEMENTFORMAT_UBYTE2 alignment equals: 1.
	self assert: SDL_GPU_VERTEXELEMENTFORMAT_BYTE4 alignment equals: 1.
	self assert: SDL_GPU_VERTEXELEMENTFORMAT_UBYTE4 alignment equals: 1.
	self assert: SDL_GPU_VERTEXELEMENTFORMAT_BYTE2_NORM alignment equals: 1.
	self assert: SDL_GPU_VERTEXELEMENTFORMAT_UBYTE2_NORM alignment equals: 1.
	self assert: SDL_GPU_VERTEXELEMENTFORMAT_BYTE4_NORM alignment equals: 1.
	self assert: SDL_GPU_VERTEXELEMENTFORMAT_UBYTE4_NORM alignment equals: 1.

	self assert: SDL_GPU_VERTEXELEMENTFORMAT_SHORT2_NORM alignment equals: 2.
	self assert: SDL_GPU_VERTEXELEMENTFORMAT_SHORT4_NORM alignment equals: 2.
	self assert: SDL_GPU_VERTEXELEMENTFORMAT_USHORT2_NORM alignment equals: 2.
	self assert: SDL_GPU_VERTEXELEMENTFORMAT_USHORT4_NORM alignment equals: 2.
]

{ #category : 'tests' }
SDL3GPUVertexElementFormatTest >> testByteSize [

	self assert: SDL_GPU_VERTEXELEMENTFORMAT_FLOAT byteSize equals: 4.
	self assert: SDL_GPU_VERTEXELEMENTFORMAT_FLOAT2 byteSize equals: 8.
	self assert: SDL_GPU_VERTEXELEMENTFORMAT_FLOAT3 byteSize equals: 12.
	self assert: SDL_GPU_VERTEXELEMENTFORMAT_FLOAT4 byteSize equals: 16.

	self assert: SDL_GPU_VERTEXELEMENTFORMAT_INT byteSize equals: 4.
	self assert: SDL_GPU_VERTEXELEMENTFORMAT_INT2 byteSize equals: 8.
	self assert: SDL_GPU_VERTEXELEMENTFORMAT_INT3 byteSize equals: 12.
	self assert: SDL_GPU_VERTEXELEMENTFORMAT_INT4 byteSize equals: 16.

	self assert: SDL_GPU_VERTEXELEMENTFORMAT_UINT byteSize equals: 4.
	self assert: SDL_GPU_VERTEXELEMENTFORMAT_UINT2 byteSize equals: 8.
	self assert: SDL_GPU_VERTEXELEMENTFORMAT_UINT3 byteSize equals: 12.
	self assert: SDL_GPU_VERTEXELEMENTFORMAT_UINT4 byteSize equals: 16.

	self assert: SDL_GPU_VERTEXELEMENTFORMAT_HALF2 byteSize equals: 4.
	self assert: SDL_GPU_VERTEXELEMENTFORMAT_HALF4 byteSize equals: 8.

	self assert: SDL_GPU_VERTEXELEMENTFORMAT_BYTE2 byteSize equals: 2.
	self assert: SDL_GPU_VERTEXELEMENTFORMAT_UBYTE2 byteSize equals: 2.
	self assert: SDL_GPU_VERTEXELEMENTFORMAT_BYTE4 byteSize equals: 4.
	self assert: SDL_GPU_VERTEXELEMENTFORMAT_UBYTE4 byteSize equals: 4.

	self assert: SDL_GPU_VERTEXELEMENTFORMAT_BYTE2_NORM byteSize equals: 2.
	self assert: SDL_GPU_VERTEXELEMENTFORMAT_UBYTE2_NORM byteSize equals: 2.
	self assert: SDL_GPU_VERTEXELEMENTFORMAT_BYTE4_NORM byteSize equals: 4.
	self assert: SDL_GPU_VERTEXELEMENTFORMAT_UBYTE4_NORM byteSize equals: 4.

	self assert: SDL_GPU_VERTEXELEMENTFORMAT_SHORT2 byteSize equals: 4.
	self assert: SDL_GPU_VERTEXELEMENTFORMAT_USHORT2 byteSize equals: 4.
	self assert: SDL_GPU_VERTEXELEMENTFORMAT_SHORT4 byteSize equals: 8.
	self assert: SDL_GPU_VERTEXELEMENTFORMAT_USHORT4 byteSize equals: 8.

	self assert: SDL_GPU_VERTEXELEMENTFORMAT_SHORT2_NORM byteSize equals: 4.
	self assert: SDL_GPU_VERTEXELEMENTFORMAT_USHORT2_NORM byteSize equals: 4.
	self assert: SDL_GPU_VERTEXELEMENTFORMAT_SHORT4_NORM byteSize equals: 8.
	self assert: SDL_GPU_VERTEXELEMENTFORMAT_USHORT4_NORM byteSize equals: 8.
]
