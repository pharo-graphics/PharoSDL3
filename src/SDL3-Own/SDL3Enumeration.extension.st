Extension { #name : 'SDL3Enumeration' }

{ #category : '*SDL3-Own' }
SDL3Enumeration class >> allValues [

	^ Array streamContents: [ :stream |
		self allValuesDo: [ :each | stream nextPut: each ] ]
]

{ #category : '*SDL3-Own' }
SDL3Enumeration class >> allValuesDo: aBlock [

	self withAllSuperclassesDo: [ :eachClass |
		eachClass = SDL3Enumeration
			ifFalse: [
				eachClass classPool valuesDo: [ :eachValue |
					aBlock value: eachValue ] ]
			ifTrue: [ ^ self "done!" ] ]
]

{ #category : '*SDL3-Own' }
SDL3Enumeration >> asInteger [

	^ value asInteger
]
