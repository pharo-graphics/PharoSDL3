Extension { #name : 'SDL3Array' }

{ #category : '*SDL3-Own' }
SDL3Array >> dispose [

	(handle isNil or: [ handle isNull ]) ifTrue: [ ^ self ].
	self free.
	handle := nil
]
