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
	#category : 'SDL3-ShaderScanner',
	#package : 'SDL3-ShaderScanner'
}

{ #category : 'accessing' }
SDL3GPUShaderMetadata >> allBindings [
	^ uniformBuffers , samplers , storageBuffers , storageTextures
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

{ #category : 'printing' }
SDL3GPUShaderMetadata >> storeOn: aStream [

	self hasCustomMetadata
		ifFalse: [ 
			aStream
				nextPutAll: self class name;
				nextPutAll: ' new' ]
		ifTrue: [ 
			aStream
				nextPutAll: '(';
				nextPutAll: self class name;
				nextPutAll: ' new'.
			self storeFieldsOn: aStream.
			aStream
				cr; tab; tab; nextPutAll: 'yourself)' ]
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
