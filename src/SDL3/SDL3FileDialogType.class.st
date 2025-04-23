Class {
	#name : 'SDL3FileDialogType',
	#superclass : 'S3Enumeration',
	#classVars : [
		'SDL_FILEDIALOG_OPENFILE',
		'SDL_FILEDIALOG_OPENFOLDER',
		'SDL_FILEDIALOG_SAVEFILE'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'enum declaration' }
SDL3FileDialogType class >> enumDecl [

	^ #(
	SDL_FILEDIALOG_OPENFILE 0
	SDL_FILEDIALOG_SAVEFILE 1
	SDL_FILEDIALOG_OPENFOLDER 2 )
]

{ #category : 'accessing enum' }
SDL3FileDialogType class >> openFile [
	"This method was automatically generated"
	^ SDL_FILEDIALOG_OPENFILE
]

{ #category : 'accessing enum' }
SDL3FileDialogType class >> openFolder [
	"This method was automatically generated"
	^ SDL_FILEDIALOG_OPENFOLDER
]

{ #category : 'accessing enum' }
SDL3FileDialogType class >> saveFile [
	"This method was automatically generated"
	^ SDL_FILEDIALOG_SAVEFILE
]
