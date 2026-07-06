Class {
	#name : 'SDL3GPUShader',
	#superclass : 'SDL3GPUDeviceObject',
	#instVars : [
		'metadata'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'accessing' }
SDL3GPUShader >> metadata [
	^ metadata
]

{ #category : 'accessing' }
SDL3GPUShader >> metadata: aMetadata [
	metadata := aMetadata
]
