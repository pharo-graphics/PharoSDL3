Class {
	#name : 'SDL3Condition',
	#superclass : 'SDL3BaseObject',
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'finalizing' }
SDL3Condition >> dispose [

	self ffiCall: #(void SDL_Condition_dispose(SDL_Condition* self))
]
