Extension { #name : 'SDL3FPoint' }

{ #category : '*SDL3-Additions' }
SDL3FPoint class >> newFrom: aPoint [

	^ self x: aPoint x y: aPoint y
]

{ #category : '*SDL3-Additions' }
SDL3FPoint class >> x: x y: y [

	^ self new
		 x: x;
		 y: y;
		 yourself
]
