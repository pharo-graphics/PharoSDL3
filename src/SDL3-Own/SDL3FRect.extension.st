Extension { #name : 'SDL3FRect' }

{ #category : '*SDL3-Own' }
SDL3FRect >> extent [

	^ self w @ self h
]

{ #category : '*SDL3-Own' }
SDL3FRect class >> newFrom: aRectangle [

	^ self origin: aRectangle origin extent: aRectangle extent
]

{ #category : '*SDL3-Own' }
SDL3FRect >> origin [

	^ self x @ self y
]

{ #category : '*SDL3-Own' }
SDL3FRect class >> origin: origin extent: extent [

	^ self
		 x: origin x
		 y: origin y
		 width: extent x
		 height: extent y
]

{ #category : '*SDL3-Own' }
SDL3FRect >> updateFrom: aRectangle [

	self
		x: aRectangle origin x asFloat;
		y: aRectangle origin y asFloat;
		w: aRectangle width asFloat;
		h: aRectangle height asFloat
]

{ #category : '*SDL3-Own' }
SDL3FRect class >> x: x y: y width: w height: h [

	^ self new
		 x: x;
		 y: y;
		 w: w;
		 h: h;
		 yourself
]
