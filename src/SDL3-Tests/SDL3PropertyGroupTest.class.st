"
I provide unit tests for SDL3PropertyGroup.
"
Class {
	#name : 'SDL3PropertyGroupTest',
	#superclass : 'SDL3Test',
	#category : 'SDL3-Tests-Library',
	#package : 'SDL3-Tests',
	#tag : 'Library'
}

{ #category : 'tests' }
SDL3PropertyGroupTest >> test01EmptyGroup [

	| properties |
	DiScope own: (properties := SDL3PropertyGroup unownedNew).
	self assertEmpty: properties keys.
	self assert: properties size equals: 0.
	self assert: properties isEmpty.
	self assertEmpty: properties asDictionary
]

{ #category : 'tests' }
SDL3PropertyGroupTest >> test02Keys [

	| properties |
	DiScope own: (properties := SDL3PropertyGroup unownedNew).
	properties stringAt: 'app.name' put: 'PharoSDL3'.
	properties numberAt: 'app.version' put: 3.
	self assert: properties keys sorted equals: #( 'app.name' 'app.version' ).
	self assert: properties size equals: 2.
	self deny: properties isEmpty
]

{ #category : 'tests' }
SDL3PropertyGroupTest >> test03At [

	| properties address |
	address := ExternalAddress fromAddress: 16r1234.
	DiScope own: (properties := SDL3PropertyGroup unownedNew).
	properties stringAt: 'key.string' put: 'hello'.
	properties numberAt: 'key.number' put: 42.
	properties booleanAt: 'key.boolean' put: true.
	properties floatAt: 'key.float' put: 3.5.
	properties pointerAt: 'key.pointer' put: address.

	self assert: (properties at: 'key.string') equals: 'hello'.
	self assert: (properties at: 'key.number') equals: 42.
	self assert: (properties at: 'key.boolean') equals: true.
	self assert: (properties at: 'key.float') equals: 3.5.
	self assert: (properties at: 'key.pointer') equals: address.

	self should: [ properties at: 'key.missing' ] raise: KeyNotFound
]

{ #category : 'tests' }
SDL3PropertyGroupTest >> test04AtIfAbsent [

	| properties |
	DiScope own: (properties := SDL3PropertyGroup unownedNew).
	properties stringAt: 'existing' put: 'value'.
	self assert: (properties at: 'existing' ifAbsent: [ 'fallback' ]) equals: 'value'.
	self assert: (properties at: 'missing' ifAbsent: [ 'fallback' ]) equals: 'fallback'
]

{ #category : 'tests' }
SDL3PropertyGroupTest >> test05AsDictionary [

	| properties dictionary |
	DiScope own: (properties := SDL3PropertyGroup unownedNew).
	properties stringAt: 'name' put: 'Pharo'.
	properties numberAt: 'version' put: 12.
	properties booleanAt: 'enabled' put: true.

	dictionary := properties asDictionary.
	self assert: (dictionary at: 'name') equals: 'Pharo'.
	self assert: (dictionary at: 'version') equals: 12.
	self assert: (dictionary at: 'enabled') equals: true.
	self assert: dictionary size equals: 3
]

{ #category : 'tests' }
SDL3PropertyGroupTest >> test06KeysAndValuesDo [

	| properties collected |
	DiScope own: (properties := SDL3PropertyGroup unownedNew).
	properties stringAt: 'alpha' put: 'one'.
	properties numberAt: 'beta' put: 2.

	collected := Dictionary new.
	properties keysAndValuesDo: [ :key :value | collected at: key put: value ].
	self assert: collected equals: properties asDictionary
]

{ #category : 'tests' }
SDL3PropertyGroupTest >> test07KeysDo [

	| properties collected |
	DiScope own: (properties := SDL3PropertyGroup unownedNew).
	properties stringAt: 'alpha' put: 'one'.
	properties numberAt: 'beta' put: 2.

	collected := OrderedCollection new.
	properties keysDo: [ :key | collected add: key ].
	self assert: collected sorted asArray equals: #( 'alpha' 'beta' )
]
