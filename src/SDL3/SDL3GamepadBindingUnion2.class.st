Class {
	#name : 'SDL3GamepadBindingUnion2',
	#superclass : 'SDL3Union',
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'field definition' }
SDL3GamepadBindingUnion2 class >> fieldsDesc [

	^ #(
	SDL_GamepadButton button
	)
]

{ #category : 'accessing - structure variables' }
SDL3GamepadBindingUnion2 >> button [
	"This method was automatically generated"
	^SDL3GamepadButton fromInteger: (handle signedLongAt: 1)
]

{ #category : 'accessing - structure variables' }
SDL3GamepadBindingUnion2 >> button: anObject [
	"This method was automatically generated"
	handle signedLongAt: 1 put: anObject value
]
