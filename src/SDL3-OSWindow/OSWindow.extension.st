Extension { #name : 'OSWindow' }

{ #category : '*SDL3-OSWindow' }
OSWindow >> newGPUFormRenderer: form [
	^ self backendWindow newGPUFormRenderer: form
]
