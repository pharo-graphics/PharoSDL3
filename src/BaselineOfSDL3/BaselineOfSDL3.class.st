Class {
	#name : 'BaselineOfSDL3',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfSDL3',
	#package : 'BaselineOfSDL3'
}

{ #category : 'baseline' }
BaselineOfSDL3 >> baseline: spec [
	<baseline>

	spec
		for: #common
		do: [ 
			spec
				package: 'SDL3';
				package: 'SDL3-Own' with: [ spec requires: #('SDL3') ];
				package: 'SDL3-API' with: [ spec requires: #('SDL3') ];
				package: 'SDL3-Tests' with: [ spec requires: #('SDL3' 'SDL3-Own' 'SDL3-API') ] ]
]
