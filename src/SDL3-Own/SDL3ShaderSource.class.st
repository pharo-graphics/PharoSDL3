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
	#category : 'SDL3-Own-Shaders',
	#package : 'SDL3-Own',
	#tag : 'Shaders'
}

{ #category : 'private' }
SDL3ShaderSource class >> base64CodeSelectorAt: formatExtension [

	^ {
		#dxil -> #base64DXILCode.
		#msl -> #base64MSLCode.
		#spv -> #base64SPVCode.
		} asDictionary at: formatExtension
]

{ #category : 'accessing' }
SDL3ShaderSource class >> base64DXILCode [

	^ self subclassResponsibility
]

{ #category : 'accessing' }
SDL3ShaderSource class >> base64MSLCode [

	^ self subclassResponsibility
]

{ #category : 'accessing' }
SDL3ShaderSource class >> base64SPVCode [

	^ self subclassResponsibility
]

{ #category : 'private' }
SDL3ShaderSource class >> compileBase64Code: shadercrossOutput as: selector [

	| methodSourceCode |
	methodSourceCode := String streamContents: [ :stream |
		stream
			nextPutAll: selector;
			cr;
			tab; nextPutAll: '"Generated from #hlslSource"';
			cr; cr;
			tab; nextPutAll: '^ ';
			print: (ZnBase64Encoder new encode: shadercrossOutput) ].

	self classSide
		compile: methodSourceCode
		classified: #accessing
]

{ #category : 'code generation' }
SDL3ShaderSource class >> compileBase64CodeFromHLSLSource [
	"Transpile the HLSL code answered by `#hlslSource` to DXIL, MSL and SPV binaries, which will be encoded as BASE64 in `#base64DXILCode` and similar. Read class comment for more information."

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
			compileBase64Code: binaryContents
			as: (self base64CodeSelectorAt: formatExtension) ].

	hlslFilename asFileReference ensureDelete
]

{ #category : 'code generation' }
SDL3ShaderSource class >> compileBase64CodeFromHLSLSourceInAllSubclasses [
	<script>

	self allSubclassesDo: [ :each |
		Stdio stdout << 'Transpiling ' << each name; lf.
		(each classSide includesSelector: #hlslSource) ifTrue: [ 
			each compileBase64CodeFromHLSLSource ] ]
]

{ #category : 'code generation' }
SDL3ShaderSource class >> compileMetadataFromHLSLSource [

	| metadata methodSourceCode |
	metadata := SDL3ShaderMetadataScanner new scan: self hlslSource.
	methodSourceCode := String streamContents: [ :stream |
		stream
			nextPutAll: 'metadata'; cr; cr;
			tab; nextPutAll: '^ '.
		metadata storeOn: stream ].

	self classSide
		compile: methodSourceCode
		classified: #accessing
]

{ #category : 'code generation' }
SDL3ShaderSource class >> compileMetadataFromHLSLSourceInAllSubclasses [
	<script>

	self allSubclassesDo: [ :each |
		Stdio stdout << 'Scanning metadata of ' << each name; lf.
		(each classSide includesSelector: #hlslSource) ifTrue: [ 
			each compileMetadataFromHLSLSource ] ]
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
SDL3ShaderSource class >> metadata [
	^ SDL3GPUShaderMetadata new
]

{ #category : 'private' }
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
SDL3ShaderSource class >> stageFileExtension [

	^ self subclassResponsibility
]

{ #category : 'private' }
SDL3ShaderSource class >> withNew: createInfoClass formats: supportedShaderFormats do: aBlock [
	"Either fragment, vertex or compute shaders, all of them have a common createInfo setup."

	| createInfo codeAsBase64 codeAsByteArray codeAsExternalArray |
	createInfo := createInfoClass new.
	createInfo
		numSamplers: self metadata samplers size;
		numUniformBuffers: self metadata uniformBuffers size.

	"Detect the format among the supported ones"
	(supportedShaderFormats includes: SDL_GPU_SHADERFORMAT_DXIL) ifTrue: [
		createInfo format: SDL_GPU_SHADERFORMAT_DXIL asInteger.
		codeAsBase64 := self base64DXILCode ].
	(supportedShaderFormats includes: SDL_GPU_SHADERFORMAT_MSL) ifTrue: [
		createInfo format: SDL_GPU_SHADERFORMAT_MSL asInteger.
		codeAsBase64 := self base64MSLCode ].
	(supportedShaderFormats includes: SDL_GPU_SHADERFORMAT_SPIRV) ifTrue: [
		createInfo format: SDL_GPU_SHADERFORMAT_SPIRV asInteger.
		codeAsBase64 := self base64SPVCode ].
	createInfo format = 0 ifTrue: [ NotFound signal ].

	"Decode the shader binary code from BASE64 to an external array (and free it later)"
	codeAsByteArray := ZnBase64Encoder new decode: codeAsBase64.
	codeAsExternalArray :=
		FFIArray
			externalNewType: FFICharacterType
			size: codeAsByteArray size.	
	LibC memCopy: codeAsByteArray to: codeAsExternalArray size: codeAsByteArray size.
	createInfo
		code: codeAsExternalArray;
		codeSize: codeAsExternalArray size.

	[ aBlock value: createInfo ] ensure: [ codeAsExternalArray free ]
]
