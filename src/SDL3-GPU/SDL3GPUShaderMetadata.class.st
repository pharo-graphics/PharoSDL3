"
I hold the common metadata for any kind of shader.
"
Class {
	#name : 'SDL3GPUShaderMetadata',
	#superclass : 'Object',
	#instVars : [
		'samplers',
		'uniformBuffers',
		'storageBuffers',
		'storageTextures'
	],
	#category : 'SDL3-GPU-ShaderMetadata',
	#package : 'SDL3-GPU',
	#tag : 'ShaderMetadata'
}

{ #category : 'instance creation' }
SDL3GPUShaderMetadata class >> scanFromSource: aString [

	^ self new
		scanFromSource: aString;
		yourself
]

{ #category : 'accessing' }
SDL3GPUShaderMetadata >> allBindings [
	^ uniformBuffers , samplers , storageBuffers , storageTextures
]

{ #category : 'private - scanning' }
SDL3GPUShaderMetadata >> bindingClassFor: aType register: aChar [

	"Map binding type and HLSL register character (t=read-only, u=read-write) to binding class."
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
SDL3GPUShaderMetadata >> extractBindingFrom: aLine type: aType ifPresent: aBlock [

	| registerMatcher indexMatcher spaceMatcher binding registerPart registerChar className |
	"Extract the register(...) declaration."
	registerMatcher := 'register *[(][^)]+[)]' asRegex.

	(registerMatcher search: aLine) ifFalse: [ ^ self ].

	registerPart := registerMatcher subexpression: 1.
	registerPart := registerPart isString
		                ifTrue: [ registerPart ]
		                ifFalse: [ registerPart first ].

	indexMatcher := '[stub][0-9]+' asRegex.
	spaceMatcher := 'space[0-9]+' asRegex.

	(indexMatcher search: registerPart) ifFalse: [ ^ self ].

	"Parse register type character (s, t, u, b) and slot index."
	registerChar := (indexMatcher subexpression: 1) first.

	binding := (self bindingClassFor: aType register: registerChar) new.
	binding index: ((indexMatcher subexpression: 1) select: #isDigit) asInteger.

	"Parse optional descriptor space (defaults to space 0 if omitted)."
	(spaceMatcher search: registerPart) ifTrue: [
		binding space:
			((spaceMatcher subexpression: 1) select: #isDigit) asInteger ].

	"Resolve associated Smalltalk structure class for structured buffers or uniform buffers."
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

{ #category : 'testing' }
SDL3GPUShaderMetadata >> hasCustomMetadata [

	^ samplers isNotEmpty or: [ 
		  uniformBuffers isNotEmpty or: [ 
			  storageBuffers isNotEmpty or: [ storageTextures isNotEmpty ] ] ]
]

{ #category : 'validation' }
SDL3GPUShaderMetadata >> hasSpaceCollision [
	"Detects if any space index is shared by both RO and RW resources.
	Mixing them in the same space causes transpilation issues in shadercross/Metal."
	
	| roSpaces rwSpaces |
	roSpaces := (self allBindings select: #isReadOnly) collect: #space as: Set.
	rwSpaces := (self allBindings select: #isReadWrite) collect: #space as: Set.
		
	^ (roSpaces intersection: rwSpaces) isNotEmpty
]

{ #category : 'initialization' }
SDL3GPUShaderMetadata >> initialize [
	super initialize.
	samplers := OrderedCollection new.
	uniformBuffers := OrderedCollection new.
	storageBuffers := OrderedCollection new.
	storageTextures := OrderedCollection new.
]

{ #category : 'accessing' }
SDL3GPUShaderMetadata >> numberOfReadOnlyStorageBuffers [

	^ storageBuffers count: [ :each | each isReadOnly ]
]

{ #category : 'accessing' }
SDL3GPUShaderMetadata >> numberOfReadOnlyStorageTextures [

	^ storageTextures count: [ :each | each isReadOnly ]
]

{ #category : 'accessing' }
SDL3GPUShaderMetadata >> numberOfReadWriteStorageBuffers [

	^ storageBuffers count: [ :each | each isReadWrite ]
]

{ #category : 'accessing' }
SDL3GPUShaderMetadata >> numberOfReadWriteStorageTextures [

	^ storageTextures count: [ :each | each isReadWrite ]
]

{ #category : 'accessing' }
SDL3GPUShaderMetadata >> samplers [
	^ samplers
]

{ #category : 'accessing' }
SDL3GPUShaderMetadata >> samplers: anObject [
	samplers := anObject
]

{ #category : 'private - scanning' }
SDL3GPUShaderMetadata >> scanBindingsFrom: aString [

	aString lines do: [ :line |
		"Scan sampler states (register(s#))."
		((line includesSubstring: 'SamplerState') and: [
			line includesSubstring: 'register' ]) ifTrue: [
			self extractBindingFrom: line type: #sampler ifPresent: [ :b |
				samplers add: b ] ].

		"Scan storage buffers (register(t#) for RO or register(u#) for RW)."
		((line includesSubstring: 'StructuredBuffer') and: [
			line includesSubstring: 'register' ]) ifTrue: [
			self extractBindingFrom: line type: #storageBuffer ifPresent: [ :b |
				storageBuffers add: b ] ].

		"Scan storage textures; sampled textures (accessed via .Sample/.SampleLevel) are excluded."
		(((line includesSubstring: 'Texture2D') or: [ line includesSubstring: 'RWTexture2D' ]) and: [
			line includesSubstring: 'register' ]) ifTrue: [
			| isStorage |
			isStorage := true.
			(line includesSubstring: 'RWTexture2D') ifFalse: [
				| varName |
				varName := (line copyUpTo: $:) substrings last.
				((aString includesSubstring: varName, '.Sample') or: [
					aString includesSubstring: varName, '.SampleLevel' ]) ifTrue: [
					isStorage := false ] ].
			isStorage ifTrue: [
				self extractBindingFrom: line type: #storageTexture ifPresent: [ :b |
					storageTextures add: b ] ] ].

		"Scan uniform buffers / cbuffers (register(b#))."
		(((line includesSubstring: 'cbuffer') or: [ line includesSubstring: 'ConstantBuffer' ]) and: [
			line includesSubstring: 'register' ]) ifTrue: [
			self extractBindingFrom: line type: #uniform ifPresent: [ :b |
				uniformBuffers add: b ] ] ]
]

{ #category : 'scanning' }
SDL3GPUShaderMetadata >> scanFromSource: aString [

	"Scan HLSL source code to extract resource binding metadata."
	self scanBindingsFrom: aString
]

{ #category : 'accessing' }
SDL3GPUShaderMetadata >> storageBuffers [
	^ storageBuffers
]

{ #category : 'accessing' }
SDL3GPUShaderMetadata >> storageBuffers: anObject [
	storageBuffers := anObject
]

{ #category : 'accessing' }
SDL3GPUShaderMetadata >> storageTextures [
	^ storageTextures
]

{ #category : 'accessing' }
SDL3GPUShaderMetadata >> storageTextures: anObject [
	storageTextures := anObject
]

{ #category : 'printing' }
SDL3GPUShaderMetadata >> storeFieldsOn: aStream [

	samplers ifNotEmpty: [ 
		aStream cr; tab; tab; nextPutAll: 'samplers: {'.
		samplers
			do: [ :each | aStream cr; tab; tab; tab; store: each ]
			separatedBy: [ aStream nextPutAll: '.' ].
		aStream nextPutAll: ' };' ].

	uniformBuffers ifNotEmpty: [ 
		aStream cr; tab; tab; nextPutAll: 'uniformBuffers: {'.
		uniformBuffers
			do: [ :each | aStream cr; tab; tab; tab; store: each ]
			separatedBy: [ aStream nextPutAll: '.' ].
		aStream nextPutAll: ' };' ].

	storageBuffers ifNotEmpty: [ 
		aStream cr; tab; tab; nextPutAll: 'storageBuffers: {'.
		storageBuffers
			do: [ :each | aStream cr; tab; tab; tab; store: each ]
			separatedBy: [ aStream nextPutAll: '.' ].
		aStream nextPutAll: ' };' ].

	storageTextures ifNotEmpty: [ 
		aStream cr; tab; tab; nextPutAll: 'storageTextures: {'.
		storageTextures
			do: [ :each | aStream cr; tab; tab; tab; store: each ]
			separatedBy: [ aStream nextPutAll: '.' ].
		aStream nextPutAll: ' };' ]
]

{ #category : 'storing' }
SDL3GPUShaderMetadata >> storeOn: aStream [

	| fieldsString |
	fieldsString := String streamContents: [ :fieldsStream |
		self storeFieldsOn: fieldsStream ].
	aStream
		nextPut: $(;
		nextPutAll: self class name;
		nextPutAll: ' new'.
	fieldsString ifNotEmpty: [
		aStream
			nextPutAll: fieldsString;
			cr; tab; tab;
			nextPutAll: 'yourself' ].
	aStream nextPut: $)
]

{ #category : 'accessing' }
SDL3GPUShaderMetadata >> uniformBuffers [
	^ uniformBuffers
]

{ #category : 'accessing' }
SDL3GPUShaderMetadata >> uniformBuffers: anObject [
	uniformBuffers := anObject
]

{ #category : 'validation' }
SDL3GPUShaderMetadata >> validateGroundTruth [
	"Validates that resources follow the mandated space assignments in GPU-Resource-Mapping.md"

	self hasSpaceCollision ifTrue: [
		self error: 'Shader resource collision: Read-Only and Read-Write bindings cannot share the same descriptor space.' ].
	self allBindings do: [ :each | each validateGroundTruth ]
]

{ #category : 'validation' }
SDL3GPUShaderMetadata >> validateSamplerCount: anInteger [
	samplers size = anInteger ifFalse: [
		self error: ('Sampler count mismatch. HLSL has {1}, but Smalltalk expects {2}' 
			format: { samplers size . anInteger }) ]
]

{ #category : 'validation' }
SDL3GPUShaderMetadata >> validateUniformBufferCount: anInteger [
	uniformBuffers size = anInteger ifFalse: [
		self error: ('Uniform buffer count mismatch. HLSL has {1}, but Smalltalk expects {2}' 
			format: { uniformBuffers size . anInteger }) ]
]
