Extension { #name : 'S3SDL_ChromaLocation' }

{ #category : '*SDL3-Own' }
S3SDL_ChromaLocation class >> enumDeclToCamelCaseDictionary [

	^ super enumDeclToCamelCaseDictionary  
		at: #SDL_CHROMA_LOCATION_TOPLEFT put: #topLeft;
		yourself
]
