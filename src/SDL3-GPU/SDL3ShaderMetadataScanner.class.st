"
I scan HLSL source code to extract metadata using regular expressions.
"
Class {
	#name : 'SDL3ShaderMetadataScanner',
	#superclass : 'Object',
	#category : 'SDL3-GPU-ShaderScanner',
	#package : 'SDL3-GPU',
	#tag : 'ShaderScanner'
}

{ #category : 'scanning' }
SDL3ShaderMetadataScanner class >> scan: aString [
	^ self new scan: aString
]

{ #category : 'private - scanning' }
SDL3ShaderMetadataScanner >> bindingClassFor: aType register: aChar [

	aType = #sampler ifTrue: [ ^ SDL3GPUSamplerBinding ].
	aType = #uniform ifTrue: [ ^ SDL3GPUUniformBinding ].
	
	aType = #storageBuffer ifTrue: [ 
		aChar = $t ifTrue: [ ^ SDL3GPUReadOnlyStorageBufferBinding ].
		aChar = $u ifTrue: [ ^ SDL3GPUReadWriteStorageBufferBinding ] ].
		
	aType = #storageTexture ifTrue: [ 
		aChar = $t ifTrue: [ ^ SDL3GPUReadOnlyStorageTextureBinding ].
		aChar = $u ifTrue: [ ^ SDL3GPUReadWriteStorageTextureBinding ] ].
		
	self error: 'Unknown binding type/register combination'
]

{ #category : 'private - scanning' }
SDL3ShaderMetadataScanner >> extractBindingFrom: aLine type: aType ifPresent: aBlock [

	| registerMatcher indexMatcher spaceMatcher binding registerPart registerChar className |
	registerMatcher := 'register *[(][^)]+[)]' asRegex.

	(registerMatcher search: aLine) ifFalse: [ ^ self ].

	registerPart := registerMatcher subexpression: 1.
	registerPart := registerPart isString
		                ifTrue: [ registerPart ]
		                ifFalse: [ registerPart first ].

	indexMatcher := '[stub][0-9]+' asRegex.
	spaceMatcher := 'space[0-9]+' asRegex.

	(indexMatcher search: registerPart) ifFalse: [ ^ self ].

	registerChar := (indexMatcher subexpression: 1) first.

	binding := (self bindingClassFor: aType register: registerChar) new.
	binding index: ((indexMatcher subexpression: 1) select: #isDigit) asInteger.

	(spaceMatcher search: registerPart) ifTrue: [ 
		binding space:
			((spaceMatcher subexpression: 1) select: #isDigit) asInteger ].

	className := nil.
	aType = #storageBuffer ifTrue: [ | m |
		m := 'StructuredBuffer *< *([A-Za-z0-9_]+) *>' asRegex.
		(m search: aLine) ifTrue: [ className := m subexpression: 2 ] ].
	aType = #uniform ifTrue: [ | m |
		m := 'cbuffer +([A-Za-z0-9_]+)' asRegex.
		(m search: aLine) ifFalse: [ 
			m := 'ConstantBuffer *< *([A-Za-z0-9_]+) *>' asRegex ].
		(m search: aLine) ifTrue: [ className := m subexpression: 2 ] ].

	className ifNotNil: [ 
		binding linkedClass: (self class environment classNamed: className) ].

	^ aBlock value: binding
]

{ #category : 'scanning' }
SDL3ShaderMetadataScanner >> scan: aString [

	| metadata |
	metadata := ('numthreads *[(]' asRegex search: aString)
		            ifTrue: [ SDL3GPUComputeShaderMetadata new ]
		            ifFalse: [ 
			            (aString includesSubstring: 'SV_Target')
				            ifTrue: [ SDL3GPUFragmentShaderMetadata new ]
				            ifFalse: [ 
					            (aString includesSubstring: 'SV_Position')
						            ifTrue: [ SDL3GPUVertexShaderMetadata new ]
						            ifFalse: [ SDL3GPUShaderMetadata new ] ] ].

	(metadata isKindOf: SDL3GPUComputeShaderMetadata) ifTrue: [ 
		self scanWorkgroups: aString into: metadata ].

	self scanBindingsIn: aString into: metadata.

	^ metadata
]

{ #category : 'private - scanning' }
SDL3ShaderMetadataScanner >> scanBindingsIn: aString into: metadata [

	aString lines do: [ :line |
		((line includesSubstring: 'SamplerState') and: [
			line includesSubstring: 'register' ]) ifTrue: [
			self extractBindingFrom: line type: #sampler ifPresent: [ :b | 
				metadata samplers add: b ] ].

		((line includesSubstring: 'StructuredBuffer') and: [
			 line includesSubstring: 'register' ]) ifTrue: [
			self extractBindingFrom: line type: #storageBuffer ifPresent: [ :b | 
				metadata storageBuffers add: b ] ].

		(((line includesSubstring: 'Texture2D') or: [ line includesSubstring: 'RWTexture2D' ]) and: [
			 line includesSubstring: 'register' ]) ifTrue: [
			| isStorage |
			isStorage := true.
			(line includesSubstring: 'RWTexture2D') ifFalse: [
				| varName |
				varName := (line copyUpTo: $:) substrings last.
				((aString includesSubstring: varName , '.Sample') or: [ 
					aString includesSubstring: varName , '.SampleLevel' ]) ifTrue: [
					isStorage := false ] ].
			isStorage ifTrue: [
				self extractBindingFrom: line type: #storageTexture ifPresent: [ :b |
					metadata storageTextures add: b ] ] ].

		(((line includesSubstring: 'cbuffer') or: [ line includesSubstring: 'ConstantBuffer' ]) and: [
			 line includesSubstring: 'register' ]) ifTrue: [
			self extractBindingFrom: line type: #uniform ifPresent: [ :b |
				metadata uniformBuffers add: b ] ] ]
]

{ #category : 'private - scanning' }
SDL3ShaderMetadataScanner >> scanWorkgroups: aString into: metadata [

	| matcher defines |
	defines := Dictionary new.
	aString lines do: [ :line | 
		| m |
		m := '#define +([A-Z0-9_]+) +([0-9]+)' asRegex.
		(m search: line) ifTrue: [ 
			defines at: (m subexpression: 2) put: (m subexpression: 3) ] ].

	matcher := 'numthreads *[(] *([^,)]+) *, *([^,)]+) *, *([^,)]+) *[)]' asRegex.
	(matcher search: aString) ifTrue: [ 
		| valX valY valZ resolve |
		resolve := [ :s | 
		           | trimmed |
		           trimmed := s trimBoth.
		           trimmed first isDigit
			           ifTrue: [ trimmed asInteger ]
			           ifFalse: [ 
				           defines
					           at: trimmed
					           ifAbsent: [ 
					           self error: 'Could not resolve #define: ' , trimmed ] ] ].

		valX := resolve value: (matcher subexpression: 2).
		valY := resolve value: (matcher subexpression: 3).
		valZ := resolve value: (matcher subexpression: 4).

		metadata threadCountX: valX asInteger.
		metadata threadCountY: valY asInteger.
		metadata threadCountZ: valZ asInteger ]
]
