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
ExternalAddress >> bytesFromNext: size [

	^ ByteArray new: size streamContents: [ :aStream |
			1 to: size do: [ :index |
				| aByte |
				aByte := self unsignedByteAt: index.
				aStream nextPut: aByte ] ]
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

{ #category : '*SDL3-Own' }
ExternalAddress >> readArrayOf: aType size: count [
	"Returns an array of aType of the specified size"

	| externalType address results isStruct |
	externalType := FFIExternalType resolveType: aType.
	isStruct := aType isClass and: [ aType inheritsFrom: FFIExternalStructure ].

	"then build the array"
	results := Array new: count.
	address := self.
	1 to: count do: [ :index |
		| value |
		value := isStruct
			         ifTrue: [ aType fromHandle: (address bytesFromNext: externalType typeSize) ]
			         ifFalse: [ externalType handle: address at: 1 ].
		results at: index put: value.
		address := address + externalType typeSize ].
	^ results
]

{ #category : '*SDL3-Own' }
ExternalAddress >> readStructArrayFromPointers: aFFIStructure size: count [
	"Return an array of structs of the specified size"

	^ Array streamContents: [ :stream |
		| address |
		address := self.
		1 to: count do: [ :index |
			| pointer |
			pointer := address pointerAt: 1.
			stream nextPut: (aFFIStructure fromHandle: (pointer bytesFromNext: aFFIStructure structureSize)).
			address := address + FFIExternalType pointerSize ] ]
]

{ #category : '*SDL3-Own' }
ExternalAddress class >> safeNewArray: anInteger [

	^ (FFIExternalArray externalNewType: self size: anInteger)
		autoRelease;
		yourself
]
