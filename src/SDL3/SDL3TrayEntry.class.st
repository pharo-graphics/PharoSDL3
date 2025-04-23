Class {
	#name : 'SDL3TrayEntry',
	#superclass : 'SDL3BaseObject',
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'finalizing' }
SDL3TrayEntry >> dispose [

	self ffiCall: #(void SDL_TrayEntry_dispose(SDL_TrayEntry* self))
]
