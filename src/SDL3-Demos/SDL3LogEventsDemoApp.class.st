"
I log all received SDL3 events to an on-screen console.
"
Class {
	#name : 'SDL3LogEventsDemoApp',
	#superclass : 'SDL3ConsoleDemoApp',
	#category : 'SDL3-Demos-API',
	#package : 'SDL3-Demos',
	#tag : 'API'
}

{ #category : 'hooks' }
SDL3LogEventsDemoApp >> step [

	self clearColor: Color black.
	self present
]

{ #category : 'visiting - abstract' }
SDL3LogEventsDemoApp >> visitDisplayEvent: anEvent [

	console addLine: anEvent description color: Color lightRed
]

{ #category : 'visiting - abstract' }
SDL3LogEventsDemoApp >> visitKeyboardEvent: anEvent [

	console addLine: anEvent description color: Color lightCyan
]

{ #category : 'visiting - root' }
SDL3LogEventsDemoApp >> visitMappedEvent: anEvent [

	console addLine: anEvent description color: Color white
]

{ #category : 'visiting - abstract' }
SDL3LogEventsDemoApp >> visitMouseEvent: anEvent [

	console addLine: anEvent description color: Color lightGreen
]

{ #category : 'visiting - abstract' }
SDL3LogEventsDemoApp >> visitTextEvent: anEvent [

	console addLine: anEvent description color: Color lightCyan
]

{ #category : 'visiting - abstract' }
SDL3LogEventsDemoApp >> visitTouchFingerEvent: anEvent [

	console addLine: anEvent description color: Color lightBlue
]

{ #category : 'visiting - abstract' }
SDL3LogEventsDemoApp >> visitWindowEvent: anEvent [

	console addLine: anEvent description color: Color lightYellow
]
