Class {
	#name : 'SDL3GPUIndirectDispatchCommand',
	#superclass : 'SDL3Structure',
	#classVars : [
		'OFFSET_GROUPCOUNT_X',
		'OFFSET_GROUPCOUNT_Y',
		'OFFSET_GROUPCOUNT_Z'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'field definition' }
SDL3GPUIndirectDispatchCommand class >> fieldsDesc [

	^ #(
	Uint32 groupcount_x;
	Uint32 groupcount_y;
	Uint32 groupcount_z
	)
]

{ #category : 'accessing - structure variables' }
SDL3GPUIndirectDispatchCommand >> groupcountX [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_GROUPCOUNT_X
]

{ #category : 'accessing - structure variables' }
SDL3GPUIndirectDispatchCommand >> groupcountX: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_GROUPCOUNT_X put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUIndirectDispatchCommand >> groupcountY [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_GROUPCOUNT_Y
]

{ #category : 'accessing - structure variables' }
SDL3GPUIndirectDispatchCommand >> groupcountY: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_GROUPCOUNT_Y put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUIndirectDispatchCommand >> groupcountZ [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_GROUPCOUNT_Z
]

{ #category : 'accessing - structure variables' }
SDL3GPUIndirectDispatchCommand >> groupcountZ: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_GROUPCOUNT_Z put: anObject
]
