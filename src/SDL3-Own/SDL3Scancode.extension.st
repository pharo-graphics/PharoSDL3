Extension { #name : 'SDL3Scancode' }

{ #category : '*SDL3-Own' }
SDL3Scancode class >> enumDeclToCamelCaseAt: enumName prefix: prefix givenInvalidName: invalidName [

	^ 'number', enumName
]
