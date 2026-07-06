"
I represent a read-only storage buffer binding (register t).
"
Class {
	#name : 'SDL3GPUReadOnlyStorageBufferBinding',
	#superclass : 'SDL3GPUStorageBufferBinding',
	#category : 'SDL3-ShaderScanner',
	#package : 'SDL3-ShaderScanner'
}

{ #category : 'accessing' }
SDL3GPUReadOnlyStorageBufferBinding >> registerType [
	^ $t
]

{ #category : 'validation' }
SDL3GPUReadOnlyStorageBufferBinding >> validateGroundTruth [
	self assert: (space = 0 or: [ space = 2 ])
		description: 'RO Storage (register t) must be in space0 (Vertex/Compute) or space2 (Fragment)'
]
