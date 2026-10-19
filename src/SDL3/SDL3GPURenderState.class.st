"
I am a SDL3 FFI binding for `SDL_GPURenderState`.

A custom GPU render state.

See: https://wiki.libsdl.org/SDL3/SDL_GPURenderState
"
Class {
	#name : 'SDL3GPURenderState',
	#superclass : 'SDL3GPUDeviceObject',
	#category : 'SDL3-GPU-Base',
	#package : 'SDL3',
	#tag : 'GPU-Base'
}

{ #category : 'finalization' }
SDL3GPURenderState >> destroy [

	self ffiLibrary destroyGPURenderState: self
]

{ #category : 'operations' }
SDL3GPURenderState >> fragmentUniformsSlotIndex: slotIndex data: data length: length [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			setGPURenderStateFragmentUniformsState: self
			slotIndex: slotIndex
			data: data
			length: length)
]

{ #category : 'operations' }
SDL3GPURenderState >> pushFragmentUniform: data slot: slot [

	^ self
		  fragmentUniformsSlotIndex: slot
		  data: data
		  length: data class structureSize
]

{ #category : 'releasing' }
SDL3GPURenderState >> releaseFromGPUDevice [
	"Render states are technically destroyed via the renderer's library handle, but we can treat them as device-owned for consistent API."

	self destroy
]
