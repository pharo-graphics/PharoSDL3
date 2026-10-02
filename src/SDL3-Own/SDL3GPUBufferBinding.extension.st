Extension { #name : 'SDL3GPUBufferBinding' }

{ #category : '*SDL3-Own' }
SDL3GPUBufferBinding >> beBuffer: aBuffer offset: anInteger [

	self
		buffer: aBuffer;
		offset: anInteger
]

{ #category : '*SDL3-Own' }
SDL3GPUBufferBinding >> beOffset: anInteger [

	self beBuffer: ExternalAddress null offset: anInteger
]

{ #category : '*SDL3-Own' }
SDL3GPUBufferBinding >> printOn: aStream [

	super printOn: aStream.
	aStream
		nextPutAll: ' buffer: (';
		print: self buffer.
	aStream
		nextPutAll: ') offset: ';
		print: self offset
]
