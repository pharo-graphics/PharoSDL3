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

	^ value bitAnd: another asInteger
]

{ #category : 'comparing' }
SDL3MacroDefinedFlag >> <= another [

	^ self item <= another item
]

{ #category : 'flag operations' }
SDL3MacroDefinedFlag >> anyMask: another [ 

	^ value anyMask: another asInteger
]

{ #category : 'flag operations' }
SDL3MacroDefinedFlag >> bitAnd: another [

	^ value bitAnd: another asInteger
]

{ #category : 'flag operations' }
SDL3MacroDefinedFlag >> bitOr: another [

	^ value bitOr: another asInteger
]

{ #category : 'flag operations' }
SDL3MacroDefinedFlag >> | another [

	^ value bitOr: another asInteger
]
