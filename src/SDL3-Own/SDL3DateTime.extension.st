Extension { #name : 'SDL3DateTime' }

{ #category : '*SDL3-Own' }
SDL3DateTime >> asDateAndTime [

	^ DateAndTime
		  year: self year
		  month: self month
		  day: self day
		  hour: self hour
		  minute: self minute
		  second: self second
		  nanoSecond: self nanosecond
		  offset: self utcOffset seconds
]

{ #category : '*SDL3-Own' }
SDL3DateTime >> printOn: aStream [

	super printOn: aStream.

	aStream
		nextPut: $(;
		print: self asDateAndTime;
		nextPut: $)
]
