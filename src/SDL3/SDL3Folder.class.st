Class {
	#name : 'SDL3Folder',
	#superclass : 'SDL3Enumeration',
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
SDL3Folder class >> count [
	"This method was automatically generated"
	^ SDL_FOLDER_COUNT
]

{ #category : 'accessing enum' }
SDL3Folder class >> desktop [
	"This method was automatically generated"
	^ SDL_FOLDER_DESKTOP
]

{ #category : 'accessing enum' }
SDL3Folder class >> documents [
	"This method was automatically generated"
	^ SDL_FOLDER_DOCUMENTS
]

{ #category : 'accessing enum' }
SDL3Folder class >> downloads [
	"This method was automatically generated"
	^ SDL_FOLDER_DOWNLOADS
]

{ #category : 'enum declaration' }
SDL3Folder class >> enumDecl [

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

{ #category : 'accessing enum' }
SDL3Folder class >> home [
	"This method was automatically generated"
	^ SDL_FOLDER_HOME
]

{ #category : 'accessing enum' }
SDL3Folder class >> music [
	"This method was automatically generated"
	^ SDL_FOLDER_MUSIC
]

{ #category : 'accessing enum' }
SDL3Folder class >> pictures [
	"This method was automatically generated"
	^ SDL_FOLDER_PICTURES
]

{ #category : 'accessing enum' }
SDL3Folder class >> publicshare [
	"This method was automatically generated"
	^ SDL_FOLDER_PUBLICSHARE
]

{ #category : 'accessing enum' }
SDL3Folder class >> savedgames [
	"This method was automatically generated"
	^ SDL_FOLDER_SAVEDGAMES
]

{ #category : 'accessing enum' }
SDL3Folder class >> screenshots [
	"This method was automatically generated"
	^ SDL_FOLDER_SCREENSHOTS
]

{ #category : 'accessing enum' }
SDL3Folder class >> templates [
	"This method was automatically generated"
	^ SDL_FOLDER_TEMPLATES
]

{ #category : 'accessing enum' }
SDL3Folder class >> videos [
	"This method was automatically generated"
	^ SDL_FOLDER_VIDEOS
]
