Class {
	#name : 'SDL3CommonEvent',
	#superclass : 'SDL3MappedEvent',
	#classVars : [
		'OFFSET_RESERVED',
		'OFFSET_TIMESTAMP',
		'OFFSET_TYPE'
	],
	#category : 'SDL3-Events',
	#package : 'SDL3',
	#tag : 'Events'
}

{ #category : 'field definition' }
SDL3CommonEvent class >> fieldsDesc [

	^ #(
	Uint32 type;
	Uint32 reserved;
	Uint64 timestamp
	)
]

{ #category : 'visitor' }
SDL3CommonEvent >> accept: aVisitor [

	^ aVisitor visitCommonEvent: self
]

{ #category : 'accessing - structure variables' }
SDL3CommonEvent >> timestamp [
	"This method was automatically generated"
	^handle unsignedLongLongAt: OFFSET_TIMESTAMP
]
