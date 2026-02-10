Extension { #name : 'SDL3KeyboardEvent' }

{ #category : '*SDL3-Own' }
SDL3KeyboardEvent >> isDown [

	^ self down
]

{ #category : '*SDL3-Own' }
SDL3KeyboardEvent >> isRepeat [

	^ self repeat
]

{ #category : '*SDL3-Own' }
SDL3KeyboardEvent >> printOn: aStream [

	super printOn: aStream.

	aStream
		nextPutAll: ' key: ';
		nextPutAll:
			(SDL3Keycode
				itemAt: self key
				ifAbsent: [ 'Unknown' ]).

	aStream
		nextPutAll: ' scancode: ';
		print: self scancode item.

	aStream
		nextPutAll: ' isDown: ';
		print: self isDown.

	aStream
		nextPutAll: ' isRepeat: ';
		print: self isRepeat
]
