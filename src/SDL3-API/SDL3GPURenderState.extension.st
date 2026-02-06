Extension { #name : 'SDL3GPURenderState' }

{ #category : '*SDL3-API' }
SDL3GPURenderState >> destroy [

	^ self ffiLibrary destroyGPURenderState: self
]

{ #category : '*SDL3-API' }
SDL3GPURenderState >> fragmentUniformsSlotIndex: slot_index data: data length: length [

	^ self ffiLibrary
		  setGPURenderStateFragmentUniformsState: self
		  slotIndex: slot_index
		  data: data
		  length: length
]
