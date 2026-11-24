"
I represent a single interactive keybinding in an SDL3App, pairing an SDL3 keycode with a human-readable description and an executable action block.
"
Class {
	#name : 'SDL3KeyBinding',
	#superclass : 'Object',
	#instVars : [
		'key',
		'description',
		'action'
	],
	#category : 'SDL3-Demos-Base',
	#package : 'SDL3-Demos',
	#tag : 'Base'
}

{ #category : 'instance creation' }
SDL3KeyBinding class >> key: aKey description: aString action: aBlock [

	^ self basicNew
		initializeKey: aKey description: aString action: aBlock;
		yourself
]

{ #category : 'accessing' }
SDL3KeyBinding >> action [

	^ action
]

{ #category : 'accessing' }
SDL3KeyBinding >> description [

	^ description
]

{ #category : 'evaluating' }
SDL3KeyBinding >> executeWithEvent: aKeyboardEvent [

	^ action cull: aKeyboardEvent
]

{ #category : 'initialization' }
SDL3KeyBinding >> initializeKey: aKey description: aString action: aBlock [

	self initialize.
	key := aKey.
	description := aString.
	action := aBlock
]

{ #category : 'accessing' }
SDL3KeyBinding >> key [

	^ key
]

{ #category : 'accessing' }
SDL3KeyBinding >> keyName [
	"Answer the human-readable string for this binding's key."

	^ SDL3Library uniqueInstance getKeyName: key
]

{ #category : 'testing' }
SDL3KeyBinding >> matchesKey: aKeycodeOrInteger [

	^ key asInteger = aKeycodeOrInteger asInteger
]

{ #category : 'printing' }
SDL3KeyBinding >> printOn: aStream [

	super printOn: aStream.
	aStream
		nextPut: $(;
		nextPutAll: self keyName;
		nextPutAll: ' -> ';
		nextPutAll: description;
		nextPut: $)
]
