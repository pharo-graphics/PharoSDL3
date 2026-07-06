Class {
	#name : 'SDL3GPURenderPass',
	#superclass : 'SDL3GPUDeviceObject',
	#instVars : [
		'pipeline'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'accessing' }
SDL3GPURenderPass >> pipeline [
	^ pipeline
]

{ #category : 'accessing' }
SDL3GPURenderPass >> pipeline: graphicsPipeline [

	self ffiLibrary
		bindGPUGraphicsPipelineRenderPass: self
		graphicsPipeline: graphicsPipeline.
	pipeline := graphicsPipeline
]
