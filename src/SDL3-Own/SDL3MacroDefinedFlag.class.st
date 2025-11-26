"
My subclasses represent SDL3 C typedefs whose values are defined by `#define` C macros.
"
Class {
	#name : 'SDL3MacroDefinedFlag',
	#superclass : 'SDL3Enumeration',
	#category : 'SDL3-Own',
	#package : 'SDL3-Own'
}

{ #category : 'converting' }
SDL3MacroDefinedFlag class >> allValuesIn: anInteger [

	^ Array streamContents: [ :stream |
		self allValuesDo: [ :each |
			(anInteger bitAnd: each asInteger) = 0
				ifFalse: [ stream nextPut: each ] ] ]
]

{ #category : 'flag operations' }
SDL3MacroDefinedFlag >> & another [

	^ self asInteger & another asInteger
]

{ #category : 'comparing' }
SDL3MacroDefinedFlag >> <= another [

	^ self item <= another item
]

{ #category : 'converting' }
SDL3MacroDefinedFlag >> asInteger [

	^ value
]

{ #category : 'flag operations' }
SDL3MacroDefinedFlag >> bitOr: anInteger [

	^ self asInteger bitOr: anInteger
]

{ #category : 'flag operations' }
SDL3MacroDefinedFlag >> | another [

	^ self asInteger | another asInteger
]
