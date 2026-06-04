"
I demonstrate how to manage multiple SDL3 windows within a single application loop.
I perform a scripted sequence of window operations.
"
Class {
	#name : 'SDL3MultipleWindowsDemo',
	#superclass : 'SDL3App',
	#instVars : [
		'windows',
		'renderers',
		'tasksStream',
		'colors',
		'lastMS'
	],
	#category : 'SDL3-Demos-API',
	#package : 'SDL3-Demos',
	#tag : 'API'
}

{ #category : 'lifecycle' }
SDL3MultipleWindowsDemo >> close [

	renderers ifNotNil: [ 
		renderers do: [ :each | each destroy ].
		renderers := nil ].
	
	windows ifNotNil: [ 
		windows do: [ :each | each destroy ].
		windows := nil ].
		
	super close
]

{ #category : 'initialization' }
SDL3MultipleWindowsDemo >> initialize [

	super initialize.

	windows := OrderedCollection new.
	renderers := OrderedCollection new
]

{ #category : 'accessing' }
SDL3MultipleWindowsDemo >> millisecondsToWait [

	^ 500
]

{ #category : 'lifecycle' }
SDL3MultipleWindowsDemo >> prepareToLoop [

	super prepareToLoop.
	
	1 to: 4 do: [ :i |
		| aWindow |
		aWindow := SDL3Window
			unsafeNewTitle: ('Window {1}' format: {i}) 
			w: 100 h: 75
			flags: SDL_WINDOW_RESIZABLE.

		aWindow position: (100 + (i * 220)) @ 100.

		windows add: aWindow.
		renderers add: aWindow newRenderer ].

	colors := Color wheel: windows size.

	tasksStream := self tasksCollection readStream.

	lastMS := Time millisecondClockValue
]

{ #category : 'hooks' }
SDL3MultipleWindowsDemo >> step [

	| currentMS |
	currentMS := Time millisecondClockValue.
	(currentMS - lastMS) < self millisecondsToWait ifTrue: [ ^ self ].
	lastMS := currentMS.
	
	tasksStream atEnd ifTrue: [ ^ loop requestQuit ].
	tasksStream next value.

	renderers with: colors do: [ :each :color |
		each renderDrawColor: color.
		each renderClear.
		each renderPresent ].
]

{ #category : 'initialization' }
SDL3MultipleWindowsDemo >> tasksCollection [

	| extent |
	extent := 200 @ 300.
	^ {
		"title"
		[ windows withIndexDo: [ :each :index | each title: index asString ] ].

		"resize"
		[ windows do: [ :each | each resizable: true; extent: extent; sync ] ].

		"position"
		[ windows withIndexDo: [ :each :index |
			each position: (extent x * index) @ extent y ] ].

		"flash"
		[ windows do: [ :each | each flashWithOperation: SDL_FLASH_UNTIL_FOCUSED ] ].

		"raise"
		[ windows do: [ :each | each raise ] ].

		"hide & show"
		[ windows do: [ :each | each hide ] ].
		[ windows do: [ :each | each show ] ].

		"maximize & restore"
		[ windows do: [ :each | each maximize; sync ] ].
		[ windows do: [ :each | each restore; sync ] ].

		"fullscreen true/false"
		[ windows do: [ :each | each fullscreen: true; sync ] ].
		[ windows do: [ :each | each fullscreen: false; sync ] ].

		"minimize & restore"
		[ windows do: [ :each | each minimize; sync ] ].
		[ windows do: [ :each | each restore; sync ] ]
	}
]
