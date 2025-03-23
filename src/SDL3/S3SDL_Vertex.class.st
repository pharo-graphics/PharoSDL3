Class {
	#name : 'S3SDL_Vertex',
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
S3SDL_Vertex class >> fieldsDesc [

	^ #(
	SDL_FPoint position;
	SDL_FColor color;
	SDL_FPoint tex_coord
	)
]

{ #category : 'accessing - structure variables' }
S3SDL_Vertex >> color [
	"This method was automatically generated"
	^ S3SDL_FColor fromHandle: (handle referenceStructAt: OFFSET_COLOR length: S3SDL_FColor byteSize)
]

{ #category : 'accessing - structure variables' }
S3SDL_Vertex >> color: anObject [
	"This method was automatically generated"
	handle structAt: OFFSET_COLOR put: anObject getHandle length: S3SDL_FColor byteSize
]

{ #category : 'accessing - structure variables' }
S3SDL_Vertex >> position [
	"This method was automatically generated"
	^ S3SDL_FPoint fromHandle: (handle referenceStructAt: OFFSET_POSITION length: S3SDL_FPoint byteSize)
]

{ #category : 'accessing - structure variables' }
S3SDL_Vertex >> position: anObject [
	"This method was automatically generated"
	handle structAt: OFFSET_POSITION put: anObject getHandle length: S3SDL_FPoint byteSize
]

{ #category : 'accessing - structure variables' }
S3SDL_Vertex >> tex_coord [
	"This method was automatically generated"
	^ S3SDL_FPoint fromHandle: (handle referenceStructAt: OFFSET_TEX_COORD length: S3SDL_FPoint byteSize)
]

{ #category : 'accessing - structure variables' }
S3SDL_Vertex >> tex_coord: anObject [
	"This method was automatically generated"
	handle structAt: OFFSET_TEX_COORD put: anObject getHandle length: S3SDL_FPoint byteSize
]
