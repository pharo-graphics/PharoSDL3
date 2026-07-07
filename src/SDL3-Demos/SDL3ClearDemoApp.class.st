"
I open a window with a renderer and use it for a simple animation: clear the background with sequence of colors.
"
Class {
	#name : 'SDL3ClearDemoApp',
	#superclass : 'SDL3RendererDemoApp',
	#category : 'SDL3-Demos-API',
	#package : 'SDL3-Demos',
	#tag : 'API'
}

{ #category : 'accessing' }
SDL3ClearDemoApp >> initialExtent [

	^ 400 @ 300
]

{ #category : 'hooks' }
SDL3ClearDemoApp >> step [

	| animatedHue |
	animatedHue := (Time millisecondClockValue / 10.0) \\ 360.
	
	self clearColor: (Color h: animatedHue s: 1.0 v: 1.0).
	self present
]
