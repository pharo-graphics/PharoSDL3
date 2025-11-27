Extension { #name : 'SDL3GPUDevice' }

{ #category : '*SDL3-Own' }
SDL3GPUDevice >> gpuShaderFormatsAsArray [

	| formatsBitFlags |
	formatsBitFlags := self gpuShaderFormats.

	formatsBitFlags = 0 ifTrue: [ ^ #() ].

	^ SDL3GPUShaderFormat allValuesIn: formatsBitFlags
]
