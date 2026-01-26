"
I represent a fragment shader to be used in the SDL3 library, and provide convenience API to embed shaders as Pharo code. Such API is based on SDL_shadercross to generate DXIL, MSL and SPV compiled shaders from HLSL human-readable source. SDL_shadercross is a library for translating shaders to different formats, and MUST be installed and either in your PATH, or close to the Pharo image's working directory.

For more information, see: https://github.com/libsdl-org/SDL_shadercross

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

{ #category : 'code generation' }
SDL3ShaderSource class >> generateEmbeddedSourceAt: hlslFilename toExtension: extension [

	| result outputFilename outputContents methodSourceCode fileReference |
	outputFilename := '{1}.frag.{2}' format: { self className. extension }.
	result := LibC runCommand:
		('shadercross "{1}" -o "{2}"' format: { hlslFilename. outputFilename }).
	self assert: result = 0 description: 'Compilation error - ', extension.

	fileReference := outputFilename asFileReference.
	self assert: fileReference exists.

	outputContents := fileReference binaryReadStreamDo: [ :stream | stream upToEnd ].
	
	methodSourceCode := String streamContents: [ :stream |
		stream
			nextPutAll: 'sourceCompiledAs';
			nextPutAll: extension asUppercase;
			cr;
			tab; nextPutAll: '"This method was generated from #hlslSource"';
			cr; cr;
			tab; nextPutAll: '^ ';
			print: outputContents base64Encoded;
			nextPutAll: ' base64Decoded' ].
	
	self classSide
		compile: methodSourceCode
		classified: #accessing.
	
	fileReference ensureDelete
]

{ #category : 'code generation' }
SDL3ShaderSource class >> generateEmbeddedSourcesFromHLSL [
	<example>

	| hlslFilename |
	hlslFilename := '{1}.frag.hlsl' format: { self className }.
	hlslFilename asFileReference
		ensureDelete;
		writeStreamDo: [ :stream | stream << self hlslSource ].

	#(dxil msl spv) do: [ :extension |
		self generateEmbeddedSourceAt: hlslFilename toExtension: extension ].

	hlslFilename asFileReference ensureDelete
]

{ #category : 'code generation' }
SDL3ShaderSource class >> generateEmbeddedSourcesFromHLSLInAllSubclasses [
	<example>

	self allSubclassesDo: #generateEmbeddedSourcesFromHLSL
]

{ #category : 'accessing' }
SDL3ShaderSource class >> hlslSource [

	^ self subclassResponsibility
]

{ #category : 'accessing' }
SDL3ShaderSource class >> sourceCompiledAsDXIL [

	^ self subclassResponsibility
]

{ #category : 'accessing' }
SDL3ShaderSource class >> sourceCompiledAsMSL [

	^ self subclassResponsibility
]

{ #category : 'accessing' }
SDL3ShaderSource class >> sourceCompiledAsSPV [

	^ self subclassResponsibility
]
