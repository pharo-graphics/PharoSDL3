Extension { #name : 'FFIExternalArray' }

{ #category : '*SDL3-Own' }
FFIExternalArray class >> externalNewType: type size: count [

	| address instance resolvedType |
	resolvedType := FFIExternalType resolveType: type.
	address := ExternalAddress gcallocate: (resolvedType typeSize * count).
	instance := self fromHandle: address type: type size: count.
	instance zeroMemory.
	^ instance
]

{ #category : '*SDL3-Own' }
FFIExternalArray >> zeroMemory [

	handle ifNotNil: [
		1 to: (self size * self typeSize) do: [ :index |
			handle unsignedByteAt: index put: 0 ] ]
]
