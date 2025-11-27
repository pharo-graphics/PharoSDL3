Class {
	#name : 'SDL3ShaderDemoEffect',
	#superclass : 'Object',
	#instVars : [
		'name',
		'numberOfSamplers',
		'numberOfUniformBuffers',
		'shader',
		'state',
		'shaderSources'
	],
	#category : 'SDL3-Tests-Shaders',
	#package : 'SDL3-Tests',
	#tag : 'Shaders'
}

{ #category : 'examples' }
SDL3ShaderDemoEffect class >> crt [ 

	^ self basicNew
		initializeName: 'CRT'
		samplers: 1
		uniformBuffers: 1
		sources: SDL3ShaderSource crtAll;
		yourself
]

{ #category : 'initialization' }
SDL3ShaderDemoEffect >> initializeName: aName samplers: aNumberOfSamplers uniformBuffers: aNumberOfUniformBuffers sources: aCollectionOfSources [

	self initialize.

	name := aName.
	shaderSources := aCollectionOfSources.
	numberOfSamplers := aNumberOfSamplers.
	numberOfUniformBuffers := aNumberOfUniformBuffers
]

{ #category : 'accessing' }
SDL3ShaderDemoEffect >> name [

	^ name
]

{ #category : 'accessing' }
SDL3ShaderDemoEffect >> numberOfSamplers [

	^ numberOfSamplers
]

{ #category : 'accessing' }
SDL3ShaderDemoEffect >> numberOfUniformBuffers [

	^ numberOfUniformBuffers
]

{ #category : 'accessing' }
SDL3ShaderDemoEffect >> shader [

	^ shader
]

{ #category : 'accessing' }
SDL3ShaderDemoEffect >> shader: anObject [

	shader := anObject
]

{ #category : 'accessing' }
SDL3ShaderDemoEffect >> shaderSources [

	^ shaderSources
]

{ #category : 'accessing' }
SDL3ShaderDemoEffect >> state [

	^ state
]

{ #category : 'accessing' }
SDL3ShaderDemoEffect >> state: anObject [

	state := anObject
]
