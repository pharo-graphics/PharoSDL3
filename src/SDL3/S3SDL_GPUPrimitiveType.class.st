Class {
	#name : 'S3SDL_GPUPrimitiveType',
	#superclass : 'S3Enumeration',
	#classVars : [
		'SDL_GPU_PRIMITIVETYPE_LINELIST',
		'SDL_GPU_PRIMITIVETYPE_LINESTRIP',
		'SDL_GPU_PRIMITIVETYPE_POINTLIST',
		'SDL_GPU_PRIMITIVETYPE_TRIANGLELIST',
		'SDL_GPU_PRIMITIVETYPE_TRIANGLESTRIP'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'enum declaration' }
S3SDL_GPUPrimitiveType class >> enumDecl [

	^ #(
	SDL_GPU_PRIMITIVETYPE_TRIANGLELIST 0
	SDL_GPU_PRIMITIVETYPE_TRIANGLESTRIP 1
	SDL_GPU_PRIMITIVETYPE_LINELIST 2
	SDL_GPU_PRIMITIVETYPE_LINESTRIP 3
	SDL_GPU_PRIMITIVETYPE_POINTLIST 4 )
]

{ #category : 'accessing enum' }
S3SDL_GPUPrimitiveType class >> lineList [
	"This method was automatically generated"
	^ SDL_GPU_PRIMITIVETYPE_LINELIST
]

{ #category : 'accessing enum' }
S3SDL_GPUPrimitiveType class >> lineStrip [
	"This method was automatically generated"
	^ SDL_GPU_PRIMITIVETYPE_LINESTRIP
]

{ #category : 'accessing enum' }
S3SDL_GPUPrimitiveType class >> pointList [
	"This method was automatically generated"
	^ SDL_GPU_PRIMITIVETYPE_POINTLIST
]

{ #category : 'accessing enum' }
S3SDL_GPUPrimitiveType class >> triangleList [
	"This method was automatically generated"
	^ SDL_GPU_PRIMITIVETYPE_TRIANGLELIST
]

{ #category : 'accessing enum' }
S3SDL_GPUPrimitiveType class >> triangleStrip [
	"This method was automatically generated"
	^ SDL_GPU_PRIMITIVETYPE_TRIANGLESTRIP
]
