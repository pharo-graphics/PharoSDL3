Extension { #name : 'SDL3GPUStorageBufferReadWriteBinding' }

{ #category : '*SDL3-Own' }
SDL3GPUStorageBufferReadWriteBinding >> beBuffer: aBuffer [

	self
		buffer: aBuffer;
		cycle: false
]

{ #category : '*SDL3-Own' }
SDL3GPUStorageBufferReadWriteBinding class >> buffer: aBuffer [

	^ self safeNew
		beBuffer: aBuffer;
		yourself
]
