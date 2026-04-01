Class {
	#name : 'SDL3GamepadBindingUnion1',
	#superclass : 'SDL3Union',
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'field definition' }
SDL3GamepadBindingUnion1 class >> fieldsDesc [

	^ #(
	int button
	)
]

{ #category : 'accessing - structure variables' }
SDL3GamepadBindingUnion1 >> button [
	"This method was automatically generated"
	^handle signedLongAt: 1
]

{ #category : 'accessing - structure variables' }
SDL3GamepadBindingUnion1 >> button: anObject [
	"This method was automatically generated"
	handle signedLongAt: 1 put: anObject
]
