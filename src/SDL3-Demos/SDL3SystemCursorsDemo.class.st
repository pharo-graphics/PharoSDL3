"
I demonstrate how to change the system mouse cursor.
Click anywhere in the window to cycle through available cursors.
"
Class {
	#name : 'SDL3SystemCursorsDemo',
	#superclass : 'SDL3ConsoleDemoApp',
	#instVars : [
		'cursorGenerator'
	],
	#category : 'SDL3-Demos-API',
	#package : 'SDL3-Demos',
	#tag : 'API'
}

{ #category : 'accessing' }
SDL3SystemCursorsDemo >> initialExtent [

	^ 400 @ 300
]

{ #category : 'initialization' }
SDL3SystemCursorsDemo >> initialize [

	super initialize.
	self log: 'Click to change to next System Cursor.'.
	cursorGenerator := Generator on: [ :g |
		[ SDL3SystemCursor allValues
			do: [ :each | g yield: each ] ] repeat ]
]

{ #category : 'hooks' }
SDL3SystemCursorsDemo >> step [

	self clearColor: Color blue muchDarker.
	self present
]

{ #category : 'hooks' }
SDL3SystemCursorsDemo >> visitMouseButtonDownEvent: aMouseButtonDownEvent [

	super visitMouseButtonDownEvent: aMouseButtonDownEvent.
	
	[
		| cursorId cursor |
		cursorId := cursorGenerator next.
		cursor := sdl newSystemCursor: cursorId.
		"cursor assertNotNullReturn.
		sdl assertSuccess:" (sdl setCursor: cursor).
		self log: cursorId item
	] value
]
