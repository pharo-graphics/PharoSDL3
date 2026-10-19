"
I am a SDL3 FFI binding for `SDL_GPUCopyPass`.

An opaque handle representing a copy pass.

See: https://wiki.libsdl.org/SDL3/SDL_GPUCopyPass
"
Class {
	#name : 'SDL3GPUCopyPass',
	#superclass : 'SDL3GPUDeviceObject',
	#category : 'SDL3-GPU-Base',
	#package : 'SDL3',
	#tag : 'GPU-Base'
}

{ #category : 'copying' }
SDL3GPUCopyPass >> copyBuffer: source destination: destination size: size cycle: cycle [

	self ffiLibrary
		copyGPUBufferToBufferCopyPass: self
		source: source
		destination: destination
		size: size
		cycle: cycle
]

{ #category : 'copying' }
SDL3GPUCopyPass >> copyTexture: source destination: destination w: w h: h d: d cycle: cycle [

	self ffiLibrary
		copyGPUTextureToTextureCopyPass: self
		source: source
		destination: destination
		w: w
		h: h
		d: d
		cycle: cycle
]

{ #category : 'copying' }
SDL3GPUCopyPass >> downloadBuffer: source destination: destination [

	self ffiLibrary downloadFromGPUBufferCopyPass: self source: source destination: destination
]

{ #category : 'copying' }
SDL3GPUCopyPass >> downloadTexture: source destination: destination [

	self ffiLibrary downloadFromGPUTextureCopyPass: self source: source destination: destination
]

{ #category : 'operations' }
SDL3GPUCopyPass >> end [

	self ffiLibrary endGPUCopyPass: self
]

{ #category : 'releasing' }
SDL3GPUCopyPass >> releaseFromGPUDevice [
	"Passes are released when they are ended."

	self end
]

{ #category : 'copying' }
SDL3GPUCopyPass >> uploadBuffer: source destination: destination cycle: cycle [

	self ffiLibrary
		uploadToGPUBufferCopyPass: self
		source: source
		destination: destination
		cycle: cycle
]

{ #category : 'copying' }
SDL3GPUCopyPass >> uploadTexture: source destination: destination cycle: cycle [

	self ffiLibrary
		uploadToGPUTextureCopyPass: self
		source: source
		destination: destination
		cycle: cycle
]
