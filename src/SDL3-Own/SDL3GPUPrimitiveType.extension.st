Extension { #name : 'SDL3GPUPrimitiveType' }

{ #category : '*SDL3-Own' }
SDL3GPUPrimitiveType class >> enumDeclToCamelCaseDictionary [

	^ super enumDeclToCamelCaseDictionary
		at: #SDL_GPU_PRIMITIVETYPE_LINELIST put: #lineList;
		at: #SDL_GPU_PRIMITIVETYPE_LINESTRIP put: #lineStrip;
		at: #SDL_GPU_PRIMITIVETYPE_POINTLIST put: #pointList;
		at: #SDL_GPU_PRIMITIVETYPE_TRIANGLELIST put: #triangleList;
		at: #SDL_GPU_PRIMITIVETYPE_TRIANGLESTRIP put: #triangleStrip;
		yourself
]
