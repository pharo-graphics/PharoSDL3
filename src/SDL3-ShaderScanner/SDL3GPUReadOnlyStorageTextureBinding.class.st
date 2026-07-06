"
I represent a read-only storage texture binding (register t).
"
Class {
	#name : 'SDL3GPUReadOnlyStorageTextureBinding',
	#superclass : 'SDL3GPUStorageTextureBinding',
	#category : 'SDL3-ShaderScanner',
	#package : 'SDL3-ShaderScanner'
}

{ #category : 'accessing' }
SDL3GPUReadOnlyStorageTextureBinding >> registerType [
	^ $t
]

{ #category : 'validation' }
SDL3GPUReadOnlyStorageTextureBinding >> validateGroundTruth [
	self assert: (space = 0 or: [ space = 2 ])
		description: 'RO Storage (register t) must be in space0 (Vertex/Compute) or space2 (Fragment)'
]
