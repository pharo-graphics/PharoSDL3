Class {
	#name : 'SDL3GPUVertexShaderMetadata',
	#superclass : 'SDL3GPUShaderMetadata',
	#instVars : [
		'inputAttributes'
	],
	#category : 'SDL3-ShaderScanner',
	#package : 'SDL3-ShaderScanner'
}

{ #category : 'initialization' }
SDL3GPUVertexShaderMetadata >> initialize [
	super initialize.
	inputAttributes := OrderedCollection new.
]

{ #category : 'accessing' }
SDL3GPUVertexShaderMetadata >> inputAttributes [
	^ inputAttributes
]

{ #category : 'accessing' }
SDL3GPUVertexShaderMetadata >> inputAttributes: anObject [
	inputAttributes := anObject
]
