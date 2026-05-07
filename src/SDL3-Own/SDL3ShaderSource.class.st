"
I represent a shader to be used in the SDL3 library, and provide convenience API to embed shaders as Pharo code. Such API is based on `SDL_shadercross` to generate DXIL, MSL and SPV compiled shaders from HLSL (a human-readable format). `SDL_shadercross` is a library for translating shaders to different formats, and MUST be installed and either in your PATH, or close to the Pharo image's working directory.

For more information, see: https://github.com/libsdl-org/SDL_shadercross
"
Class {
	#name : 'SDL3ShaderSource',
	#superclass : 'Object',
	#pools : [
		'SDL3AllEnumerations',
		'SDL3ZConstants'
	],
	#category : 'SDL3-Own',
	#package : 'SDL3-Own'
}

{ #category : 'code generation' }
SDL3ShaderSource class >> compileEmbeddedSource: shadercrossOutput as: selector [

	| methodSourceCode |

	methodSourceCode := String streamContents: [ :stream |
		stream
			nextPutAll: selector;
			cr;
			tab; nextPutAll: '"This method was generated from #hlslSource"';
			cr; cr;
			tab; nextPutAll: '^ ';
			print: shadercrossOutput base64Encoded ].
	
	self classSide
		compile: methodSourceCode
		classified: #accessing
]

{ #category : 'code generation' }
SDL3ShaderSource class >> embeddedSourceSelectorFor: formatExtension [

	^ #sourceCompiledAs, formatExtension asUppercase
]

{ #category : 'code generation' }
SDL3ShaderSource class >> generateEmbeddedSourcesFromHLSL [
	<example>

	| hlslFilename |
	hlslFilename := '{1}.{2}.hlsl' format: { self name. self stageFileExtension }.
	hlslFilename asFileReference
		ensureDelete;
		writeStreamDo: [ :stream | stream << self hlslSource withUnixLineEndings ].

	#(dxil msl spv) do: [ :formatExtension |
		| outputFilename binaryContents |
		outputFilename := '{1}.{2}.{3}' format: { self name. self stageFileExtension. formatExtension }.
		binaryContents := self shadercrossOutputFrom: hlslFilename to: outputFilename.
		self
			compileEmbeddedSource: binaryContents
			as: (self embeddedSourceSelectorFor: formatExtension) ].

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

{ #category : 'testing' }
SDL3ShaderSource class >> isAbstract [

	^ self == SDL3ShaderSource
]

{ #category : 'accessing' }
SDL3ShaderSource class >> numberOfSamplers [

	^ self subclassResponsibility
]

{ #category : 'accessing' }
SDL3ShaderSource class >> numberOfUniformBuffers [

	^ 0
]

{ #category : 'code generation' }
SDL3ShaderSource class >> shadercrossOutputFrom: hlslFilename to: outputFilename [

	| result outputContents fileReference commandString |
	commandString := 'shadercross "{1}" -o "{2}"' format: { hlslFilename. outputFilename }.

	result := LibC runCommand: commandString.
	self
		assert: result = 0
		description: [ LibC resultOfCommand: commandString, ' 2>&1 >/dev/null'  ].

	fileReference := outputFilename asFileReference.
	self assert: fileReference exists.

	outputContents := fileReference binaryReadStreamDo: [ :stream | stream upToEnd ].
		
	fileReference ensureDelete.
	
	^ outputContents
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

{ #category : 'code generation' }
SDL3ShaderSource class >> stageFileExtension [

	^ self subclassResponsibility
]
