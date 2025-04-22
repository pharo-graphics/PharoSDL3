Extension { #name : 'S3SDL_Scancode' }

{ #category : '*SDL3-Own' }
S3SDL_Scancode class >> enumDeclToCamelCaseAt: enumName prefix: prefix givenInvalidName: invalidName [

	^ 'number', enumName
]
