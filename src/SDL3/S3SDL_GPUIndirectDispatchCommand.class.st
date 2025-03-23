Class {
	#name : 'S3SDL_GPUIndirectDispatchCommand',
	#superclass : 'S3Structure',
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
S3SDL_GPUIndirectDispatchCommand class >> fieldsDesc [

	^ #(
	Uint32 groupcount_x;
	Uint32 groupcount_y;
	Uint32 groupcount_z
	)
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUIndirectDispatchCommand >> groupcount_x [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_GROUPCOUNT_X
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUIndirectDispatchCommand >> groupcount_x: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_GROUPCOUNT_X put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUIndirectDispatchCommand >> groupcount_y [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_GROUPCOUNT_Y
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUIndirectDispatchCommand >> groupcount_y: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_GROUPCOUNT_Y put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUIndirectDispatchCommand >> groupcount_z [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_GROUPCOUNT_Z
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUIndirectDispatchCommand >> groupcount_z: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_GROUPCOUNT_Z put: anObject
]
