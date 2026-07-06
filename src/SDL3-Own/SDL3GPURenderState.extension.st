Extension { #name : 'SDL3GPURenderState' }

{ #category : '*SDL3-Own' }
SDL3GPURenderState >> destroy [

	self ffiLibrary destroyGPURenderState: self
]

{ #category : '*SDL3-Own' }
SDL3GPURenderState >> fragmentUniformsSlotIndex: slotIndex data: data length: length [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			setGPURenderStateFragmentUniformsState: self
			slotIndex: slotIndex
			data: data
			length: length)
]

{ #category : '*SDL3-Own' }
SDL3GPURenderState >> pushFragmentUniform: data slot: slot [

	^ self
		  fragmentUniformsSlotIndex: slot
		  data: data
		  length: data class structureSize
]

{ #category : '*SDL3-Own' }
SDL3GPURenderState >> releaseFromGPUDevice [
	"Render states are technically destroyed via the renderer's library handle, but we can treat them as device-owned for consistent API."

	self destroy
]
