Class {
	#name : 'SDL3LogCategory',
	#superclass : 'S3Enumeration',
	#classVars : [
		'SDL_LOG_CATEGORY_APPLICATION',
		'SDL_LOG_CATEGORY_ASSERT',
		'SDL_LOG_CATEGORY_AUDIO',
		'SDL_LOG_CATEGORY_CUSTOM',
		'SDL_LOG_CATEGORY_ERROR',
		'SDL_LOG_CATEGORY_GPU',
		'SDL_LOG_CATEGORY_INPUT',
		'SDL_LOG_CATEGORY_RENDER',
		'SDL_LOG_CATEGORY_RESERVED10',
		'SDL_LOG_CATEGORY_RESERVED2',
		'SDL_LOG_CATEGORY_RESERVED3',
		'SDL_LOG_CATEGORY_RESERVED4',
		'SDL_LOG_CATEGORY_RESERVED5',
		'SDL_LOG_CATEGORY_RESERVED6',
		'SDL_LOG_CATEGORY_RESERVED7',
		'SDL_LOG_CATEGORY_RESERVED8',
		'SDL_LOG_CATEGORY_RESERVED9',
		'SDL_LOG_CATEGORY_SYSTEM',
		'SDL_LOG_CATEGORY_TEST',
		'SDL_LOG_CATEGORY_VIDEO'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'accessing enum' }
SDL3LogCategory class >> application [
	"This method was automatically generated"
	^ SDL_LOG_CATEGORY_APPLICATION
]

{ #category : 'accessing enum' }
SDL3LogCategory class >> assert [
	"This method was automatically generated"
	^ SDL_LOG_CATEGORY_ASSERT
]

{ #category : 'accessing enum' }
SDL3LogCategory class >> audio [
	"This method was automatically generated"
	^ SDL_LOG_CATEGORY_AUDIO
]

{ #category : 'accessing enum' }
SDL3LogCategory class >> custom [
	"This method was automatically generated"
	^ SDL_LOG_CATEGORY_CUSTOM
]

{ #category : 'enum declaration' }
SDL3LogCategory class >> enumDecl [

	^ #(
	SDL_LOG_CATEGORY_APPLICATION 0
	SDL_LOG_CATEGORY_ERROR 1
	SDL_LOG_CATEGORY_ASSERT 2
	SDL_LOG_CATEGORY_SYSTEM 3
	SDL_LOG_CATEGORY_AUDIO 4
	SDL_LOG_CATEGORY_VIDEO 5
	SDL_LOG_CATEGORY_RENDER 6
	SDL_LOG_CATEGORY_INPUT 7
	SDL_LOG_CATEGORY_TEST 8
	SDL_LOG_CATEGORY_GPU 9
	SDL_LOG_CATEGORY_RESERVED2 10
	SDL_LOG_CATEGORY_RESERVED3 11
	SDL_LOG_CATEGORY_RESERVED4 12
	SDL_LOG_CATEGORY_RESERVED5 13
	SDL_LOG_CATEGORY_RESERVED6 14
	SDL_LOG_CATEGORY_RESERVED7 15
	SDL_LOG_CATEGORY_RESERVED8 16
	SDL_LOG_CATEGORY_RESERVED9 17
	SDL_LOG_CATEGORY_RESERVED10 18
	SDL_LOG_CATEGORY_CUSTOM 19 )
]

{ #category : 'accessing enum' }
SDL3LogCategory class >> error [
	"This method was automatically generated"
	^ SDL_LOG_CATEGORY_ERROR
]

{ #category : 'accessing enum' }
SDL3LogCategory class >> gpu [
	"This method was automatically generated"
	^ SDL_LOG_CATEGORY_GPU
]

{ #category : 'accessing enum' }
SDL3LogCategory class >> input [
	"This method was automatically generated"
	^ SDL_LOG_CATEGORY_INPUT
]

{ #category : 'accessing enum' }
SDL3LogCategory class >> render [
	"This method was automatically generated"
	^ SDL_LOG_CATEGORY_RENDER
]

{ #category : 'accessing enum' }
SDL3LogCategory class >> reserved10 [
	"This method was automatically generated"
	^ SDL_LOG_CATEGORY_RESERVED10
]

{ #category : 'accessing enum' }
SDL3LogCategory class >> reserved2 [
	"This method was automatically generated"
	^ SDL_LOG_CATEGORY_RESERVED2
]

{ #category : 'accessing enum' }
SDL3LogCategory class >> reserved3 [
	"This method was automatically generated"
	^ SDL_LOG_CATEGORY_RESERVED3
]

{ #category : 'accessing enum' }
SDL3LogCategory class >> reserved4 [
	"This method was automatically generated"
	^ SDL_LOG_CATEGORY_RESERVED4
]

{ #category : 'accessing enum' }
SDL3LogCategory class >> reserved5 [
	"This method was automatically generated"
	^ SDL_LOG_CATEGORY_RESERVED5
]

{ #category : 'accessing enum' }
SDL3LogCategory class >> reserved6 [
	"This method was automatically generated"
	^ SDL_LOG_CATEGORY_RESERVED6
]

{ #category : 'accessing enum' }
SDL3LogCategory class >> reserved7 [
	"This method was automatically generated"
	^ SDL_LOG_CATEGORY_RESERVED7
]

{ #category : 'accessing enum' }
SDL3LogCategory class >> reserved8 [
	"This method was automatically generated"
	^ SDL_LOG_CATEGORY_RESERVED8
]

{ #category : 'accessing enum' }
SDL3LogCategory class >> reserved9 [
	"This method was automatically generated"
	^ SDL_LOG_CATEGORY_RESERVED9
]

{ #category : 'accessing enum' }
SDL3LogCategory class >> system [
	"This method was automatically generated"
	^ SDL_LOG_CATEGORY_SYSTEM
]

{ #category : 'accessing enum' }
SDL3LogCategory class >> test [
	"This method was automatically generated"
	^ SDL_LOG_CATEGORY_TEST
]

{ #category : 'accessing enum' }
SDL3LogCategory class >> video [
	"This method was automatically generated"
	^ SDL_LOG_CATEGORY_VIDEO
]
