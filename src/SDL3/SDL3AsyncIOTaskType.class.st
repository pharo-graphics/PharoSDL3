Class {
	#name : 'SDL3AsyncIOTaskType',
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

{ #category : 'accessing enum' }
SDL3AsyncIOTaskType class >> close [
	"This method was automatically generated"
	^ SDL_ASYNCIO_TASK_CLOSE
]

{ #category : 'enum declaration' }
SDL3AsyncIOTaskType class >> enumDecl [

	^ #(
	SDL_ASYNCIO_TASK_READ 0
	SDL_ASYNCIO_TASK_WRITE 1
	SDL_ASYNCIO_TASK_CLOSE 2 )
]

{ #category : 'accessing enum' }
SDL3AsyncIOTaskType class >> read [
	"This method was automatically generated"
	^ SDL_ASYNCIO_TASK_READ
]

{ #category : 'accessing enum' }
SDL3AsyncIOTaskType class >> write [
	"This method was automatically generated"
	^ SDL_ASYNCIO_TASK_WRITE
]
