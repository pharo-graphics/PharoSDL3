Extension { #name : 'SDL3GPUDeviceObject' }

{ #category : '*SDL3-Additions' }
SDL3GPUDeviceObject >> dispose [
	"Releases the receiver from its owning device. If the device is nil or the handle is already null, does nothing."

	(device isNil or: [ self isNull ]) ifTrue: [ ^ self ].
	self releaseFromGPUDevice.
	device := nil.
	handle beNull
]
