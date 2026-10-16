"
I hold metadata specific to compute shaders, including thread counts.
"
Class {
	#name : 'SDL3GPUComputeShaderMetadata',
	#superclass : 'SDL3GPUShaderMetadata',
	#instVars : [
		'threadCountX',
		'threadCountY',
		'threadCountZ'
	],
	#category : 'SDL3-GPU-ShaderMetadata',
	#package : 'SDL3-GPU',
	#tag : 'ShaderMetadata'
}

{ #category : 'testing' }
SDL3GPUComputeShaderMetadata >> hasCustomMetadata [

	^ super hasCustomMetadata or: [ 
		  threadCountX ~= 1 or: [ threadCountY ~= 1 or: [ threadCountZ ~= 1 ] ] ]
]

{ #category : 'initialization' }
SDL3GPUComputeShaderMetadata >> initialize [
	super initialize.
	threadCountX := 1.
	threadCountY := 1.
	threadCountZ := 1.
]

{ #category : 'scanning' }
SDL3GPUComputeShaderMetadata >> scanFromSource: aString [

	super scanFromSource: aString.
	"Scan compute workgroup thread dimensions."
	self scanWorkgroupsFrom: aString
]

{ #category : 'private - scanning' }
SDL3GPUComputeShaderMetadata >> scanWorkgroupsFrom: aString [

	| matcher defines valX valY valZ resolve |
	"Collect #define numeric constants for resolving macro-based thread counts."
	defines := Dictionary new.
	aString lines do: [ :line |
		| m |
		m := '#define +([A-Z0-9_]+) +([0-9]+)' asRegex.
		(m search: line) ifTrue: [
			defines at: (m subexpression: 2) put: (m subexpression: 3) ] ].

	"Match [numthreads(X, Y, Z)] attribute."
	matcher := 'numthreads *[(] *([^,)]+) *, *([^,)]+) *, *([^,)]+) *[)]' asRegex.

	(matcher search: aString) ifFalse: [ ^ self ].

	"Resolve thread count dimension from either literal integer or macro."
	resolve := [ :s |
		| trimmed |
		trimmed := s trimBoth.
		trimmed first isDigit
			ifTrue: [ trimmed asInteger ]
			ifFalse: [
				defines
					at: trimmed
					ifAbsent: [
						self error: 'Could not resolve #define: ', trimmed ] ] ].

	valX := resolve value: (matcher subexpression: 2).
	valY := resolve value: (matcher subexpression: 3).
	valZ := resolve value: (matcher subexpression: 4).

	threadCountX := valX asInteger.
	threadCountY := valY asInteger.
	threadCountZ := valZ asInteger
]

{ #category : 'printing' }
SDL3GPUComputeShaderMetadata >> storeFieldsOn: aStream [

	threadCountX ~= 1 ifTrue: [ 
		aStream
			cr; tab; tab; nextPutAll: 'threadCountX: '; print: threadCountX; nextPutAll: ';' ].
	threadCountY ~= 1 ifTrue: [ 
		aStream
			cr; tab; tab; nextPutAll: 'threadCountY: '; print: threadCountY; nextPutAll: ';' ].
	threadCountZ ~= 1 ifTrue: [ 
		aStream
			cr; tab; tab; nextPutAll: 'threadCountZ: '; print: threadCountZ; nextPutAll: ';' ].

	super storeFieldsOn: aStream
]

{ #category : 'accessing' }
SDL3GPUComputeShaderMetadata >> threadCountX [
	^ threadCountX
]

{ #category : 'accessing' }
SDL3GPUComputeShaderMetadata >> threadCountX: anInteger [
	threadCountX := anInteger
]

{ #category : 'accessing' }
SDL3GPUComputeShaderMetadata >> threadCountY [
	^ threadCountY
]

{ #category : 'accessing' }
SDL3GPUComputeShaderMetadata >> threadCountY: anInteger [
	threadCountY := anInteger
]

{ #category : 'accessing' }
SDL3GPUComputeShaderMetadata >> threadCountZ [
	^ threadCountZ
]

{ #category : 'accessing' }
SDL3GPUComputeShaderMetadata >> threadCountZ: anInteger [
	threadCountZ := anInteger
]
