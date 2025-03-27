Class {
	#name : 'S3SDL_FileDialogType',
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

{ #category : 'accessing enum' }
S3SDL_FileDialogType class >> SDL_FILEDIALOG_OPENFILE [
	"This method was automatically generated"
	^ SDL_FILEDIALOG_OPENFILE
]

{ #category : 'accessing enum' }
S3SDL_FileDialogType class >> SDL_FILEDIALOG_OPENFOLDER [
	"This method was automatically generated"
	^ SDL_FILEDIALOG_OPENFOLDER
]

{ #category : 'accessing enum' }
S3SDL_FileDialogType class >> SDL_FILEDIALOG_SAVEFILE [
	"This method was automatically generated"
	^ SDL_FILEDIALOG_SAVEFILE
]

{ #category : 'enum declaration' }
S3SDL_FileDialogType class >> enumDecl [

	^ #(
	SDL_FILEDIALOG_OPENFILE 0
	SDL_FILEDIALOG_SAVEFILE 1
	SDL_FILEDIALOG_OPENFOLDER 2 )
]
