"
I am an external array of null-terminated C strings (const char * const *), terminated with a trailing NULL pointer.

I manage the external memory for both the individual C strings and the contiguous pointer array buffer.

The sender is responsible for freeing me using #dispose or #free.
"
Class {
	#name : 'SDL3NullTerminatedStringArray',
	#superclass : 'SDL3Array',
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'instance creation' }
SDL3NullTerminatedStringArray class >> unownedFromStrings: aCollectionOfStrings [
	"Answer a new C string array populated with C strings from aCollectionOfStrings, terminated with a NULL pointer.
	The sender is responsible for freeing it using #dispose or #free."

	| array |
	array := self unownedNewType: 'char*' size: aCollectionOfStrings size + 1.
	1 to: aCollectionOfStrings size do: [ :index |
	array at: index put: (ExternalAddress fromString: (aCollectionOfStrings at: index)) ].
	array at: aCollectionOfStrings size + 1 put: ExternalAddress null.
	^ array
]

{ #category : 'finalization' }
SDL3NullTerminatedStringArray >> free [
	"Free all allocated string pointers, then free the array buffer itself."

	(handle isNil or: [ handle isNull ]) ifTrue: [ ^ self ].

	1 to: size do: [ :index |
		| stringAddress |
		stringAddress := self at: index.
		stringAddress isNull ifFalse: [
			stringAddress free.
			self at: index put: ExternalAddress null ] ].

	super free
]
