Class {
	#name : 'S3SDL_Folder',
	#superclass : 'S3Enumeration',
	#classVars : [
		'SDL_FOLDER_COUNT',
		'SDL_FOLDER_DESKTOP',
		'SDL_FOLDER_DOCUMENTS',
		'SDL_FOLDER_DOWNLOADS',
		'SDL_FOLDER_HOME',
		'SDL_FOLDER_MUSIC',
		'SDL_FOLDER_PICTURES',
		'SDL_FOLDER_PUBLICSHARE',
		'SDL_FOLDER_SAVEDGAMES',
		'SDL_FOLDER_SCREENSHOTS',
		'SDL_FOLDER_TEMPLATES',
		'SDL_FOLDER_VIDEOS'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'accessing enum' }
S3SDL_Folder class >> SDL_FOLDER_COUNT [
	"This method was automatically generated"
	^ SDL_FOLDER_COUNT
]

{ #category : 'accessing enum' }
S3SDL_Folder class >> SDL_FOLDER_DESKTOP [
	"This method was automatically generated"
	^ SDL_FOLDER_DESKTOP
]

{ #category : 'accessing enum' }
S3SDL_Folder class >> SDL_FOLDER_DOCUMENTS [
	"This method was automatically generated"
	^ SDL_FOLDER_DOCUMENTS
]

{ #category : 'accessing enum' }
S3SDL_Folder class >> SDL_FOLDER_DOWNLOADS [
	"This method was automatically generated"
	^ SDL_FOLDER_DOWNLOADS
]

{ #category : 'accessing enum' }
S3SDL_Folder class >> SDL_FOLDER_HOME [
	"This method was automatically generated"
	^ SDL_FOLDER_HOME
]

{ #category : 'accessing enum' }
S3SDL_Folder class >> SDL_FOLDER_MUSIC [
	"This method was automatically generated"
	^ SDL_FOLDER_MUSIC
]

{ #category : 'accessing enum' }
S3SDL_Folder class >> SDL_FOLDER_PICTURES [
	"This method was automatically generated"
	^ SDL_FOLDER_PICTURES
]

{ #category : 'accessing enum' }
S3SDL_Folder class >> SDL_FOLDER_PUBLICSHARE [
	"This method was automatically generated"
	^ SDL_FOLDER_PUBLICSHARE
]

{ #category : 'accessing enum' }
S3SDL_Folder class >> SDL_FOLDER_SAVEDGAMES [
	"This method was automatically generated"
	^ SDL_FOLDER_SAVEDGAMES
]

{ #category : 'accessing enum' }
S3SDL_Folder class >> SDL_FOLDER_SCREENSHOTS [
	"This method was automatically generated"
	^ SDL_FOLDER_SCREENSHOTS
]

{ #category : 'accessing enum' }
S3SDL_Folder class >> SDL_FOLDER_TEMPLATES [
	"This method was automatically generated"
	^ SDL_FOLDER_TEMPLATES
]

{ #category : 'accessing enum' }
S3SDL_Folder class >> SDL_FOLDER_VIDEOS [
	"This method was automatically generated"
	^ SDL_FOLDER_VIDEOS
]

{ #category : 'enum declaration' }
S3SDL_Folder class >> enumDecl [

	^ #(
	SDL_FOLDER_HOME 0
	SDL_FOLDER_DESKTOP 1
	SDL_FOLDER_DOCUMENTS 2
	SDL_FOLDER_DOWNLOADS 3
	SDL_FOLDER_MUSIC 4
	SDL_FOLDER_PICTURES 5
	SDL_FOLDER_PUBLICSHARE 6
	SDL_FOLDER_SAVEDGAMES 7
	SDL_FOLDER_SCREENSHOTS 8
	SDL_FOLDER_TEMPLATES 9
	SDL_FOLDER_VIDEOS 10
	SDL_FOLDER_COUNT 11 )
]
