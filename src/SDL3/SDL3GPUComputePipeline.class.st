Class {
	#name : 'SDL3GPUComputePipeline',
	#superclass : 'SDL3GPUDeviceObject',
	#instVars : [
		'metadata'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'accessing' }
SDL3GPUComputePipeline >> metadata [
	^ metadata
]

{ #category : 'accessing' }
SDL3GPUComputePipeline >> metadata: aMetadata [
	metadata := aMetadata
]
