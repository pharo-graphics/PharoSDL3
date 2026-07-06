"
I represent a sampler binding (register s).
"
Class {
	#name : 'SDL3GPUSamplerBinding',
	#superclass : 'SDL3GPUBinding',
	#category : 'SDL3-GPU-ShaderScanner',
	#package : 'SDL3-GPU',
	#tag : 'ShaderScanner'
}

{ #category : 'accessing' }
SDL3GPUSamplerBinding >> registerType [
	^ $s
]

{ #category : 'validation' }
SDL3GPUSamplerBinding >> validateGroundTruth [
	self assert: (space = 0 or: [ space = 2 ])
		description: 'Samplers (register s) must be in space0 (Vertex/Compute) or space2 (Fragment)'
]
