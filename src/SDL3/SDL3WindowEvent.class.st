Class {
	#name : 'SDL3WindowEvent',
	#superclass : 'SDL3WindowIDEvent',
	#classVars : [
		'OFFSET_DATA1',
		'OFFSET_DATA2',
		'OFFSET_RESERVED',
		'OFFSET_TIMESTAMP',
		'OFFSET_TYPE',
		'OFFSET_WINDOWID'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'field definition' }
SDL3WindowEvent class >> fieldsDesc [

	^ #(
	SDL_EventType type;
	Uint32 reserved;
	Uint64 timestamp;
	SDL_WindowID windowID;
	Sint32 data1;
	Sint32 data2
	)
]

{ #category : 'accessing - structure variables' }
SDL3WindowEvent >> data1 [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_DATA1
]

{ #category : 'accessing - structure variables' }
SDL3WindowEvent >> data2 [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_DATA2
]

{ #category : 'accessing - structure variables' }
SDL3WindowEvent >> reserved [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_RESERVED
]

{ #category : 'accessing - structure variables' }
SDL3WindowEvent >> timestamp [
	"This method was automatically generated"
	^handle platformUnsignedLongAt: OFFSET_TIMESTAMP
]

{ #category : 'accessing - structure variables' }
SDL3WindowEvent >> windowID [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_WINDOWID
]
