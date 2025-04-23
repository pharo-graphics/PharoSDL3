Extension { #name : 'SDL3FileDialogType' }

{ #category : '*SDL3-Own' }
SDL3FileDialogType class >> enumDeclToCamelCaseDictionary [

	^ super enumDeclToCamelCaseDictionary
		at: #SDL_FILEDIALOG_OPENFILE put: #openFile;
		at: #SDL_FILEDIALOG_SAVEFILE put: #saveFile;
		at: #SDL_FILEDIALOG_OPENFOLDER put: #openFolder;
		yourself
]
