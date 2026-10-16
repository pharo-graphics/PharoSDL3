Extension { #name : 'SDL3GPUStorageBufferReadWriteBinding' }

{ #category : '*SDL3-Additions' }
SDL3GPUStorageBufferReadWriteBinding >> beBuffer: aBuffer [

	self
		buffer: aBuffer;
		cycle: false
]
