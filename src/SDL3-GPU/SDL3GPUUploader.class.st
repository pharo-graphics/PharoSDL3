"
I provide a builder-style API to simplify uploading data to GPU buffers.
I orchestrate the creation, mapping, unmapping, and release of transfer buffers, and automatically record the upload commands to my associated copy pass.

My API automatically calculates byte sizes based on the provided FFI types and sizes.

Instance Variables:
	gpuDevice	<SDL3GPUDevice>
	copyPass	<SDL3GPUCopyPass>
"
Class {
	#name : 'SDL3GPUUploader',
	#superclass : 'Object',
	#instVars : [
		'gpuDevice',
		'copyPass'
	],
	#pools : [
		'SDL3Typedef',
		'SDL3ZConstants'
	],
	#category : 'SDL3-GPU-Support',
	#package : 'SDL3-GPU',
	#tag : 'Support'
}

{ #category : 'instance creation' }
SDL3GPUUploader class >> on: aGPUDevice copyPass: aCopyPass do: aBlock [
	"Yields an uploader using an already active copy pass."

	| uploader |
	uploader := self new
		            gpuDevice: aGPUDevice;
		            copyPass: aCopyPass;
		            yourself.
	aBlock value: uploader
]

{ #category : 'instance creation' }
SDL3GPUUploader class >> on: aGPUDevice do: aBlock [
	"Acquires a command buffer, starts a copy pass, yields an uploader for batching, and submits the commands."

	| commandBuffer |
	commandBuffer := aGPUDevice acquireGPUCommandBuffer.
	[
		commandBuffer copyPassDo: [ :pass |
			self on: aGPUDevice copyPass: pass do: aBlock ]
	] ifCurtailed: [ commandBuffer cancel ].
	commandBuffer submit
]

{ #category : 'accessing' }
SDL3GPUUploader >> copyPass: anObject [

	copyPass := anObject
]

{ #category : 'accessing' }
SDL3GPUUploader >> gpuDevice: anObject [

	gpuDevice := anObject
]

{ #category : 'uploading' }
SDL3GPUUploader >> transferBuffer: aTransferBuffer uploadTo: targetBuffer type: ffiClass count: arraySize cycle: cycleBoolean fillWith: aBlock [
	"Uses the provided transferBuffer (user-managed), maps it as an FFIArray of the given type, passes it to aBlock for filling, and records the upload command. Does NOT release the transfer buffer."

	| byteSize |
	byteSize := ffiClass externalTypeSize * arraySize.
	
	gpuDevice mapTransferBuffer: aTransferBuffer cycle: cycleBoolean do: [ :mappedAddress |
		| mappedArray |
		mappedArray := FFIArray fromHandle: mappedAddress type: ffiClass size: arraySize.
		aBlock value: mappedArray ].

	copyPass
		uploadBuffer:
			(SDL_GPUTransferBufferLocation new
				transferBuffer: aTransferBuffer;
				offset: 0;
				yourself)
		destination:
			(SDL_GPUBufferRegion new
				buffer: targetBuffer;
				offset: 0;
				size: byteSize;
				yourself)
		cycle: cycleBoolean
]

{ #category : 'uploading' }
SDL3GPUUploader >> transferBuffer: aTransferBuffer uploadTo: targetBuffer type: ffiClass count: arraySize cycle: cycleBoolean fromPointer: sourceAddress [
	"Uses the provided transferBuffer (user-managed) and directly memCopies the data from sourceAddress. Does NOT release the transfer buffer."

	| byteSize |
	byteSize := ffiClass externalTypeSize * arraySize.
	
	gpuDevice mapTransferBuffer: aTransferBuffer cycle: cycleBoolean do: [ :mappedAddress |
		LibC memCopy: sourceAddress to: mappedAddress size: byteSize ].

	copyPass
		uploadBuffer:
			(SDL_GPUTransferBufferLocation new
				transferBuffer: aTransferBuffer;
				offset: 0;
				yourself)
		destination:
			(SDL_GPUBufferRegion new
				buffer: targetBuffer;
				offset: 0;
				size: byteSize;
				yourself)
		cycle: cycleBoolean
]

{ #category : 'uploading' }
SDL3GPUUploader >> uploadTexture: aGPUTexture fromPointer: sourceAddress byteSize: byteSize w: width h: height cycle: cycleBoolean [
	"Uploads pixel data from a raw pointer to a texture. Automatically manages a temporary transfer buffer."

	| transferBuffer |
	transferBuffer := gpuDevice newUploadTransferBuffer: byteSize.
	[
		gpuDevice mapTransferBuffer: transferBuffer cycle: cycleBoolean do: [ :mappedAddress |
			LibC memCopy: sourceAddress to: mappedAddress size: byteSize ].

		copyPass
			uploadTexture:
				(SDL3GPUTextureTransferInfo new
					transferBuffer: transferBuffer;
					offset: 0;
					yourself)
			destination:
				(SDL3GPUTextureRegion new
					texture: aGPUTexture;
					w: width;
					h: height;
					d: 1;
					yourself)
			cycle: cycleBoolean
	] ensure: [ transferBuffer release ]
]

{ #category : 'uploading' }
SDL3GPUUploader >> uploadTo: targetBuffer type: ffiClass count: arraySize cycle: cycleBoolean fillWith: aBlock [
	"Creates a transfer buffer, maps it as an FFIArray of the given type, passes it to aBlock for filling, records the upload command, and safely cleans up."

	| byteSize transferBuffer |
	byteSize := ffiClass externalTypeSize * arraySize.
	transferBuffer := gpuDevice newUploadTransferBuffer: byteSize.
	
	[
		gpuDevice mapTransferBuffer: transferBuffer cycle: cycleBoolean do: [ :mappedAddress |
			| mappedArray |
			mappedArray := FFIArray fromHandle: mappedAddress type: ffiClass size: arraySize.
			aBlock value: mappedArray ].

		copyPass
			uploadBuffer:
				(SDL_GPUTransferBufferLocation new
					transferBuffer: transferBuffer;
					offset: 0;
					yourself)
			destination:
				(SDL_GPUBufferRegion new
					buffer: targetBuffer;
					offset: 0;
					size: byteSize;
					yourself)
			cycle: cycleBoolean
	] ensure: [ transferBuffer release ]
]

{ #category : 'uploading' }
SDL3GPUUploader >> uploadTo: targetBuffer type: ffiClass count: arraySize cycle: cycleBoolean fromPointer: sourceAddress [
	"A fast-path that creates a transfer buffer and directly memCopies the data from sourceAddress."

	| byteSize transferBuffer |
	byteSize := ffiClass externalTypeSize * arraySize.
	transferBuffer := gpuDevice newUploadTransferBuffer: byteSize.
	
	[
		gpuDevice mapTransferBuffer: transferBuffer cycle: cycleBoolean do: [ :mappedAddress |
			LibC memCopy: sourceAddress to: mappedAddress size: byteSize ].

		copyPass
			uploadBuffer:
				(SDL_GPUTransferBufferLocation new
					transferBuffer: transferBuffer;
					offset: 0;
					yourself)
			destination:
				(SDL_GPUBufferRegion new
					buffer: targetBuffer;
					offset: 0;
					size: byteSize;
					yourself)
			cycle: cycleBoolean
	] ensure: [ transferBuffer release ]
]
