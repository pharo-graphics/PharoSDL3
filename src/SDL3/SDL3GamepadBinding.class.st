Class {
	#name : 'SDL3GamepadBinding',
	#superclass : 'SDL3Structure',
	#classVars : [
		'OFFSET_INPUT',
		'OFFSET_INPUT_TYPE',
		'OFFSET_OUTPUT',
		'OFFSET_OUTPUT_TYPE'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'field definition' }
SDL3GamepadBinding class >> fieldsDesc [

	^ #(
	SDL_GamepadBindingType input_type;
	SDL_GamepadBinding_union1 input;
	SDL_GamepadBindingType output_type;
	SDL_GamepadBinding_union2 output
	)
]

{ #category : 'accessing - structure variables' }
SDL3GamepadBinding >> input [
	"This method was automatically generated"
	^ SDL3GamepadBindingUnion1 fromHandle: (handle referenceStructAt: OFFSET_INPUT length: SDL3GamepadBindingUnion1 byteSize)
]

{ #category : 'accessing - structure variables' }
SDL3GamepadBinding >> input: anObject [
	"This method was automatically generated"
	handle structAt: OFFSET_INPUT put: anObject getHandle length: SDL3GamepadBindingUnion1 byteSize
]

{ #category : 'accessing - structure variables' }
SDL3GamepadBinding >> inputType [
	"This method was automatically generated"
	^SDL3GamepadBindingType fromInteger: (handle unsignedLongAt: OFFSET_INPUT_TYPE)
]

{ #category : 'accessing - structure variables' }
SDL3GamepadBinding >> inputType: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_INPUT_TYPE put: anObject value
]

{ #category : 'accessing - structure variables' }
SDL3GamepadBinding >> output [
	"This method was automatically generated"
	^ SDL3GamepadBindingUnion2 fromHandle: (handle referenceStructAt: OFFSET_OUTPUT length: SDL3GamepadBindingUnion2 byteSize)
]

{ #category : 'accessing - structure variables' }
SDL3GamepadBinding >> output: anObject [
	"This method was automatically generated"
	handle structAt: OFFSET_OUTPUT put: anObject getHandle length: SDL3GamepadBindingUnion2 byteSize
]

{ #category : 'accessing - structure variables' }
SDL3GamepadBinding >> outputType [
	"This method was automatically generated"
	^SDL3GamepadBindingType fromInteger: (handle unsignedLongAt: OFFSET_OUTPUT_TYPE)
]

{ #category : 'accessing - structure variables' }
SDL3GamepadBinding >> outputType: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_OUTPUT_TYPE put: anObject value
]
