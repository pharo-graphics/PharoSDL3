"
I know how to efficiently convert any `SDL3Event` as its corresponding `SDL3MappedEvent`.

To optimize eficciency, keep the instance of myself, i.e. avoid initializing the internal convertion dictionary on each event.
"
Class {
	#name : 'SDL3EventMap',
	#superclass : 'Object',
	#instVars : [
		'eventClassByTypeNumber'
	],
	#category : 'SDL3-Own',
	#package : 'SDL3-Own'
}

{ #category : 'accessing' }
SDL3EventMap >> eventClassFor: typeNumber [

	^ eventClassByTypeNumber at: typeNumber ifAbsent: [ SDL3CommonEvent ]
]

{ #category : 'initialization' }
SDL3EventMap >> initialize [

	super initialize.

	eventClassByTypeNumber := Dictionary new.

	SDL3MappedEvent allSubclassesDo: [ :eachEventClass |
		eachEventClass eventTypes do: [ :eachEventType |
			eventClassByTypeNumber at: eachEventType value put: eachEventClass ] ]
]

{ #category : 'accessing' }
SDL3EventMap >> value: aSDL3Event [
	"Answer a `SDL3MappedEvent` that corresponds to a `SDL3Event`."

	| eventClass |
	eventClass := self eventClassFor: aSDL3Event type.

	"Inspired on FFIUnion's generated accessors (e.g. SDL3Event>>#display)"
	^ eventClass fromHandle:
		(aSDL3Event getHandle
			referenceStructAt: 1
			length: eventClass byteSize)
]
