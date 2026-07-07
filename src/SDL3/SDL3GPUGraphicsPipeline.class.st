"
I am a SDL3 FFI binding for `SDL_GPUGraphicsPipeline`.

An opaque handle representing a graphics pipeline.

See: https://wiki.libsdl.org/SDL3/SDL_GPUGraphicsPipeline
"
Class {
	#name : 'SDL3GPUGraphicsPipeline',
	#superclass : 'SDL3GPUDeviceObject',
	#instVars : [
		'vertexMetadata',
		'fragmentMetadata'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'accessing' }
SDL3GPUGraphicsPipeline >> fragmentMetadata [
	^ fragmentMetadata
]

{ #category : 'accessing' }
SDL3GPUGraphicsPipeline >> fragmentMetadata: aMetadata [
	fragmentMetadata := aMetadata
]

{ #category : 'accessing' }
SDL3GPUGraphicsPipeline >> vertexMetadata [
	^ vertexMetadata
]

{ #category : 'accessing' }
SDL3GPUGraphicsPipeline >> vertexMetadata: aMetadata [
	vertexMetadata := aMetadata
]
