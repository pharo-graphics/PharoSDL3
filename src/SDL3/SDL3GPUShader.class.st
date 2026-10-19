"
I am a SDL3 FFI binding for `SDL_GPUShader`.

An opaque handle representing a compiled shader object.

See: https://wiki.libsdl.org/SDL3/SDL_GPUShader
"
Class {
	#name : 'SDL3GPUShader',
	#superclass : 'SDL3GPUDeviceObject',
	#instVars : [
		'metadata'
	],
	#category : 'SDL3-GPU-Base',
	#package : 'SDL3',
	#tag : 'GPU-Base'
}

{ #category : 'accessing' }
SDL3GPUShader >> metadata [
	^ metadata
]

{ #category : 'accessing' }
SDL3GPUShader >> metadata: aMetadata [
	metadata := aMetadata
]

{ #category : 'releasing' }
SDL3GPUShader >> releaseFromGPUDevice [

	device ffiLibrary releaseGPUShaderDevice: device shader: self
]
