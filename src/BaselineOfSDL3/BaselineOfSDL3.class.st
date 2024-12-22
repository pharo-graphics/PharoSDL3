Class {
	#name : 'BaselineOfSDL3',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfSDL3',
	#package : 'BaselineOfSDL3'
}

{ #category : 'baseline' }
BaselineOfSDL3 >> baseline: spec [

	<baseline>
	spec for: #common do: [ spec package: 'SDL3' ]
]
