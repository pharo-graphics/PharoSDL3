"
I provide a simple on-screen console for demos to log messages.
"
Class {
	#name : 'SDL3Console',
	#superclass : 'Object',
	#instVars : [
		'lines',
		'maxLines'
	],
	#category : 'SDL3-Demos-Base',
	#package : 'SDL3-Demos',
	#tag : 'Base'
}

{ #category : 'adding' }
SDL3Console >> addLine: aString [

	lines add: aString.
	[ lines size > maxLines ] whileTrue: [ lines removeFirst ]
]

{ #category : 'lifecycle' }
SDL3Console >> clear [

	lines := OrderedCollection new
]

{ #category : 'initialization' }
SDL3Console >> initialize [

	super initialize.
	lines := OrderedCollection new.
	maxLines := 200
]

{ #category : 'accessing' }
SDL3Console >> lineHeight [
	"Answer the line height, assuming the SDL3 debug text has size=8 by default"

	^ 10
]

{ #category : 'accessing' }
SDL3Console >> maxLines [

	^ maxLines
]

{ #category : 'accessing' }
SDL3Console >> maxLines: anInteger [

	maxLines := anInteger
]

{ #category : 'rendering' }
SDL3Console >> renderOn: aSDL3Renderer [

	| height maxVisible displayLines |
	height := aSDL3Renderer outputExtent y.
	maxVisible := (height // self lineHeight) - 1.

	displayLines :=
		lines size > maxVisible
			ifTrue: [ lines last: maxVisible ]
			ifFalse: [ lines ].

	aSDL3Renderer renderDrawColor: Color white.

	displayLines withIndexDo: [ :each :index | 
		aSDL3Renderer
			renderDebugTextX: 10
			y: (index - 1) * self lineHeight + 10
			str: each asString ]
]
