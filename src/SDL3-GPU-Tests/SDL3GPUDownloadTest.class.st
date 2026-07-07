Class {
	#name : 'SDL3GPUDownloadTest',
	#superclass : 'SDL3GPUTest',
	#category : 'SDL3-GPU-Tests-Basic',
	#package : 'SDL3-GPU-Tests',
	#tag : 'Basic'
}

{ #category : 'tests' }
SDL3GPUDownloadTest >> test01DownloadFromGPUDeviceExtension [

	| count byteSize targetBuffer sourceArray resultData |
	count := 1024.
	byteSize := count * FFIFloat32 externalTypeSize.
	targetBuffer :=
		gpuDevice
			newGPUBufferUsage:
				SDL_GPU_BUFFERUSAGE_VERTEX | SDL_GPU_BUFFERUSAGE_COMPUTE_STORAGE_READ
			size: byteSize.
	
	sourceArray := FFIArray newType: FFIFloat32 size: count.
	1 to: count do: [ :i | sourceArray at: i put: i asFloat ].
	
	[
		"1. Upload data to test buffer"
		gpuDevice uploadToGPUDo: [ :uploader |
			uploader 
				uploadTo: targetBuffer 
				type: FFIFloat32 
				count: count 
				cycle: false 
				fromPointer: sourceArray ].
				
		"2. Download and verify"
		gpuDevice
			downloadFrom: targetBuffer
			type: FFIFloat32
			count: count do: [ :downloadedArray |
				resultData := FFIArray newType: FFIFloat32 size: count.
				LibC memCopy: downloadedArray to: resultData size: byteSize ].
	] ensure: [ targetBuffer release ].

	1 to: count do: [ :i | self assert: (resultData at: i) equals: i asFloat ]
]
