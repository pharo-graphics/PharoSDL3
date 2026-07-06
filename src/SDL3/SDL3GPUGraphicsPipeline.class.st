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
