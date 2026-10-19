"
I am a SDL3 FFI binding for `SDL_GPUSampler`.

An opaque handle representing a sampler.

See: https://wiki.libsdl.org/SDL3/SDL_GPUSampler
"
Class {
	#name : 'SDL3GPUSampler',
	#superclass : 'SDL3GPUDeviceObject',
	#category : 'SDL3-GPU-Base',
	#package : 'SDL3',
	#tag : 'GPU-Base'
}

{ #category : 'releasing' }
SDL3GPUSampler >> releaseFromGPUDevice [

	device ffiLibrary releaseGPUSamplerDevice: device sampler: self
]
