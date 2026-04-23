"
I am a mock texture used to verify calls to SDL_UpdateTexture.
"
Class {
	#name : 'SDL3MockTexture',
	#superclass : 'SDL3Texture',
	#instVars : [
		'updateCalls'
	],
	#category : 'SDL3-Tests-Renderers',
	#package : 'SDL3-Tests',
	#tag : 'Renderers'
}

{ #category : 'initialization' }
SDL3MockTexture >> initialize [
	super initialize.
	updateCalls := OrderedCollection new.
]

{ #category : 'accessing' }
SDL3MockTexture >> updateCalls [
	^ updateCalls
]
