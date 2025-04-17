Class {
	#name : 'S3SDL_AsyncIOTaskType',
	#superclass : 'S3Enumeration',
	#classVars : [
		'SDL_ASYNCIO_TASK_CLOSE',
		'SDL_ASYNCIO_TASK_READ',
		'SDL_ASYNCIO_TASK_WRITE'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'enum declaration' }
S3SDL_AsyncIOTaskType class >> enumDecl [

	^ #(
	SDL_ASYNCIO_TASK_READ 0
	SDL_ASYNCIO_TASK_WRITE 1
	SDL_ASYNCIO_TASK_CLOSE 2 )
]
