"
I hold metadata specific to fragment shaders, such as expected output targets.
"
Class {
	#name : 'SDL3GPUFragmentShaderMetadata',
	#superclass : 'SDL3GPUShaderMetadata',
	#instVars : [
		'outputTargets'
	],
	#category : 'SDL3-ShaderScanner',
	#package : 'SDL3-ShaderScanner'
}

{ #category : 'initialization' }
SDL3GPUFragmentShaderMetadata >> initialize [
	super initialize.
	outputTargets := OrderedCollection new.
]

{ #category : 'accessing' }
SDL3GPUFragmentShaderMetadata >> outputTargets [
	^ outputTargets
]

{ #category : 'accessing' }
SDL3GPUFragmentShaderMetadata >> outputTargets: anObject [
	outputTargets := anObject
]
