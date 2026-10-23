"
I provide unit tests for SDL3NullTerminatedStringArray.
"
Class {
	#name : 'SDL3NullTerminatedStringArrayTest',
	#superclass : 'SDL3Test',
	#instVars : [
		'array'
	],
	#category : 'SDL3-Tests-Base',
	#package : 'SDL3-Tests',
	#tag : 'Base'
}

{ #category : 'running' }
SDL3NullTerminatedStringArrayTest >> tearDown [

	array ifNotNil: [ array dispose ].

	super tearDown.
]

{ #category : 'tests' }
SDL3NullTerminatedStringArrayTest >> test01CreateAndFree [

	array := SDL3NullTerminatedStringArray unownedFromStrings: #( 'alpha' 'beta' 'gamma' ).
	self assert: array size equals: 4.
	self assert: array first bytesFromCString utf8Decoded equals: 'alpha'.
	self assert: array second bytesFromCString utf8Decoded equals: 'beta'.
	self assert: array third bytesFromCString utf8Decoded equals: 'gamma'.
	self assert: array fourth isNull.

	array dispose.
	self assert: array getHandle isNil
]

{ #category : 'tests' }
SDL3NullTerminatedStringArrayTest >> test02ReadStringsFromExternalAddress [

	| strings |
	array := SDL3NullTerminatedStringArray unownedFromStrings: #( 'first' 'second' ).
	strings := array getHandle nullTerminatedArrayOfCStrings.
	self assert: strings equals: #( 'first' 'second' )
]

{ #category : 'tests' }
SDL3NullTerminatedStringArrayTest >> test03ReadStringsFromNull [

	self assertEmpty: ExternalAddress null nullTerminatedArrayOfCStrings
]

{ #category : 'tests' }
SDL3NullTerminatedStringArrayTest >> test04EmptyStringsArray [

	array := SDL3NullTerminatedStringArray unownedFromStrings: #(  ).
	self assert: array size equals: 1.
	self assert: array first isNull
]

{ #category : 'tests' }
SDL3NullTerminatedStringArrayTest >> test05ReadStringsFromExternalAddressWithSize [

	| strings |
	array := SDL3NullTerminatedStringArray unownedFromStrings: #( 'apple' 'banana' 'cherry' ).
	strings := array getHandle readCStringArrayOfSize: 2.
	self assert: strings equals: #( 'apple' 'banana' )
]

{ #category : 'tests' }
SDL3NullTerminatedStringArrayTest >> test06ReadStringsFromNullWithZeroSize [

	self assert: (ExternalAddress null readCStringArrayOfSize: 0) equals: #(  )
]
