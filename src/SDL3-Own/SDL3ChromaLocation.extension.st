Extension { #name : 'SDL3ChromaLocation' }

{ #category : '*SDL3-Own' }
SDL3ChromaLocation class >> enumDeclToCamelCaseDictionary [

	^ super enumDeclToCamelCaseDictionary
		at: #SDL_CHROMA_LOCATION_TOPLEFT put: #topLeft;
		yourself
]
