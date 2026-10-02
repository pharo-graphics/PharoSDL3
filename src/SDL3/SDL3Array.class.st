"
I am an array with SDL3 memory and library integration.

I subclass FFIExternalArray to provide SDL3-specific memory lifecycle operations, such as safe zeroing of unowned C-heap allocations via SDL_memset to prevent dirty memory hazards, byte size calculations, and generator helpers.
"
Class {
	#name : 'SDL3Array',
	#superclass : 'FFIExternalArray',
	#traits : 'TSDL3Library',
	#classTraits : 'TSDL3Library classTrait',
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'instance creation' }
SDL3Array class >> newType: aType size: anInteger collect: aBlock [
	"Answer a new array with elements initialized by aBlock."

	| array |
	array := self newType: aType size: anInteger.
	1 to: anInteger do: [ :i | array at: i put: (aBlock value: i) ].
	^ array
]

{ #category : 'instance creation' }
SDL3Array class >> unownedNewType: aType size: anInteger [
	"Answer a new external array with zeroed memory. The sender is responsible for freeing it."

	| array |
	array := self externalNewType: aType size: anInteger.
	array zeroOut.
	^ array
]

{ #category : 'instance creation' }
SDL3Array class >> unownedNewType: aType size: anInteger collect: aBlock [
	"Answer a new external array with elements initialized by aBlock. The sender is responsible for freeing it."

	| array |
	array := self unownedNewType: aType size: anInteger.
	1 to: anInteger do: [ :i | array at: i put: (aBlock value: i) ].
	^ array
]

{ #category : 'accessing' }
SDL3Array >> addressAt: anIndex [

	^ handle + ((anIndex - 1) * type typeSize)
]

{ #category : 'accessing' }
SDL3Array >> byteSize [

	^ size * type typeSize
]

{ #category : 'initialization' }
SDL3Array >> zeroOut [

	self ffiLibrary memsetDst: handle c: 0 len: self byteSize
]
