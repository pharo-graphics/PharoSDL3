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
SDL3LogEventsDemo >> step [

	self clearColor: Color black.
	self present
]

{ #category : 'visiting - abstract' }
SDL3LogEventsDemo >> visitDisplayEvent: anEvent [

	console addLine: anEvent description color: Color lightRed
]

{ #category : 'visiting - abstract' }
SDL3LogEventsDemo >> visitKeyboardEvent: anEvent [

	console addLine: anEvent description color: Color lightCyan
]

{ #category : 'visiting - root' }
SDL3LogEventsDemo >> visitMappedEvent: anEvent [

	console addLine: anEvent description color: Color white
]

{ #category : 'visiting - abstract' }
SDL3LogEventsDemo >> visitMouseEvent: anEvent [

	console addLine: anEvent description color: Color lightGreen
]

{ #category : 'visiting - abstract' }
SDL3LogEventsDemo >> visitTextEvent: anEvent [

	console addLine: anEvent description color: Color lightCyan
]

{ #category : 'visiting - abstract' }
SDL3LogEventsDemo >> visitTouchFingerEvent: anEvent [

	console addLine: anEvent description color: Color lightBlue
]

{ #category : 'visiting - abstract' }
SDL3LogEventsDemo >> visitWindowEvent: anEvent [

	console addLine: anEvent description color: Color lightYellow
]
