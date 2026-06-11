Extension { #name : 'Rectangle' }

{ #category : '*SDL3-OSWindow' }
Rectangle >> intersect: aRectangle ifPresent: aBlock [

	| intersection |
	intersection := self intersect: aRectangle ifNone: [ ^ self ].
	^ aBlock value: intersection
]
