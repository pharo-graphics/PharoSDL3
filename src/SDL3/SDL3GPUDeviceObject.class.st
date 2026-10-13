"
I represent an object that belongs to a \`SDL3GPUDevice\`.

In SDL 3.4.0, several objects are created and released with a GPU device, showing an ownership relation.
"
Class {
	#name : 'SDL3GPUDeviceObject',
	#superclass : 'SDL3BaseObject',
	#instVars : [
		'device'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'accessing' }
SDL3GPUDeviceObject >> device [

	^ device
]

{ #category : 'initialization' }
SDL3GPUDeviceObject >> device: aSDL3GPUDevice [

	device := aSDL3GPUDevice
]

{ #category : 'releasing' }
SDL3GPUDeviceObject >> releaseFromGPUDevice [
	"Should be overridden by subclasses to send the specific release message to the owning device."

	self subclassResponsibility
]
