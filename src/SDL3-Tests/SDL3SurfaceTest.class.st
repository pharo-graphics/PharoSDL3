Class {
	#name : 'SDL3SurfaceTest',
	#superclass : 'SDL3Test',
	#category : 'SDL3-Tests-Library',
	#package : 'SDL3-Tests',
	#tag : 'Library'
}

{ #category : 'tests' }
SDL3SurfaceTest >> testAsForm [

	| form surface form2 |
	form := self iconNamed: #pharoBig.
	surface := form asUnownedNewSDL3Surface.
	form2 := surface asForm.

	self assert: form2 width equals: form width.
	self assert: form2 height equals: form height.

	0 to: form width - 1 do: [ :x |
		0 to: form height - 1 do: [ :y |

			| currentPoint actualColor expectedColor |
			currentPoint := x@y.
			actualColor := form colorAt: currentPoint.
			expectedColor := form2 colorAt: currentPoint.

			self assert: actualColor equals: expectedColor ] ].

	surface destroy
]

{ #category : 'tests' }
SDL3SurfaceTest >> testAsUnownedNewSDL3Surface [

	| form surface |
	form := self iconNamed: #pharoBig.
	surface := form asUnownedNewSDL3Surface.

	self assert: surface w equals: form width.
	self assert: surface h equals: form height.
	self assert: surface pitch equals: form stride.

	0 to: form width - 1 do: [ :x |
		0 to: form height - 1 do: [ :y |
			| actualColor expectedColor |
			actualColor := form colorAt: x@y.
			expectedColor := surface colorAtX: x y: y.

			self assert: actualColor equals: expectedColor ] ].

	surface destroy
]
