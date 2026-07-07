"
I am a SDL3 FFI binding for `SDL_StorageInterface`.

Function interface for SDL_Storage.

See: https://wiki.libsdl.org/SDL3/SDL_StorageInterface
"
Class {
	#name : 'SDL3StorageInterface',
	#superclass : 'SDL3Structure',
	#classVars : [
		'OFFSET_CLOSE',
		'OFFSET_COPY',
		'OFFSET_ENUMERATE',
		'OFFSET_INFO',
		'OFFSET_MKDIR',
		'OFFSET_READY',
		'OFFSET_READ_FILE',
		'OFFSET_REMOVE',
		'OFFSET_RENAME',
		'OFFSET_SPACE_REMAINING',
		'OFFSET_VERSION',
		'OFFSET_WRITE_FILE'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'field definition' }
SDL3StorageInterface class >> fieldsDesc [

	^ #(
	Uint32 version;
	FFICallback close;
	FFICallback ready;
	FFICallback enumerate;
	FFICallback info;
	FFICallback read_file;
	FFICallback write_file;
	FFICallback mkdir;
	FFICallback remove;
	FFICallback rename;
	FFICallback copy;
	Uint64 space_remaining
	)
]

{ #category : 'accessing - structure variables' }
SDL3StorageInterface >> close [
	"This method was automatically generated"
	^FFICallback forAddress: ((handle pointerAt: OFFSET_CLOSE) asInteger)
]

{ #category : 'accessing - structure variables' }
SDL3StorageInterface >> close: anObject [
	"This method was automatically generated"
	handle 
		pointerAt: OFFSET_CLOSE
		put: (anObject 
			ifNotNil: [ anObject thunk asExternalAddress ]
			ifNil: [ ExternalAddress null ])
]

{ #category : 'accessing - structure variables' }
SDL3StorageInterface >> copy [
	"This method was automatically generated"
	^FFICallback forAddress: ((handle pointerAt: OFFSET_COPY) asInteger)
]

{ #category : 'accessing - structure variables' }
SDL3StorageInterface >> copy: anObject [
	"This method was automatically generated"
	handle 
		pointerAt: OFFSET_COPY
		put: (anObject 
			ifNotNil: [ anObject thunk asExternalAddress ]
			ifNil: [ ExternalAddress null ])
]

{ #category : 'accessing - structure variables' }
SDL3StorageInterface >> enumerate [
	"This method was automatically generated"
	^FFICallback forAddress: ((handle pointerAt: OFFSET_ENUMERATE) asInteger)
]

{ #category : 'accessing - structure variables' }
SDL3StorageInterface >> enumerate: anObject [
	"This method was automatically generated"
	handle 
		pointerAt: OFFSET_ENUMERATE
		put: (anObject 
			ifNotNil: [ anObject thunk asExternalAddress ]
			ifNil: [ ExternalAddress null ])
]

{ #category : 'accessing - structure variables' }
SDL3StorageInterface >> info [
	"This method was automatically generated"
	^FFICallback forAddress: ((handle pointerAt: OFFSET_INFO) asInteger)
]

{ #category : 'accessing - structure variables' }
SDL3StorageInterface >> info: anObject [
	"This method was automatically generated"
	handle 
		pointerAt: OFFSET_INFO
		put: (anObject 
			ifNotNil: [ anObject thunk asExternalAddress ]
			ifNil: [ ExternalAddress null ])
]

{ #category : 'accessing - structure variables' }
SDL3StorageInterface >> mkdir [
	"This method was automatically generated"
	^FFICallback forAddress: ((handle pointerAt: OFFSET_MKDIR) asInteger)
]

{ #category : 'accessing - structure variables' }
SDL3StorageInterface >> mkdir: anObject [
	"This method was automatically generated"
	handle 
		pointerAt: OFFSET_MKDIR
		put: (anObject 
			ifNotNil: [ anObject thunk asExternalAddress ]
			ifNil: [ ExternalAddress null ])
]

{ #category : 'accessing - structure variables' }
SDL3StorageInterface >> readFile [
	"This method was automatically generated"
	^FFICallback forAddress: ((handle pointerAt: OFFSET_READ_FILE) asInteger)
]

{ #category : 'accessing - structure variables' }
SDL3StorageInterface >> readFile: anObject [
	"This method was automatically generated"
	handle 
		pointerAt: OFFSET_READ_FILE
		put: (anObject 
			ifNotNil: [ anObject thunk asExternalAddress ]
			ifNil: [ ExternalAddress null ])
]

{ #category : 'accessing - structure variables' }
SDL3StorageInterface >> ready [
	"This method was automatically generated"
	^FFICallback forAddress: ((handle pointerAt: OFFSET_READY) asInteger)
]

{ #category : 'accessing - structure variables' }
SDL3StorageInterface >> ready: anObject [
	"This method was automatically generated"
	handle 
		pointerAt: OFFSET_READY
		put: (anObject 
			ifNotNil: [ anObject thunk asExternalAddress ]
			ifNil: [ ExternalAddress null ])
]

{ #category : 'accessing - structure variables' }
SDL3StorageInterface >> remove [
	"This method was automatically generated"
	^FFICallback forAddress: ((handle pointerAt: OFFSET_REMOVE) asInteger)
]

{ #category : 'accessing - structure variables' }
SDL3StorageInterface >> remove: anObject [
	"This method was automatically generated"
	handle 
		pointerAt: OFFSET_REMOVE
		put: (anObject 
			ifNotNil: [ anObject thunk asExternalAddress ]
			ifNil: [ ExternalAddress null ])
]

{ #category : 'accessing - structure variables' }
SDL3StorageInterface >> rename [
	"This method was automatically generated"
	^FFICallback forAddress: ((handle pointerAt: OFFSET_RENAME) asInteger)
]

{ #category : 'accessing - structure variables' }
SDL3StorageInterface >> rename: anObject [
	"This method was automatically generated"
	handle 
		pointerAt: OFFSET_RENAME
		put: (anObject 
			ifNotNil: [ anObject thunk asExternalAddress ]
			ifNil: [ ExternalAddress null ])
]

{ #category : 'accessing - structure variables' }
SDL3StorageInterface >> spaceRemaining [
	"This method was automatically generated"
	^handle unsignedLongLongAt: OFFSET_SPACE_REMAINING
]

{ #category : 'accessing - structure variables' }
SDL3StorageInterface >> spaceRemaining: anObject [
	"This method was automatically generated"
	handle unsignedLongLongAt: OFFSET_SPACE_REMAINING put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3StorageInterface >> version [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_VERSION
]

{ #category : 'accessing - structure variables' }
SDL3StorageInterface >> version: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_VERSION put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3StorageInterface >> writeFile [
	"This method was automatically generated"
	^FFICallback forAddress: ((handle pointerAt: OFFSET_WRITE_FILE) asInteger)
]

{ #category : 'accessing - structure variables' }
SDL3StorageInterface >> writeFile: anObject [
	"This method was automatically generated"
	handle 
		pointerAt: OFFSET_WRITE_FILE
		put: (anObject 
			ifNotNil: [ anObject thunk asExternalAddress ]
			ifNil: [ ExternalAddress null ])
]
