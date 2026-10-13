Class {
	#name : 'SDL3BaseObject',
	#superclass : 'FFIOpaqueObject',
	#traits : 'TSDL3Library',
	#classTraits : 'TSDL3Library classTrait',
	#pools : [
		'SDL3Aliases',
		'SDL3Constants'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'finalization' }
SDL3BaseObject >> destroy [
	"Hook for subclasses to destroy their native handle.
	Subclasses with specific C destructor functions override this."
]

{ #category : 'initialization' }
SDL3BaseObject >> initialize [
	"do nothing (prevent initialize to set the handle)"
]
