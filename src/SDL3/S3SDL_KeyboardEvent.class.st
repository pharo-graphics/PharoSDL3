Class {
	#name : 'S3SDL_KeyboardEvent',
	#superclass : 'S3Structure',
	#classVars : [
		'OFFSET_DOWN',
		'OFFSET_KEY',
		'OFFSET_MOD',
		'OFFSET_RAW',
		'OFFSET_REPEAT',
		'OFFSET_RESERVED',
		'OFFSET_SCANCODE',
		'OFFSET_TIMESTAMP',
		'OFFSET_TYPE',
		'OFFSET_WHICH',
		'OFFSET_WINDOWID'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'field definition' }
S3SDL_KeyboardEvent class >> fieldsDesc [

	^ #(
	SDL_EventType type;
	int reserved;
	int timestamp;
	int windowID;
	int which;
	int scancode;
	int key;
	int mod;
	int raw;
	int down;
	int repeat
	)
]

{ #category : 'accessing - structure variables' }
S3SDL_KeyboardEvent >> down [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_DOWN
]

{ #category : 'accessing - structure variables' }
S3SDL_KeyboardEvent >> down: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_DOWN put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_KeyboardEvent >> key [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_KEY
]

{ #category : 'accessing - structure variables' }
S3SDL_KeyboardEvent >> key: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_KEY put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_KeyboardEvent >> mod [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_MOD
]

{ #category : 'accessing - structure variables' }
S3SDL_KeyboardEvent >> mod: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_MOD put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_KeyboardEvent >> raw [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_RAW
]

{ #category : 'accessing - structure variables' }
S3SDL_KeyboardEvent >> raw: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_RAW put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_KeyboardEvent >> repeat [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_REPEAT
]

{ #category : 'accessing - structure variables' }
S3SDL_KeyboardEvent >> repeat: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_REPEAT put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_KeyboardEvent >> reserved [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_RESERVED
]

{ #category : 'accessing - structure variables' }
S3SDL_KeyboardEvent >> reserved: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_RESERVED put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_KeyboardEvent >> scancode [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_SCANCODE
]

{ #category : 'accessing - structure variables' }
S3SDL_KeyboardEvent >> scancode: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_SCANCODE put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_KeyboardEvent >> timestamp [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_TIMESTAMP
]

{ #category : 'accessing - structure variables' }
S3SDL_KeyboardEvent >> timestamp: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_TIMESTAMP put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_KeyboardEvent >> type [
	"This method was automatically generated"
	^S3SDL_EventType fromInteger: (handle unsignedLongAt: OFFSET_TYPE)
]

{ #category : 'accessing - structure variables' }
S3SDL_KeyboardEvent >> type: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_TYPE put: anObject value
]

{ #category : 'accessing - structure variables' }
S3SDL_KeyboardEvent >> which [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_WHICH
]

{ #category : 'accessing - structure variables' }
S3SDL_KeyboardEvent >> which: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_WHICH put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_KeyboardEvent >> windowID [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_WINDOWID
]

{ #category : 'accessing - structure variables' }
S3SDL_KeyboardEvent >> windowID: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_WINDOWID put: anObject
]
