Class {
	#name : 'SDL3KeyboardEvent',
	#superclass : 'SDL3MappedEvent',
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
SDL3KeyboardEvent class >> fieldsDesc [

	^ #(
	SDL_EventType type;
	Uint32 reserved;
	Uint64 timestamp;
	SDL_WindowID windowID;
	SDL_KeyboardID which;
	SDL_Scancode scancode;
	SDL_Keycode key;
	SDL_Keymod mod;
	Uint16 raw;
	bool down;
	bool repeat
	)
]

{ #category : 'accessing - structure variables' }
SDL3KeyboardEvent >> down [
	"This method was automatically generated"
	^handle booleanAt: OFFSET_DOWN
]

{ #category : 'accessing - structure variables' }
SDL3KeyboardEvent >> down: anObject [
	"This method was automatically generated"
	handle booleanAt: OFFSET_DOWN put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3KeyboardEvent >> key [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_KEY
]

{ #category : 'accessing - structure variables' }
SDL3KeyboardEvent >> key: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_KEY put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3KeyboardEvent >> mod [
	"This method was automatically generated"
	^handle unsignedShortAt: OFFSET_MOD
]

{ #category : 'accessing - structure variables' }
SDL3KeyboardEvent >> mod: anObject [
	"This method was automatically generated"
	handle unsignedShortAt: OFFSET_MOD put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3KeyboardEvent >> raw [
	"This method was automatically generated"
	^handle unsignedShortAt: OFFSET_RAW
]

{ #category : 'accessing - structure variables' }
SDL3KeyboardEvent >> raw: anObject [
	"This method was automatically generated"
	handle unsignedShortAt: OFFSET_RAW put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3KeyboardEvent >> repeat [
	"This method was automatically generated"
	^handle booleanAt: OFFSET_REPEAT
]

{ #category : 'accessing - structure variables' }
SDL3KeyboardEvent >> repeat: anObject [
	"This method was automatically generated"
	handle booleanAt: OFFSET_REPEAT put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3KeyboardEvent >> reserved [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_RESERVED
]

{ #category : 'accessing - structure variables' }
SDL3KeyboardEvent >> reserved: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_RESERVED put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3KeyboardEvent >> scancode [
	"This method was automatically generated"
	^SDL3Scancode fromInteger: (handle unsignedLongAt: OFFSET_SCANCODE)
]

{ #category : 'accessing - structure variables' }
SDL3KeyboardEvent >> scancode: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_SCANCODE put: anObject value
]

{ #category : 'accessing - structure variables' }
SDL3KeyboardEvent >> timestamp [
	"This method was automatically generated"
	^handle unsignedLongLongAt: OFFSET_TIMESTAMP
]

{ #category : 'accessing - structure variables' }
SDL3KeyboardEvent >> timestamp: anObject [
	"This method was automatically generated"
	handle unsignedLongLongAt: OFFSET_TIMESTAMP put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3KeyboardEvent >> type [
	"This method was automatically generated"
	^SDL3EventType fromInteger: (handle unsignedLongAt: OFFSET_TYPE)
]

{ #category : 'accessing - structure variables' }
SDL3KeyboardEvent >> type: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_TYPE put: anObject value
]

{ #category : 'accessing - structure variables' }
SDL3KeyboardEvent >> which [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_WHICH
]

{ #category : 'accessing - structure variables' }
SDL3KeyboardEvent >> which: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_WHICH put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3KeyboardEvent >> windowID [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_WINDOWID
]

{ #category : 'accessing - structure variables' }
SDL3KeyboardEvent >> windowID: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_WINDOWID put: anObject
]
