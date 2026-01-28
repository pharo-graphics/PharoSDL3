Extension { #name : 'SDL3PathInfo' }

{ #category : '*SDL3-Own' }
SDL3PathInfo >> printOn: aStream [

	super printOn: aStream.

	aStream
		nextPutAll: ' size: ';
		print: self size.
	aStream
		nextPutAll: ' access: ';
		print: self accessTime.
	aStream
		nextPutAll: ' create: ';
		print: self createTime.
	aStream
		nextPutAll: ' modify: ';
		print: self modifyTime
]
