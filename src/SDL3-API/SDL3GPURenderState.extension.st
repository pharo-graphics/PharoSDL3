Extension { #name : 'SDL3GPURenderState' }

{ #category : '*SDL3-API' }
SDL3GPURenderState >> destroy [

	self ffiLibrary destroyGPURenderState: self
]

{ #category : '*SDL3-API' }
SDL3GPURenderState >> fragmentUniformsSlotIndex: slotIndex data: data length: length [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			setGPURenderStateFragmentUniformsState: self
			slotIndex: slotIndex
			data: data
			length: length)
]
