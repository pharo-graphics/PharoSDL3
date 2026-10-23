Extension { #name : 'ExternalAddress' }

{ #category : '*SDL3' }
ExternalAddress >> bytesFromNext: size [

	^ ByteArray new: size streamContents: [ :aStream |
			1 to: size do: [ :index |
				| aByte |
				aByte := self unsignedByteAt: index.
				aStream nextPut: aByte ] ]
]

{ #category : '*SDL3' }
ExternalAddress >> nullTerminatedArrayOfCStrings [
	"Try: readArrayOf: aType until: aBlock"

	self isNull ifTrue: [ ^ #(  ) ].

	^ Array streamContents: [ :aStream |
		| zeroBasedByteIndex currentAddress |
		zeroBasedByteIndex := 0.
		[ 	currentAddress := self pointerAtOffset: zeroBasedByteIndex.
			currentAddress isNull ] whileFalse: [

			aStream nextPut: currentAddress bytesFromCString utf8Decoded.
			zeroBasedByteIndex := zeroBasedByteIndex + FFIExternalType pointerSize ]]
]

{ #category : '*SDL3' }
ExternalAddress >> readArrayOf: aType size: count [
	"Returns an array of primitive FFI types of the specified size"

	| externalType address results |
	externalType := FFIExternalType resolveType: aType.

	results := Array new: count.
	address := self.
	1 to: count do: [ :index |
		| value |
		value := externalType handle: address at: 1.
		results at: index put: value.
		address := address + externalType typeSize ].
	^ results
]

{ #category : '*SDL3' }
ExternalAddress >> readCStringArrayOfSize: anInteger [

	self isNull ifTrue: [ ^ #(  ) ].

	^ (1 to: anInteger) collect: [ :index |
		| zeroBasedByteIndex pointerToCString |
		zeroBasedByteIndex := ((index - 1) * FFIExternalType pointerSize).
		pointerToCString := self pointerAtOffset: zeroBasedByteIndex.
		pointerToCString bytesFromCString asString ]
]

{ #category : '*SDL3' }
ExternalAddress >> readPointerArrayOf: aFFIExternalObjectClass size: count [
	"Return an array of FFIExternalObject (or subclass) instances of the specified size by wrapping each pointer in the array"

	^ Array streamContents: [ :stream |
		| address |
		address := self.
		1 to: count do: [ :index |
			| pointer |
			pointer := address pointerAt: 1.
			stream nextPut: (aFFIExternalObjectClass fromHandle: pointer).
			address := address + FFIExternalType pointerSize ] ]
]

{ #category : '*SDL3' }
ExternalAddress >> readStructArrayByValue: aFFIStructure size: count [
	"Return a contiguous array of structs (packed by value) of the specified size"

	| results address structSize |
	structSize := aFFIStructure structureSize.
	results := Array new: count.
	address := self.
	1 to: count do: [ :index |
		| value |
		value := aFFIStructure fromHandle: (address bytesFromNext: structSize).
		results at: index put: value.
		address := address + structSize ].
	^ results
]

{ #category : '*SDL3' }
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
