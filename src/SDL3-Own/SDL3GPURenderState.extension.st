Extension { #name : 'SDL3GPURenderState' }

{ #category : '*SDL3-Own' }
SDL3GPURenderState >> pushFragmentUniform: data slot: slot [

	^ self
		  fragmentUniformsSlotIndex: slot
		  data: data
		  length: data class structureSize
]
