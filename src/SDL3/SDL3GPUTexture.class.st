"
I am a SDL3 FFI binding for `SDL_GPUTexture`.

An opaque handle representing a texture.

See: https://wiki.libsdl.org/SDL3/SDL_GPUTexture
"
Class {
	#name : 'SDL3GPUTexture',
	#superclass : 'SDL3GPUDeviceObject',
	#category : 'SDL3-GPU-Base',
	#package : 'SDL3',
	#tag : 'GPU-Base'
}

{ #category : 'releasing' }
SDL3GPUTexture >> releaseFromGPUDevice [

	device ffiLibrary releaseGPUTextureDevice: device texture: self
]
