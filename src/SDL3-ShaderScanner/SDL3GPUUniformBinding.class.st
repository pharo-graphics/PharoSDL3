"
I represent a uniform buffer binding (register b).
"
Class {
	#name : 'SDL3GPUUniformBinding',
	#superclass : 'SDL3GPUBinding',
	#category : 'SDL3-ShaderScanner',
	#package : 'SDL3-ShaderScanner'
}

{ #category : 'accessing' }
SDL3GPUUniformBinding >> registerType [
	^ $b
]

{ #category : 'validation' }
SDL3GPUUniformBinding >> validateGroundTruth [
	self assert: (space = 1 or: [ space = 2 or: [ space = 3 ] ])
		description: 'Uniforms (register b) must be in space1 (Vertex), space2 (Compute), or space3 (Fragment)'
]
