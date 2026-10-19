"
I am a SDL3 FFI binding for `SDL_GPUBuffer`.

An opaque handle representing a buffer.

See: https://wiki.libsdl.org/SDL3/SDL_GPUBuffer
"
Class {
	#name : 'SDL3GPUBuffer',
	#superclass : 'SDL3GPUDeviceObject',
	#category : 'SDL3-GPU-Base',
	#package : 'SDL3',
	#tag : 'GPU-Base'
}

{ #category : 'releasing' }
SDL3GPUBuffer >> releaseFromGPUDevice [

	device ffiLibrary releaseGPUBufferDevice: device buffer: self
]
