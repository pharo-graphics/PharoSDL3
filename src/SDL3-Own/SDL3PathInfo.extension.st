Extension { #name : 'SDL3PathInfo' }

{ #category : '*SDL3-Own' }
SDL3PathInfo >> accessDateAndTime [

	^ self ffiLibrary timeToDateAndTime: self accessTime
]

{ #category : '*SDL3-Own' }
SDL3PathInfo >> createDateAndTime [

	^ self ffiLibrary timeToDateAndTime: self createTime
]

{ #category : '*SDL3-Own' }
SDL3PathInfo >> modifyDateAndTime [

	^ self ffiLibrary timeToDateAndTime: self modifyTime
]

{ #category : '*SDL3-Own' }
SDL3PathInfo >> printOn: aStream [

	super printOn: aStream.

	aStream
		nextPutAll: ' size: ';
		print: self size.
	aStream
		nextPutAll: ' access: ';
		print: self accessDateAndTime.
	aStream
		nextPutAll: ' create: ';
		print: self createDateAndTime.
	aStream
		nextPutAll: ' modify: ';
		print: self modifyDateAndTime
]
