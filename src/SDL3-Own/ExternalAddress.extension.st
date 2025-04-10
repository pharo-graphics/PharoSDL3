Extension { #name : 'ExternalAddress' }

{ #category : '*SDL3-Own' }
ExternalAddress >> arrayOfStringsOfSize: anInteger [ 

	^ (1 to: anInteger) collect: [ :index |
		| zeroBasedByteIndex pointerToCString |
		zeroBasedByteIndex := ((index - 1) * FFIExternalType pointerSize).
		pointerToCString := self pointerAtOffset: zeroBasedByteIndex.
		pointerToCString bytesFromCString utf8Decoded ]
]

{ #category : '*SDL3-Own' }
ExternalAddress >> nullTerminatedArrayOfCStrings [
	"Try: readArrayOf: aType until: aBlock"

	^ Array streamContents: [ :aStream |
		| zeroBasedByteIndex currentAddress |
		zeroBasedByteIndex := 0.
		[ 	currentAddress := self pointerAtOffset: zeroBasedByteIndex.
			currentAddress isNull ] whileFalse: [ 

			aStream nextPut: currentAddress bytesFromCString utf8Decoded.
			zeroBasedByteIndex := zeroBasedByteIndex + FFIExternalType pointerSize ]]
]
