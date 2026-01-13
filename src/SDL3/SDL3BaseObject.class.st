Class {
	#name : 'SDL3BaseObject',
	#superclass : 'FFIOpaqueObject',
	#traits : 'LibTSDL3',
	#classTraits : 'LibTSDL3 classTrait',
	#pools : [
		'SDL3Typedef'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'finalization' }
SDL3BaseObject >> autoRelease [
	
	FinalizationRegistry default add: self
]

{ #category : 'finalization' }
SDL3BaseObject >> dispose [
	"Hook sent on finalization"
]

{ #category : 'finalization' }
SDL3BaseObject >> finalize [
	
	self dispose.
	handle beNull
]

{ #category : 'initialization' }
SDL3BaseObject >> initialize [
	"do nothing (prevent initialize to set the handle)"
]
