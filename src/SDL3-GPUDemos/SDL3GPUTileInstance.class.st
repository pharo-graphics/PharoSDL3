"
I represent an instance of a tile in the rendering pipeline.
"
Class {
	#name : 'SDL3GPUTileInstance',
	#superclass : 'SDL3Structure',
	#classVars : [
		'OFFSET_ATLASRECT',
		'OFFSET_SCREENRECT'
	],
	#category : 'SDL3-GPUDemos-TiledMap',
	#package : 'SDL3-GPUDemos',
	#tag : 'TiledMap'
}

{ #category : 'field definition' }
SDL3GPUTileInstance class >> fieldsDesc [
	<script: 'self rebuildFieldAccessors'>

	^ #(
	SDL3FRect screenRect;
	SDL3FRect atlasRect;
	)
]

{ #category : 'accessing - structure variables' }
SDL3GPUTileInstance >> atlasRect [
	"This method was automatically generated"
	^ SDL3FRect fromHandle: (handle referenceStructAt: OFFSET_ATLASRECT length: SDL3FRect byteSize)
]

{ #category : 'accessing - structure variables' }
SDL3GPUTileInstance >> atlasRect: anObject [
	"This method was automatically generated"
	handle structAt: OFFSET_ATLASRECT put: anObject getHandle length: SDL3FRect byteSize
]

{ #category : 'accessing - structure variables' }
SDL3GPUTileInstance >> screenRect [
	"This method was automatically generated"
	^ SDL3FRect fromHandle: (handle referenceStructAt: OFFSET_SCREENRECT length: SDL3FRect byteSize)
]

{ #category : 'accessing - structure variables' }
SDL3GPUTileInstance >> screenRect: anObject [
	"This method was automatically generated"
	handle structAt: OFFSET_SCREENRECT put: anObject getHandle length: SDL3FRect byteSize
]
