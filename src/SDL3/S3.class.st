Class {
	#name : 'S3',
	#superclass : 'S3BaseObject',
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'field definition' }
S3 class >> fieldsDesc [

	^ #(
	int_2 __val
	)
]

{ #category : 'accessing - structure variables' }
S3 >> __val [
	"This method was automatically generated"
	^(FFITypeArray ofType: #FFIInt32 size: 2) fromHandle: (handle copyFrom: OFFSET___VAL to: OFFSET___VAL + 7)
]

{ #category : 'accessing - structure variables' }
S3 >> __val: anObject [
	"This method was automatically generated"
	handle replaceFrom: OFFSET___VAL to: OFFSET___VAL + 7 with: anObject getHandle startingAt: 1
]
