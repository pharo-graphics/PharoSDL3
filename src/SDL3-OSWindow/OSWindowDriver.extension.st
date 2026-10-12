Extension { #name : 'OSWindowDriver' }

{ #category : '*SDL3-OSWindow' }
OSWindowDriver class >> pickDriverClass [

	self allSubclassesDo: [ :aClass |
		(aClass isAbstract not and: [ aClass isSuitable ]) ifTrue: [ ^ aClass ] ].
	^ OSNullWindowDriver
]
