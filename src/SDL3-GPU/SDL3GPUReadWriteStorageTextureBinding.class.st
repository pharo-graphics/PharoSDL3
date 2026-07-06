"
I represent a read-write storage texture binding (register u).
"
Class {
	#name : 'SDL3GPUReadWriteStorageTextureBinding',
	#superclass : 'SDL3GPUStorageTextureBinding',
	#category : 'SDL3-GPU-ShaderScanner',
	#package : 'SDL3-GPU',
	#tag : 'ShaderScanner'
}

{ #category : 'testing' }
SDL3GPUReadWriteStorageTextureBinding >> isReadWrite [
	^ true
]

{ #category : 'accessing' }
SDL3GPUReadWriteStorageTextureBinding >> registerType [
	^ $u
]

{ #category : 'validation' }
SDL3GPUReadWriteStorageTextureBinding >> validateGroundTruth [
	self assert: space = 1 
		description: 'RW Storage (register u) must be in space1'
]
