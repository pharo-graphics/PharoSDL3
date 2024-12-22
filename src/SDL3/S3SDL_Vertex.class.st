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
	int position;
	int color;
	int tex_coord
	)
]

{ #category : 'accessing - structure variables' }
S3SDL_Vertex >> color [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_COLOR
]

{ #category : 'accessing - structure variables' }
S3SDL_Vertex >> color: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_COLOR put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_Vertex >> position [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_POSITION
]

{ #category : 'accessing - structure variables' }
S3SDL_Vertex >> position: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_POSITION put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_Vertex >> tex_coord [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_TEX_COORD
]

{ #category : 'accessing - structure variables' }
S3SDL_Vertex >> tex_coord: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_TEX_COORD put: anObject
]
