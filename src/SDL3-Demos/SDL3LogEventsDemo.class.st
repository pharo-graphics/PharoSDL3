"
I log all received SDL3 events to an on-screen console.
"
Class {
	#name : 'SDL3LogEventsDemo',
	#superclass : 'SDL3ConsoleDemoApp',
	#category : 'SDL3-Demos-API',
	#package : 'SDL3-Demos',
	#tag : 'API'
}

{ #category : 'hooks' }
SDL3LogEventsDemo >> handleEvent: aSDL3MappedEvent [

	self log: aSDL3MappedEvent description.
	super handleEvent: aSDL3MappedEvent
]

{ #category : 'accessing' }
SDL3LogEventsDemo >> initialExtent [

	^ 600 @ 800
]

{ #category : 'hooks' }
SDL3LogEventsDemo >> step [

	self clearColor: Color blue muchDarker.
	self present
]
