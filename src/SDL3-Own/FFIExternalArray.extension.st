Extension { #name : 'FFIExternalArray' }

{ #category : '*SDL3-Own' }
FFIExternalArray >> zeroMemory [

	handle ifNotNil: [
		SDL3Library uniqueInstance memsetDst: handle c: 0 len: self size * self typeSize ]
]
