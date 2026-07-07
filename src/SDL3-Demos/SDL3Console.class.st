"
I provide a simple on-screen console for demos to log messages.
I support multi-colored lines.
"
Class {
	#name : 'SDL3Console',
	#superclass : 'Object',
	#instVars : [
		'lines',
		'defaultColor'
	],
	#category : 'SDL3-Demos-Base',
	#package : 'SDL3-Demos',
	#tag : 'Base'
}

{ #category : 'adding' }
SDL3Console >> addLine [

	self addLine: ''
]

{ #category : 'adding' }
SDL3Console >> addLine: aString [

	self addLine: aString color: self defaultColor
]

{ #category : 'adding' }
SDL3Console >> addLine: aString color: aColor [

	lines add: aString asString -> aColor.
	[ lines size > self maxLines ] whileTrue: [ lines removeFirst ]
]

{ #category : 'lifecycle' }
SDL3Console >> clear [

	lines := OrderedCollection new
]

{ #category : 'accessing' }
SDL3Console >> defaultColor [

	^ defaultColor
]

{ #category : 'accessing' }
SDL3Console >> defaultColor: aColor [

	defaultColor := aColor
]

{ #category : 'initialization' }
SDL3Console >> initialize [

	super initialize.
	lines := OrderedCollection new.
	defaultColor := Color white
]

{ #category : 'accessing' }
SDL3Console >> lineHeight [
	"Answer the line height, assuming the SDL3 debug text has size=8 by default"

	^ 15
]

{ #category : 'accessing' }
SDL3Console >> maxLines [

	^ 200
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

	displayLines withIndexDo: [ :assoc :index | 
		aSDL3Renderer renderDrawColor: assoc value.
		aSDL3Renderer
			renderDebugTextX: self topLeftPosition x
			y: (index - 1) * self lineHeight + self topLeftPosition y
			str: assoc key ]
]

{ #category : 'accessing' }
SDL3Console >> topLeftPosition [

	^ 10 @ 10
]
