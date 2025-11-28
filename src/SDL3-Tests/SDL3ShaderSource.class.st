"
I represent SDL3 shader sources.
"
Class {
	#name : 'SDL3ShaderSource',
	#superclass : 'Object',
	#instVars : [
		'source',
		'format'
	],
	#category : 'SDL3-Tests-Shaders',
	#package : 'SDL3-Tests',
	#tag : 'Shaders'
}

{ #category : 'formatting' }
SDL3ShaderSource class >> format: aSDL3GPUShaderFormat sourceByteArray: aByteArray [

	^ self new
		format: aSDL3GPUShaderFormat;
		sourceByteArray: aByteArray;
		yourself
]

{ #category : 'accessing' }
SDL3ShaderSource >> format [

	^ format
]

{ #category : 'accessing' }
SDL3ShaderSource >> format: aSDL3GPUShaderFormat [

	format := aSDL3GPUShaderFormat
]

{ #category : 'accessing' }
SDL3ShaderSource >> source [

	^ source
]

{ #category : 'accessing' }
SDL3ShaderSource >> source: anObject [

	source := anObject
]

{ #category : 'accessing' }
SDL3ShaderSource >> sourceByteArray: aByteArray [

	source :=
		FFIExternalArray
			externalNewType: 'char'
			size: aByteArray size.

	aByteArray withIndexDo: [ :each :index | source at: index put: each ].
	
	source autoRelease
]
