"
I am a SDL3 FFI binding for `SDL_GPUFence`.

An opaque handle representing a fence.

See: https://wiki.libsdl.org/SDL3/SDL_GPUFence
"
Class {
	#name : 'SDL3GPUFence',
	#superclass : 'SDL3GPUDeviceObject',
	#category : 'SDL3-GPU-Base',
	#package : 'SDL3',
	#tag : 'GPU-Base'
}

{ #category : 'releasing' }
SDL3GPUFence >> releaseFromGPUDevice [

	device ffiLibrary releaseGPUFenceDevice: device fence: self
]
