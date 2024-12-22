Class {
	#name : 'S3SDL_PathInfo',
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
S3SDL_PathInfo class >> fieldsDesc [

	^ #(
	SDL_PathType type;
	int size;
	int create_time;
	int modify_time;
	int access_time
	)
]

{ #category : 'accessing - structure variables' }
S3SDL_PathInfo >> access_time [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_ACCESS_TIME
]

{ #category : 'accessing - structure variables' }
S3SDL_PathInfo >> access_time: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_ACCESS_TIME put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_PathInfo >> create_time [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_CREATE_TIME
]

{ #category : 'accessing - structure variables' }
S3SDL_PathInfo >> create_time: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_CREATE_TIME put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_PathInfo >> modify_time [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_MODIFY_TIME
]

{ #category : 'accessing - structure variables' }
S3SDL_PathInfo >> modify_time: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_MODIFY_TIME put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_PathInfo >> size [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_SIZE
]

{ #category : 'accessing - structure variables' }
S3SDL_PathInfo >> size: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_SIZE put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_PathInfo >> type [
	"This method was automatically generated"
	^S3SDL_PathType fromInteger: (handle unsignedLongAt: OFFSET_TYPE)
]

{ #category : 'accessing - structure variables' }
S3SDL_PathInfo >> type: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_TYPE put: anObject value
]
