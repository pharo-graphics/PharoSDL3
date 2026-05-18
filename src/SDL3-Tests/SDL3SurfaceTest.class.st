Class {
	#name : 'SDL3SurfaceTest',
	#superclass : 'SDL3Test',
	#category : 'SDL3-Tests-Library',
	#package : 'SDL3-Tests',
	#tag : 'Library'
}

{ #category : 'running' }
SDL3SurfaceTest >> newIconForm [

	^ Form
		extent: 16 @ 16
		depth: 32
		fromArray: #(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 4289374634 4280690213 4282467139 4281811785 4286217083 0 0 0 0 0 0 0 0 0 0 0 4279900698 4289771447 4283150819 4278686942 4278602609 4281216819 4292862175 0 0 0 0 0 0 0 0 4292598747 4278519045 4291812321 4278425828 4278229220 4278360034 4278533726 4281676595 0 0 0 0 0 0 0 0 4293059298 4278781959 4289902007 4280591330 4278294757 4278359779 4278618315 4278454800 4287730065 0 0 0 0 4293717228 4289835441 4291743438 4288782753 4278782730 4283980117 4287155693 4278294756 4278360036 4278425831 4278725183 4281348657 0 0 0 4293190884 4281413937 4281677109 4278387459 4278584069 4278457889 4278717198 4285372595 4278753764 4278359781 4278556389 4278468957 4278650887 0 0 0 4286019447 4284243036 4283914071 4278781702 4285033581 4279932888 4278683597 4278490589 4278490848 4278620633 4278621404 4278591793 4279242768 0 0 0 4283519312 4285295466 4290165174 4290164405 4294638071 4282232039 4278491363 4278620380 4278723896 4278519564 4278389263 4278387459 4285427310 0 0 0 4285887863 4280431419 4286696174 4290634484 4286170860 4278818529 4278619863 4278661191 4278913293 4285493359 4284177243 4288585374 4294177779 0 0 0 4291480781 4278322439 4278614713 4278490852 4278622435 4278613940 4278458404 4278321667 4278518531 4288914340 0 0 0 0 0 0 0 4281018922 4278464064 4278359263 4278491102 4278724669 4278518276 4278387461 4278321666 4282532418 0 0 0 0 0 0 4292730333 4279045132 4278584327 4278665827 4278489307 4278621404 4278480807 4278595138 4278453252 4281677109 0 0 0 0 0 0 4284900966 4278848010 4283650898 4278781962 4278523682 4278726730 4278592304 4278454027 4278519045 4287861651 0 0 0 0 0 0 4280887593 4290493371 0 4290822079 4284308832 4280163615 4279439633 4281611320 4288322202 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
		offset: 0 @ 0
]

{ #category : 'tests' }
SDL3SurfaceTest >> testColorAt [

	| surface extent color |
	color := Color purple.
	extent := 300@200.	

	surface := sdl newSurfaceWidth: extent x height: extent y format: SDL3PixelFormat argb8888.
	surface clearColor: color.

	self assert: surface extent equals: extent.
	self assert: surface pitch equals: surface w * FFIUInt32 externalTypeSize.

	0 to: extent x - 1 do: [ :x |
		0 to: extent y - 1 do: [ :y |
			self assert: (surface colorAtX: x y: y) equals: color ] ].

	surface destroy
]

{ #category : 'tests' }
SDL3SurfaceTest >> testFormAsSurface [

	| form surface |
	form := self newIconForm.
	surface := form asUnownedNewSDL3Surface.

	self assert: surface w equals: form width.
	self assert: surface h equals: form height.

	0 to: form width - 1 do: [ :x |
		0 to: form height - 1 do: [ :y |
			| actualColor expectedColor |
			expectedColor := form colorAt: x@y.
			actualColor := surface colorAtX: x y: y.

			#(red green blue alpha) do: [ :selector |
				self
					assert: (actualColor perform: selector)
					closeTo: (expectedColor perform: selector)
					precision: 0.001 ] ] ].

	surface destroy
]

{ #category : 'tests' }
SDL3SurfaceTest >> testFormAsSurfaceAsForm [

	| form form2 surface |
	form := self newIconForm.
	surface := form asUnownedNewSDL3Surface.
	form2 := surface asForm.

	self assert: form2 width equals: form width.
	self assert: form2 height equals: form height.

	0 to: form width - 1 do: [ :x |
		0 to: form height - 1 do: [ :y |

			| currentPoint actualColor expectedColor |
			currentPoint := x@y.
			expectedColor := form colorAt: currentPoint.
			actualColor := form2 colorAt: currentPoint.

			self assert: actualColor equals: expectedColor ] ].

	surface destroy
]

{ #category : 'tests' }
SDL3SurfaceTest >> testSaveAndLoadPNG [

	| extent color filePathString surface loadedSurface |
	color := Color purple.
	extent := 100@50.	
	filePathString := 'sdl3.png'.
	filePathString asFileReference ensureDelete.

	surface := sdl newSurfaceWidth: extent x height: extent y format: SDL3PixelFormat argb8888.
	surface clearColor: color.

	self deny: filePathString asFileReference exists.
	surface savePNGFile: filePathString.
	self assert: filePathString asFileReference exists.

	loadedSurface := LibSDL3 uniqueInstance loadPNG: filePathString.

	self assert: loadedSurface extent equals: surface extent.
	self assert: loadedSurface pitch equals: surface pitch.
	self assert: (loadedSurface colorAtX: 5 y: 5) equals: color.
	self assert: (surface colorAtX: 5 y: 5) equals: color.

	filePathString asFileReference ensureDelete.
	surface destroy.
	loadedSurface destroy
]
