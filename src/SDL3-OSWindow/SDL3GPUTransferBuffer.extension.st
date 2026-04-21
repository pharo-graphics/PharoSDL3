Extension { #name : 'SDL3GPUTransferBuffer' }

{ #category : '*SDL3-OSWindow' }
SDL3GPUTransferBuffer >> updateFromForm: aForm device: aGPUDevice [
	"Upload the contents of the given form into this transfer buffer using BitBlt."

	| mappedAddress externalForm |
	mappedAddress := aGPUDevice mapGPUTransferBuffer: self cycle: false.
	mappedAddress isNull ifTrue: [ self error: 'Failed to map GPU transfer buffer' ].

	[ 
		externalForm := OSSDL3ExternalForm
			extent: aForm extent
			depth: 32
			bits: mappedAddress.
		[ 
			externalForm copy: aForm boundingBox from: aForm to: 0@0 rule: Form over
		] ensure: [ 
			externalForm destroySurface 
		]
	] ensure: [ 
		aGPUDevice unmapGPUTransferBuffer: self
	]
]
