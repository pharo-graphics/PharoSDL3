Extension { #name : 'S3SDL_GPUTextureType' }

{ #category : '*SDL3-Own' }
S3SDL_GPUTextureType class >> enumDeclToCamelCaseDictionary [

	^ super enumDeclToCamelCaseDictionary
		at: #SDL_GPU_TEXTURETYPE_CUBE put: #atCube;
		at: #SDL_GPU_TEXTURETYPE_CUBE_ARRAY put: #atCubeArray;
		yourself
]
