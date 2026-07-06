Class {
	#name : 'BaselineOfSDL3',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfSDL3',
	#package : 'BaselineOfSDL3'
}

{ #category : 'baselines' }
BaselineOfSDL3 >> baseline: spec [
	<baseline>

	spec
		for: #common
		do: [ 
			spec
				postLoadDoIt: #postLoad;
				package: 'SDL3';
				package: 'SDL3-ShaderScanner';
				package: 'SDL3-ShaderScanner-Tests' with: [ spec requires: #('SDL3-ShaderScanner') ];
				package: 'SDL3-Own' with: [ spec requires: #('SDL3' 'SDL3-ShaderScanner'  ) ];
				package: 'SDL3-API' with: [ spec requires: #('SDL3') ];

				package: 'SDL3-OSWindow' with: [ spec requires: #('SDL3' 'SDL3-Own' 'SDL3-API') ];

				package: 'SDL3-Tests' with: [ spec requires: #('SDL3' 'SDL3-Own' 'SDL3-API') ];
				package: 'SDL3-Graphics-Tests' with: [ spec requires: #('SDL3-Tests') ];
				package: 'SDL3-Compute-Tests' with: [ spec requires: #('SDL3-Tests') ];

				package: 'SDL3-Demos' with: [ spec requires: #('SDL3' 'SDL3-Own' 'SDL3-API') ];
				package: 'SDL3-GPUDemos' with: [ spec requires: #('SDL3-Demos') ]
			]
]

{ #category : 'script' }
BaselineOfSDL3 >> postLoad [

	"Enumerations that implement #enumDecl need to be initialized"
	(self class environment at: #SDL3Enumeration)
		allSubclassesDo: [ :each |
			(each classSide includesSelector: #enumDecl)
				ifTrue: [ each initializeEnumeration ] ]
]
