Extension { #name : 'S3SDL_FileDialogType' }

{ #category : '*SDL3-Own' }
S3SDL_FileDialogType class >> enumDeclToCamelCaseDictionary [

	^ super enumDeclToCamelCaseDictionary
		at: #SDL_FILEDIALOG_OPENFILE put: #openFile;
		at: #SDL_FILEDIALOG_SAVEFILE put: #saveFile;
		at: #SDL_FILEDIALOG_OPENFOLDER put: #openFolder;
		yourself
]
