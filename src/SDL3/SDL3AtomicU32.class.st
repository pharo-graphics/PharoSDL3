Class {
	#name : 'SDL3AtomicU32',
	#superclass : 'SDL3Structure',
	#classVars : [
		'OFFSET_VALUE'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'field definition' }
SDL3AtomicU32 class >> fieldsDesc [

	^ #(
	Uint32 value
	)
]

{ #category : 'accessing - structure variables' }
SDL3AtomicU32 >> value [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_VALUE
]

{ #category : 'accessing - structure variables' }
SDL3AtomicU32 >> value: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_VALUE put: anObject
]
