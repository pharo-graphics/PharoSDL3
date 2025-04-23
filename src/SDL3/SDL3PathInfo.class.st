Class {
	#name : 'SDL3PathInfo',
	#superclass : 'S3Structure',
	#classVars : [
		'OFFSET_ACCESS_TIME',
		'OFFSET_CREATE_TIME',
		'OFFSET_MODIFY_TIME',
		'OFFSET_SIZE',
		'OFFSET_TYPE'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'field definition' }
SDL3PathInfo class >> fieldsDesc [

	^ #(
	SDL_PathType type;
	Uint64 size;
	SDL_Time create_time;
	SDL_Time modify_time;
	SDL_Time access_time
	)
]

{ #category : 'accessing - structure variables' }
SDL3PathInfo >> access_time [
	"This method was automatically generated"
	^handle platformLongAt: OFFSET_ACCESS_TIME
]

{ #category : 'accessing - structure variables' }
SDL3PathInfo >> access_time: anObject [
	"This method was automatically generated"
	^handle platformLongAt: OFFSET_ACCESS_TIME put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3PathInfo >> create_time [
	"This method was automatically generated"
	^handle platformLongAt: OFFSET_CREATE_TIME
]

{ #category : 'accessing - structure variables' }
SDL3PathInfo >> create_time: anObject [
	"This method was automatically generated"
	^handle platformLongAt: OFFSET_CREATE_TIME put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3PathInfo >> modify_time [
	"This method was automatically generated"
	^handle platformLongAt: OFFSET_MODIFY_TIME
]

{ #category : 'accessing - structure variables' }
SDL3PathInfo >> modify_time: anObject [
	"This method was automatically generated"
	^handle platformLongAt: OFFSET_MODIFY_TIME put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3PathInfo >> size [
	"This method was automatically generated"
	^handle unsignedLongLongAt: OFFSET_SIZE
]

{ #category : 'accessing - structure variables' }
SDL3PathInfo >> size: anObject [
	"This method was automatically generated"
	handle unsignedLongLongAt: OFFSET_SIZE put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3PathInfo >> type [
	"This method was automatically generated"
	^SDL3PathType fromInteger: (handle unsignedLongAt: OFFSET_TYPE)
]

{ #category : 'accessing - structure variables' }
SDL3PathInfo >> type: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_TYPE put: anObject value
]
