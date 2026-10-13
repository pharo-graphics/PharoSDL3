Class {
	#name : 'SDL3GPUUploadTest',
	#superclass : 'SDL3GPUTest',
	#category : 'SDL3-GPU-Tests-Basic',
	#package : 'SDL3-GPU-Tests',
	#tag : 'Basic'
}

{ #category : 'tests' }
SDL3GPUUploadTest >> test01UploadToGPUDeviceExtension [

	| byteSize targetBuffer |
	byteSize := 1024 * FFIFloat32 externalTypeSize.
	targetBuffer := gpuDevice unownedNewGPUBufferUsage: SDL_GPU_BUFFERUSAGE_VERTEX size: byteSize.
	DiScope own: targetBuffer.

	gpuDevice uploadToGPUDo: [ :uploader |
		uploader
			uploadTo: targetBuffer
			type: FFIFloat32
			count: 1024
			cycle: false
			fillWith: [ :array | 1 to: 1024 do: [ :i | array at: i put: i asFloat ] ] ]
]

{ #category : 'tests' }
SDL3GPUUploadTest >> test02UploadFromPointer [

	| byteSize targetBuffer sourceArray |
	byteSize := 1024 * FFIFloat32 externalTypeSize.
	targetBuffer := gpuDevice unownedNewGPUBufferUsage: SDL_GPU_BUFFERUSAGE_VERTEX size: byteSize.
	DiScope own: targetBuffer.

	sourceArray := SDL3Array newType: FFIFloat32 size: 1024.
	1 to: 1024 do: [ :i | sourceArray at: i put: i asFloat ].

	gpuDevice uploadToGPUDo: [ :uploader |
		uploader
			uploadTo: targetBuffer
			type: FFIFloat32
			count: 1024
			cycle: false
			fromPointer: sourceArray ]
]

{ #category : 'tests' }
SDL3GPUUploadTest >> test03UploadToGPUCommandBufferExtension [

	| byteSize targetBuffer commandBuffer |
	byteSize := 1024 * FFIFloat32 externalTypeSize.
	targetBuffer := gpuDevice unownedNewGPUBufferUsage: SDL_GPU_BUFFERUSAGE_VERTEX size: byteSize.
	DiScope own: targetBuffer.

	commandBuffer := gpuDevice acquireGPUCommandBuffer.
	commandBuffer uploadToGPUDo: [ :uploader |
		uploader
			uploadTo: targetBuffer
			type: FFIFloat32
			count: 1024
			cycle: false
			fillWith: [ :array | 1 to: 1024 do: [ :i | array at: i put: i asFloat ] ] ].
	commandBuffer submit
]
