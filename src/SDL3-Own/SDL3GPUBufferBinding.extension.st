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
SDL3GPUBufferBinding class >> buffer: aBuffer offset: anInteger [

	^ self safeNew
		beBuffer: aBuffer offset: anInteger;
		yourself
]

{ #category : '*SDL3-Own' }
SDL3GPUBufferBinding class >> offset: anInteger [

	^ self buffer: ExternalAddress null offset: anInteger
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
