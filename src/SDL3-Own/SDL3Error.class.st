"
I represent an error in a SDL3 FFI call.
"
Class {
	#name : 'SDL3Error',
	#superclass : 'Error',
	#category : 'SDL3-Own',
	#package : 'SDL3-Own'
}

{ #category : 'accessing' }
SDL3Error >> messageText [

	(messageText isNil or: [ messageText isEmpty ]) ifTrue: [
		messageText := 'Unknown error in a SDL3 FFI call' ].
	^ messageText
]
