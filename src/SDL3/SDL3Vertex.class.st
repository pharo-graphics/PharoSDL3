Class {
	#name : 'SDL3Vertex',
	#superclass : 'S3Structure',
	#classVars : [
		'OFFSET_COLOR',
		'OFFSET_POSITION',
		'OFFSET_TEX_COORD'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'field definition' }
SDL3Vertex class >> fieldsDesc [

	^ #(
	SDL_FPoint position;
	SDL_FColor color;
	SDL_FPoint tex_coord
	)
]

{ #category : 'accessing - structure variables' }
SDL3Vertex >> color [
	"This method was automatically generated"
	^ SDL3FColor fromHandle: (handle referenceStructAt: OFFSET_COLOR length: SDL3FColor byteSize)
]

{ #category : 'accessing - structure variables' }
SDL3Vertex >> color: anObject [
	"This method was automatically generated"
	handle structAt: OFFSET_COLOR put: anObject getHandle length: SDL3FColor byteSize
]

{ #category : 'accessing - structure variables' }
SDL3Vertex >> position [
	"This method was automatically generated"
	^ SDL3FPoint fromHandle: (handle referenceStructAt: OFFSET_POSITION length: SDL3FPoint byteSize)
]

{ #category : 'accessing - structure variables' }
SDL3Vertex >> position: anObject [
	"This method was automatically generated"
	handle structAt: OFFSET_POSITION put: anObject getHandle length: SDL3FPoint byteSize
]

{ #category : 'accessing - structure variables' }
SDL3Vertex >> tex_coord [
	"This method was automatically generated"
	^ SDL3FPoint fromHandle: (handle referenceStructAt: OFFSET_TEX_COORD length: SDL3FPoint byteSize)
]

{ #category : 'accessing - structure variables' }
SDL3Vertex >> tex_coord: anObject [
	"This method was automatically generated"
	handle structAt: OFFSET_TEX_COORD put: anObject getHandle length: SDL3FPoint byteSize
]
