Extension { #name : 'SDL3Rect' }

{ #category : '*SDL3-Own' }
SDL3Rect >> asRectangle [

	^ self origin extent: self extent
]

{ #category : '*SDL3-Own' }
SDL3Rect >> extent [

	^ self w @ self h
]

{ #category : '*SDL3-Own' }
SDL3Rect class >> newFrom: aRectangle [
	^ self new
		x: aRectangle origin x asInteger;
		y: aRectangle origin y asInteger;
		w: aRectangle width asInteger;
		h: aRectangle height asInteger;
		yourself
]

{ #category : '*SDL3-Own' }
SDL3Rect >> origin [

	^ self x @ self y
]

{ #category : '*SDL3-Own' }
SDL3Rect >> printOn: aStream [

	self asRectangle printOn: aStream
]
