"
I am a wrapper for an SDL3Texture used by the OSSDL3GenericRenderer.
"
Class {
	#name : 'OSSDL3WindowRendererTexture',
	#superclass : 'Object',
	#instVars : [
		'handle',
		'extent'
	],
	#category : 'SDL3-OSWindow-Renderers',
	#package : 'SDL3-OSWindow',
	#tag : 'Renderers'
}

{ #category : 'deleting' }
OSSDL3WindowRendererTexture >> destroy [
	handle ifNotNil: [ 
		handle destroy.
		handle := nil
	]
]

{ #category : 'accessing' }
OSSDL3WindowRendererTexture >> extent [
	^ extent
]

{ #category : 'accessing' }
OSSDL3WindowRendererTexture >> extent: anObject [
	extent := anObject
]

{ #category : 'accessing' }
OSSDL3WindowRendererTexture >> handle [
	^ handle
]

{ #category : 'accessing' }
OSSDL3WindowRendererTexture >> handle: anObject [
	handle := anObject
]
