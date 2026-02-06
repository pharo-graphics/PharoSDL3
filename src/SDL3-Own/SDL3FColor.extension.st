Extension { #name : 'SDL3FColor' }

{ #category : '*SDL3-Own' }
SDL3FColor >> asColor [

	^ Color r: self r g: self g b: self b alpha: self a
]

{ #category : '*SDL3-Own' }
SDL3FColor >> printOn: aStream [

	super printOn: aStream.
	aStream
		nextPutAll: '(r: ';
		print: self r;
		nextPutAll: ' g: ';
		print: self g;
		nextPutAll: ' b: ';
		print: self b;
		nextPutAll: ' a: ';
		print: self a;
		nextPutAll: ')'
]

{ #category : '*SDL3-Own' }
SDL3FColor class >> r: red g: green b: blue a: alpha [

	^ self new
		r: red;
		g: green;
		b: blue;
		a: alpha;
		yourself
]

{ #category : '*SDL3-Own' }
SDL3FColor >> updateFrom: aPharoColor [

	self
		r: aPharoColor red;
		g: aPharoColor green;
		b: aPharoColor blue;
		a: aPharoColor alpha
]
