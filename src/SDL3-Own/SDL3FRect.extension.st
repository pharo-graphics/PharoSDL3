Extension { #name : 'SDL3FRect' }

{ #category : '*SDL3-Own' }
SDL3FRect class >> x: x y: y width: w height: h [

	^ self new
		  x: x;
		  y: y;
		  w: w;
		  h: h;
		  yourself
]
