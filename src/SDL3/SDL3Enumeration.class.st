"
I am the superclass of all the enums in SDL3 FFI bindings.
"
Class {
	#name : 'SDL3Enumeration',
	#superclass : 'FFIEnumeration',
	#traits : 'TSDL3Library',
	#classTraits : 'TSDL3Library classTrait',
	#pools : [
		'SDL3Aliases',
		'SDL3Constants'
	],
	#category : 'SDL3-Enumerations',
	#package : 'SDL3',
	#tag : 'Enumerations'
}

{ #category : 'enumerating' }
SDL3Enumeration class >> allValues [

	^ Array streamContents: [ :stream |
		self allValuesDo: [ :each | stream nextPut: each ] ]
]

{ #category : 'enumerating' }
SDL3Enumeration class >> allValuesDo: aBlock [

	self withAllSuperclassesDo: [ :eachClass |
		eachClass = SDL3Enumeration
			ifFalse: [
				eachClass classPool valuesDo: [ :eachValue |
					aBlock value: eachValue ] ]
			ifTrue: [ ^ self "done!" ] ]
]

{ #category : 'converting' }
SDL3Enumeration >> asInteger [

	^ value asInteger
]
