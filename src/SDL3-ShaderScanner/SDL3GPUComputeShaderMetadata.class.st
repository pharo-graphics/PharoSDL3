"
I hold metadata specific to compute shaders, including thread counts.
"
Class {
	#name : 'SDL3GPUComputeShaderMetadata',
	#superclass : 'SDL3GPUShaderMetadata',
	#instVars : [
		'threadCountX',
		'threadCountY',
		'threadCountZ'
	],
	#category : 'SDL3-ShaderScanner',
	#package : 'SDL3-ShaderScanner'
}

{ #category : 'testing' }
SDL3GPUComputeShaderMetadata >> hasCustomMetadata [

	^ super hasCustomMetadata or: [ 
		  threadCountX ~= 1 or: [ threadCountY ~= 1 or: [ threadCountZ ~= 1 ] ] ]
]

{ #category : 'initialization' }
SDL3GPUComputeShaderMetadata >> initialize [
	super initialize.
	threadCountX := 1.
	threadCountY := 1.
	threadCountZ := 1.
]

{ #category : 'printing' }
SDL3GPUComputeShaderMetadata >> storeFieldsOn: aStream [

	threadCountX ~= 1 ifTrue: [ 
		aStream
			cr; tab; tab; nextPutAll: 'threadCountX: '; print: threadCountX; nextPutAll: ';' ].
	threadCountY ~= 1 ifTrue: [ 
		aStream
			cr; tab; tab; nextPutAll: 'threadCountY: '; print: threadCountY; nextPutAll: ';' ].
	threadCountZ ~= 1 ifTrue: [ 
		aStream
			cr; tab; tab; nextPutAll: 'threadCountZ: '; print: threadCountZ; nextPutAll: ';' ].

	super storeFieldsOn: aStream
]

{ #category : 'accessing' }
SDL3GPUComputeShaderMetadata >> threadCountX [
	^ threadCountX
]

{ #category : 'accessing' }
SDL3GPUComputeShaderMetadata >> threadCountX: anInteger [
	threadCountX := anInteger
]

{ #category : 'accessing' }
SDL3GPUComputeShaderMetadata >> threadCountY [
	^ threadCountY
]

{ #category : 'accessing' }
SDL3GPUComputeShaderMetadata >> threadCountY: anInteger [
	threadCountY := anInteger
]

{ #category : 'accessing' }
SDL3GPUComputeShaderMetadata >> threadCountZ [
	^ threadCountZ
]

{ #category : 'accessing' }
SDL3GPUComputeShaderMetadata >> threadCountZ: anInteger [
	threadCountZ := anInteger
]
