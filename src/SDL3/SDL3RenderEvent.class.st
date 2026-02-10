Class {
	#name : 'SDL3RenderEvent',
	#superclass : 'SDL3WindowIDEvent',
	#classVars : [
		'OFFSET_RESERVED',
		'OFFSET_TIMESTAMP',
		'OFFSET_TYPE',
		'OFFSET_WINDOWID'
	],
	#category : 'SDL3-Events',
	#package : 'SDL3',
	#tag : 'Events'
}

{ #category : 'field definition' }
SDL3RenderEvent class >> fieldsDesc [

	^ #(
	SDL_EventType type;
	Uint32 reserved;
	Uint64 timestamp;
	SDL_WindowID windowID
	)
]

{ #category : 'visitor' }
SDL3RenderEvent >> accept: aVisitor [

	^ aVisitor visitRenderEvent: self
]

{ #category : 'accessing - structure variables' }
SDL3RenderEvent >> timestamp [
	"This method was automatically generated"
	^handle unsignedLongLongAt: OFFSET_TIMESTAMP
]

{ #category : 'accessing - structure variables' }
SDL3RenderEvent >> windowID [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_WINDOWID
]
