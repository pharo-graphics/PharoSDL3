Extension { #name : 'S3SDL_GPUCubeMapFace' }

{ #category : '*SDL3-Own' }
S3SDL_GPUCubeMapFace class >> enumDeclToCamelCaseDictionary [

	^ super enumDeclToCamelCaseDictionary
		add: #SDL_GPU_CUBEMAPFACE_POSITIVEX -> #positiveX;
		add: #SDL_GPU_CUBEMAPFACE_NEGATIVEX -> #negativeX;
		add: #SDL_GPU_CUBEMAPFACE_POSITIVEY -> #positiveY;
		add: #SDL_GPU_CUBEMAPFACE_NEGATIVEY -> #negativeY;
		add: #SDL_GPU_CUBEMAPFACE_POSITIVEZ -> #positiveZ;
		add: #SDL_GPU_CUBEMAPFACE_NEGATIVEZ -> #negativeZ;
		yourself
]
