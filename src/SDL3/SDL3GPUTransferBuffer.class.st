"
I am a SDL3 FFI binding for `SDL_GPUTransferBuffer`.

An opaque handle representing a transfer buffer.

See: https://wiki.libsdl.org/SDL3/SDL_GPUTransferBuffer
"
Class {
	#name : 'SDL3GPUTransferBuffer',
	#superclass : 'SDL3GPUDeviceObject',
	#category : 'SDL3-GPU-Base',
	#package : 'SDL3',
	#tag : 'GPU-Base'
}

{ #category : 'releasing' }
SDL3GPUTransferBuffer >> releaseFromGPUDevice [

	device ffiLibrary
		releaseGPUTransferBufferDevice: device
		transferBuffer: self
]
