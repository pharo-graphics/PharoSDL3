"
I represent a read-write storage buffer binding (register u).
"
Class {
	#name : 'SDL3GPUReadWriteStorageBufferBinding',
	#superclass : 'SDL3GPUStorageBufferBinding',
	#category : 'SDL3-GPU-ShaderScanner',
	#package : 'SDL3-GPU',
	#tag : 'ShaderScanner'
}

{ #category : 'testing' }
SDL3GPUReadWriteStorageBufferBinding >> isReadWrite [
	^ true
]

{ #category : 'accessing' }
SDL3GPUReadWriteStorageBufferBinding >> registerType [
	^ $u
]

{ #category : 'validation' }
SDL3GPUReadWriteStorageBufferBinding >> validateGroundTruth [
	self assert: space = 1 
		description: 'RW Storage (register u) must be in space1'
]
