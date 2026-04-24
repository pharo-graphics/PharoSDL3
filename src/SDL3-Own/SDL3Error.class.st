"
I represent an error in a SDL3 FFI call.
"
Class {
	#name : 'SDL3Error',
	#superclass : 'Error',
	#category : 'SDL3-Own',
	#package : 'SDL3-Own'
}

{ #category : 'signalling' }
SDL3Error class >> signalFromLibraryErrorMessage [

	| errorMessage |
	errorMessage :=
		LibSDL3 uniqueInstance getError
			ifEmpty: [ 'Unknown error in a SDL3 FFI call' ].

	^ self new signal: errorMessage
]

{ #category : 'accessing' }
SDL3Error >> messageText [

	(messageText isNil or: [ messageText isEmpty ]) ifTrue: [
		messageText := 'Unknown error in a SDL3 FFI call' ].
	^ messageText
]
