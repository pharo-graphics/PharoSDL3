Class {
	#name : 'S3SDL_IOStreamInterface',
	#superclass : 'S3Structure',
	#classVars : [
		'OFFSET_CLOSE',
		'OFFSET_FLUSH',
		'OFFSET_READ',
		'OFFSET_SEEK',
		'OFFSET_SIZE',
		'OFFSET_VERSION',
		'OFFSET_WRITE'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'field definition' }
S3SDL_IOStreamInterface class >> fieldsDesc [

	^ #(
	Uint32 version;
	Sint64 size;
	Sint64 seek;
	FFICallback read;
	FFICallback write;
	FFICallback flush;
	FFICallback close
	)
]

{ #category : 'accessing - structure variables' }
S3SDL_IOStreamInterface >> close [
	"This method was automatically generated"
	^FFICallback forAddress: ((handle pointerAt: OFFSET_CLOSE) asInteger)
]

{ #category : 'accessing - structure variables' }
S3SDL_IOStreamInterface >> close: anObject [
	"This method was automatically generated"
	handle 
		pointerAt: OFFSET_CLOSE
		put: (anObject 
			ifNotNil: [ anObject thunk asExternalAddress ]
			ifNil: [ ExternalAddress null ])
]

{ #category : 'accessing - structure variables' }
S3SDL_IOStreamInterface >> flush [
	"This method was automatically generated"
	^FFICallback forAddress: ((handle pointerAt: OFFSET_FLUSH) asInteger)
]

{ #category : 'accessing - structure variables' }
S3SDL_IOStreamInterface >> flush: anObject [
	"This method was automatically generated"
	handle 
		pointerAt: OFFSET_FLUSH
		put: (anObject 
			ifNotNil: [ anObject thunk asExternalAddress ]
			ifNil: [ ExternalAddress null ])
]

{ #category : 'accessing - structure variables' }
S3SDL_IOStreamInterface >> read [
	"This method was automatically generated"
	^FFICallback forAddress: ((handle pointerAt: OFFSET_READ) asInteger)
]

{ #category : 'accessing - structure variables' }
S3SDL_IOStreamInterface >> read: anObject [
	"This method was automatically generated"
	handle 
		pointerAt: OFFSET_READ
		put: (anObject 
			ifNotNil: [ anObject thunk asExternalAddress ]
			ifNil: [ ExternalAddress null ])
]

{ #category : 'accessing - structure variables' }
S3SDL_IOStreamInterface >> seek [
	"This method was automatically generated"
	^handle platformLongAt: OFFSET_SEEK
]

{ #category : 'accessing - structure variables' }
S3SDL_IOStreamInterface >> seek: anObject [
	"This method was automatically generated"
	^handle platformLongAt: OFFSET_SEEK put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_IOStreamInterface >> size [
	"This method was automatically generated"
	^handle platformLongAt: OFFSET_SIZE
]

{ #category : 'accessing - structure variables' }
S3SDL_IOStreamInterface >> size: anObject [
	"This method was automatically generated"
	^handle platformLongAt: OFFSET_SIZE put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_IOStreamInterface >> version [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_VERSION
]

{ #category : 'accessing - structure variables' }
S3SDL_IOStreamInterface >> version: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_VERSION put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_IOStreamInterface >> write [
	"This method was automatically generated"
	^FFICallback forAddress: ((handle pointerAt: OFFSET_WRITE) asInteger)
]

{ #category : 'accessing - structure variables' }
S3SDL_IOStreamInterface >> write: anObject [
	"This method was automatically generated"
	handle 
		pointerAt: OFFSET_WRITE
		put: (anObject 
			ifNotNil: [ anObject thunk asExternalAddress ]
			ifNil: [ ExternalAddress null ])
]
