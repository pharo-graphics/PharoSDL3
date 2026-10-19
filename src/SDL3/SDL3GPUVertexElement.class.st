"
I define the binding of a single vertex shader input location to a field in a vertex structure, specifying its 0-based byte offset and SDL3GPUVertexElementFormat.
"
Class {
	#name : 'SDL3GPUVertexElement',
	#superclass : 'Object',
	#instVars : [
		'location',
		'offset',
		'format'
	],
	#category : 'SDL3-GPU-Pipeline',
	#package : 'SDL3',
	#tag : 'GPU-Pipeline'
}

{ #category : 'instance creation' }
SDL3GPUVertexElement class >> location: aLocation offset: aByteOffset format: aFormat [

	^ self new
		location: aLocation;
		offset: aByteOffset;
		format: aFormat;
		yourself
]

{ #category : 'instance creation' }
SDL3GPUVertexElement class >> location: aLocation oneBasedOffset: aOneBasedOffset format: aFormat [

	^ self
		location: aLocation
		offset: aOneBasedOffset - 1
		format: aFormat
]

{ #category : 'converting' }
SDL3GPUVertexElement >> asVertexAttributeForSlot: aSlot [

	^ SDL3GPUVertexAttribute new
		bufferSlot: aSlot;
		location: location;
		format: format;
		offset: offset;
		yourself
]

{ #category : 'accessing' }
SDL3GPUVertexElement >> format [

	^ format
]

{ #category : 'accessing' }
SDL3GPUVertexElement >> format: aFormat [

	format := aFormat
]

{ #category : 'accessing' }
SDL3GPUVertexElement >> location [

	^ location
]

{ #category : 'accessing' }
SDL3GPUVertexElement >> location: anInteger [

	location := anInteger
]

{ #category : 'accessing' }
SDL3GPUVertexElement >> offset [

	^ offset
]

{ #category : 'accessing' }
SDL3GPUVertexElement >> offset: aByteOffset [

	offset := aByteOffset
]

{ #category : 'printing' }
SDL3GPUVertexElement >> printOn: aStream [

	super printOn: aStream.
	aStream
		nextPut: $(;
		nextPutAll: 'location: ';
		print: location;
		nextPutAll: ' offset: ';
		print: offset;
		nextPutAll: ' format: ';
		print: format;
		nextPut: $)
]

{ #category : 'converting' }
SDL3GPUVertexElement >> writeToVertexAttribute: aVertexAttribute slot: aSlot [

	aVertexAttribute
		bufferSlot: aSlot;
		location: location;
		format: format;
		offset: offset
]
