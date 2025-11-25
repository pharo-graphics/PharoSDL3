Extension { #name : 'SDL3DropEvent' }

{ #category : '*SDL3-Own' }
SDL3DropEvent class >> eventTypeSelectors [

	^ #(#dropFile #dropText #dropPosition #dropBegin #dropComplete)
]
