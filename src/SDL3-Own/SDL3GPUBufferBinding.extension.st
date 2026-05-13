Extension { #name : 'SDL3GPUBufferBinding' }

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
