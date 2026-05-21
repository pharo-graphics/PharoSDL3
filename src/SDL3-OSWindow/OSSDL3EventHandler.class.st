"
I am a base class for SDL3 event handlers. I use the TSDL3HierarchicalEventVisitor trait
to provide a consistent visit mechanism. By default, I forward all unhandled events
to the next handler in the chain.
"
Class {
	#name : 'OSSDL3EventHandler',
	#superclass : 'Object',
	#traits : 'TSDL3HierarchicalEventVisitor',
	#classTraits : 'TSDL3HierarchicalEventVisitor classTrait',
	#instVars : [
		'nextHandler'
	],
	#pools : [
		'SDL3AllEnumerations',
		'SDL3ZConstants'
	],
	#category : 'SDL3-OSWindow-Events',
	#package : 'SDL3-OSWindow',
	#tag : 'Events'
}

{ #category : 'visiting' }
OSSDL3EventHandler >> forwardToNextHandler: anEvent [
	"Forward the event to the next handler in the chain using double dispatch."

	nextHandler ifNil: [ ^ self ].

	nextHandler handle: anEvent
]

{ #category : 'processing' }
OSSDL3EventHandler >> handle: aSDL3MappedEvent [

	^ aSDL3MappedEvent accept: self
]

{ #category : 'accessing' }
OSSDL3EventHandler >> nextHandler [

	^ nextHandler
]

{ #category : 'accessing' }
OSSDL3EventHandler >> nextHandler: anObject [

	nextHandler := anObject
]

{ #category : 'visiting' }
OSSDL3EventHandler >> visitMappedEvent: anEvent [
	"Fallback: forward to the next handler if it exists"

	^ self forwardToNextHandler: anEvent
]
