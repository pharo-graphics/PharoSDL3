Class {
	#name : 'S3BaseObject',
	#superclass : 'FFIOpaqueObject',
	#traits : 'LibTSDL3',
	#classTraits : 'LibTSDL3 classTrait',
	#pools : [
		'S3SDL3Typedef'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'finalization' }
S3BaseObject >> autoRelease [
	
	FinalizationRegistry default add: self
]

{ #category : 'finalization' }
S3BaseObject >> dispose [
	
	self subclassResponsibility
]

{ #category : 'finalization' }
S3BaseObject >> finalize [
	
	self dispose.
	handle beNull
]

{ #category : 'initialization' }
S3BaseObject >> initialize [
	"do nothing (prevent initialize to set the handle)"
]
