"
I represent a fragment shader to be used in the SDL3 library, and provide convenience API to embed shaders as Pharo code. Such API is based on `SDL_shadercross` to generate DXIL, MSL and SPV compiled shaders from HLSL (a human-readable format). `SDL_shadercross` is a library for translating shaders to different formats, and MUST be installed and either in your PATH, or close to the Pharo image's working directory.

For more information, see: https://github.com/libsdl-org/SDL_shadercross

"
Class {
	#name : 'SDL3ShaderSource',
	#superclass : 'Object',
	#category : 'SDL3-Own',
	#package : 'SDL3-Own'
}

{ #category : 'code generation' }
SDL3ShaderSource class >> generateEmbeddedSourceAt: hlslFilename toExtension: extension [

	| result outputFilename outputContents methodSourceCode fileReference stageExtension |
	stageExtension :=
		self shaderStage = SDL3GPUShaderStage vertex
			ifTrue: [ 'vert' ] ifFalse: [ 'frag' ].
	outputFilename := '{1}.{2}.{3}' format: { self name. stageExtension. extension }.

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
			print: outputContents base64Encoded ].
	
	self classSide
		compile: methodSourceCode
		classified: #accessing.
	
	fileReference ensureDelete
]

{ #category : 'code generation' }
SDL3ShaderSource class >> generateEmbeddedSourcesFromHLSL [
	<example>

	| hlslFilename stageExtension |
	stageExtension := (self shaderStage == SDL3GPUShaderStage vertex) ifTrue: [ 'vert' ] ifFalse: [ 'frag' ].
	hlslFilename := '{1}.{2}.hlsl' format: { self className. stageExtension }.
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

	self allSubclassesDo: [ :each |
		(each classSide includesSelector: #hlslSource) ifTrue: [ 
			each generateEmbeddedSourcesFromHLSL ] ]
]

{ #category : 'accessing' }
SDL3ShaderSource class >> hlslSource [

	^ self subclassResponsibility
]

{ #category : 'instance creation' }
SDL3ShaderSource class >> newShaderAmong: supportedShaderFormats device: aSDL3GPUDevice [

	| createInfo |
	createInfo :=
		SDL3GPUShaderCreateInfo new
			stage: self shaderStage;
			numSamplers: self numberOfSamplers;
			numUniformBuffers: self numberOfUniformBuffers;
			yourself.

	"TODO: Either write a builder that stores the selector or fill create info in a double-dispatch"
	(supportedShaderFormats includes: SDL3GPUShaderFormat dxil) ifTrue: [
		createInfo
			format: SDL3GPUShaderFormat dxil asInteger;
			base64Source: self sourceCompiledAsDXIL ].
	(supportedShaderFormats includes: SDL3GPUShaderFormat msl) ifTrue: [
		createInfo
			format: SDL3GPUShaderFormat msl asInteger;
			base64Source: self sourceCompiledAsMSL ].
	(supportedShaderFormats includes: SDL3GPUShaderFormat spirv) ifTrue: [
		createInfo
			format: SDL3GPUShaderFormat spirv asInteger;
			base64Source: self sourceCompiledAsSPV ].
	createInfo format = 0 ifTrue: [ NotFound signal ].

	^ aSDL3GPUDevice newGPUShaderCreateinfo: createInfo
]

{ #category : 'accessing' }
SDL3ShaderSource class >> numberOfSamplers [

	^ self subclassResponsibility
]

{ #category : 'accessing' }
SDL3ShaderSource class >> numberOfUniformBuffers [

	^ self subclassResponsibility
]

{ #category : 'accessing' }
SDL3ShaderSource class >> shaderStage [

	^ SDL3GPUShaderStage fragment
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
