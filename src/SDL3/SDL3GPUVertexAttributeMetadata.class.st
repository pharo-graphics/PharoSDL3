"
I hold semantic metadata for a single HLSL struct VertexInput attribute scanned from shader source.
"
Class {
	#name : 'SDL3GPUVertexAttributeMetadata',
	#superclass : 'Object',
	#instVars : [
		'name',
		'type',
		'semantic',
		'location'
	],
	#category : 'SDL3-GPU-ShaderMetadata',
	#package : 'SDL3',
	#tag : 'GPU-ShaderMetadata'
}

{ #category : 'instance creation' }
SDL3GPUVertexAttributeMetadata class >> name: aName type: aType semantic: aSemantic location: anInteger [

	^ self new
		name: aName;
		type: aType;
		semantic: aSemantic;
		location: anInteger;
		yourself
]

{ #category : 'accessing' }
SDL3GPUVertexAttributeMetadata >> location [

	^ location
]

{ #category : 'accessing' }
SDL3GPUVertexAttributeMetadata >> location: anInteger [

	location := anInteger
]

{ #category : 'accessing' }
SDL3GPUVertexAttributeMetadata >> name [

	^ name
]

{ #category : 'accessing' }
SDL3GPUVertexAttributeMetadata >> name: aString [

	name := aString
]

{ #category : 'printing' }
SDL3GPUVertexAttributeMetadata >> printOn: aStream [

	super printOn: aStream.
	aStream
		nextPut: $(;
		nextPutAll: name;
		nextPutAll: ' : ';
		nextPutAll: type;
		nextPutAll: ' location: ';
		print: location;
		nextPutAll: ' semantic: ';
		nextPutAll: semantic;
		nextPut: $)
]

{ #category : 'accessing' }
SDL3GPUVertexAttributeMetadata >> semantic [

	^ semantic
]

{ #category : 'accessing' }
SDL3GPUVertexAttributeMetadata >> semantic: aString [

	semantic := aString
]

{ #category : 'storing' }
SDL3GPUVertexAttributeMetadata >> storeOn: aStream [

	aStream
		nextPut: $(;
		nextPutAll: self class name;
		nextPutAll: ' name: ';
		store: name;
		nextPutAll: ' type: ';
		store: type;
		nextPutAll: ' semantic: ';
		store: semantic;
		nextPutAll: ' location: ';
		store: location;
		nextPut: $)
]

{ #category : 'accessing' }
SDL3GPUVertexAttributeMetadata >> type [

	^ type
]

{ #category : 'accessing' }
SDL3GPUVertexAttributeMetadata >> type: aString [

	type := aString
]
