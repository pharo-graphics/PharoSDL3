"
I hold metadata specific to vertex shaders.
"
Class {
	#name : 'SDL3GPUVertexShaderMetadata',
	#superclass : 'SDL3GPUShaderMetadata',
	#instVars : [
		'inputAttributes'
	],
	#category : 'SDL3-GPU-ShaderMetadata',
	#package : 'SDL3',
	#tag : 'GPU-ShaderMetadata'
}

{ #category : 'testing' }
SDL3GPUVertexShaderMetadata >> hasCustomMetadata [

	^ super hasCustomMetadata or: [ inputAttributes isNotEmpty ]
]

{ #category : 'initialization' }
SDL3GPUVertexShaderMetadata >> initialize [
	super initialize.
	inputAttributes := OrderedCollection new.
]

{ #category : 'accessing' }
SDL3GPUVertexShaderMetadata >> inputAttributes [
	^ inputAttributes
]

{ #category : 'accessing' }
SDL3GPUVertexShaderMetadata >> inputAttributes: anObject [
	inputAttributes := anObject
]

{ #category : 'scanning' }
SDL3GPUVertexShaderMetadata >> scanFromSource: aString [

	super scanFromSource: aString.
	"Scan vertex input layout from struct VertexInput."
	self scanVertexInputFrom: aString
]

{ #category : 'private - scanning' }
SDL3GPUVertexShaderMetadata >> scanVertexInputFrom: aString [

	| startIndex endIndex body lines loc |
	"Locate the struct VertexInput declaration."
	startIndex := aString findString: 'struct VertexInput'.
	startIndex = 0 ifTrue: [ ^ self ].
	startIndex := aString indexOf: ${ startingAt: startIndex.
	startIndex = 0 ifTrue: [ ^ self ].
	endIndex := aString indexOf: $} startingAt: startIndex.
	endIndex = 0 ifTrue: [ ^ self ].

	"Extract individual attribute fields within the struct body."
	body := aString copyFrom: startIndex + 1 to: endIndex - 1.
	lines := body lines collect: #trimBoth thenReject: #isEmpty.
	loc := 0.
	lines do: [ :line |
		(line includesSubstring: ':') ifTrue: [
			| parts left right typeAndName type name semantic |
			parts := line splitOn: ':'.
			left := parts first trimBoth.
			right := (parts second copyUpTo: $;) trimBoth.
			typeAndName := left substrings.
			typeAndName size >= 2 ifTrue: [
				type := typeAndName first.
				name := typeAndName second.
				semantic := right.
				"Ignore HLSL system-value semantics (e.g. SV_InstanceID, SV_VertexID) as they are not vertex buffer attributes."
				(semantic asUppercase beginsWith: 'SV_') ifFalse: [
					inputAttributes add: (SDL3GPUVertexAttributeMetadata
						name: name
						type: type
						semantic: semantic
						location: loc).
					loc := loc + 1 ] ] ] ]
]

{ #category : 'printing' }
SDL3GPUVertexShaderMetadata >> storeFieldsOn: aStream [

	super storeFieldsOn: aStream.
	inputAttributes ifNotEmpty: [
		aStream cr; tab; tab; nextPutAll: 'inputAttributes: {'.
		inputAttributes
			do: [ :each | aStream cr; tab; tab; tab; store: each ]
			separatedBy: [ aStream nextPutAll: '.' ].
		aStream nextPutAll: ' };' ]
]
