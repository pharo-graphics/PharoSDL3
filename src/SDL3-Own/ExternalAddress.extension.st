Extension { #name : 'ExternalAddress' }

{ #category : '*SDL3-Own' }
ExternalAddress >> arrayOfStringsOfSize: anInteger [ 

	^ (1 to: anInteger) collect: [ :index |
		| zeroBasedByteIndex pointerToCString |
		zeroBasedByteIndex := ((index - 1) * FFIExternalType pointerSize).
		pointerToCString := self pointerAtOffset: zeroBasedByteIndex.
		pointerToCString bytesFromCString utf8Decoded ]
]
