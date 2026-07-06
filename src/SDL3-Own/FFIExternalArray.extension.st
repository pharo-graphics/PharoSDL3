Extension { #name : 'FFIExternalArray' }

{ #category : '*SDL3-Own' }
FFIExternalArray >> zeroMemory [

	handle ifNotNil: [
		LibSDL3 uniqueInstance memsetDst: handle c: 0 len: self size * self typeSize ]
]
