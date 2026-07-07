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
	targetBuffer := gpuDevice newGPUBufferUsage: SDL_GPU_BUFFERUSAGE_VERTEX size: byteSize.
	
	[	gpuDevice uploadToGPUDo: [ :uploader |
			uploader 
				uploadTo: targetBuffer 
				type: FFIFloat32 
				count: 1024 
				cycle: false 
				fillWith: [ :array | 1 to: 1024 do: [ :i | array at: i put: i asFloat ] ] ]
	] ensure: [ targetBuffer release ]
]

{ #category : 'tests' }
SDL3GPUUploadTest >> test02UploadFromPointer [

	| byteSize targetBuffer sourceArray |
	byteSize := 1024 * FFIFloat32 externalTypeSize.
	targetBuffer := gpuDevice newGPUBufferUsage: SDL_GPU_BUFFERUSAGE_VERTEX size: byteSize.
	
	sourceArray := FFIArray newType: FFIFloat32 size: 1024.
	1 to: 1024 do: [ :i | sourceArray at: i put: i asFloat ].
	
	[	gpuDevice uploadToGPUDo: [ :uploader |
			uploader 
				uploadTo: targetBuffer 
				type: FFIFloat32 
				count: 1024 
				cycle: false 
				fromPointer: sourceArray ]
	] ensure: [ targetBuffer release ]
]

{ #category : 'tests' }
SDL3GPUUploadTest >> test03UploadToGPUCommandBufferExtension [

	| byteSize targetBuffer commandBuffer |
	byteSize := 1024 * FFIFloat32 externalTypeSize.
	targetBuffer := gpuDevice newGPUBufferUsage: SDL_GPU_BUFFERUSAGE_VERTEX size: byteSize.
	
	commandBuffer := gpuDevice acquireGPUCommandBuffer.
	[
		commandBuffer uploadToGPUDo: [ :uploader |
			uploader 
				uploadTo: targetBuffer 
				type: FFIFloat32 
				count: 1024 
				cycle: false 
				fillWith: [ :array | 1 to: 1024 do: [ :i | array at: i put: i asFloat ] ] ].
		commandBuffer submit.
	] ensure: [ targetBuffer release ]
]
