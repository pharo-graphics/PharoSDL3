"
I am an abstract superclass for SDL3 applications that use the standard 2D Renderer API with a single window.

I automate the creation and lifecycle of the `SDL3Renderer` and provide convenience methods for drawing text and clearing the screen.

I am the 2D-centric sibling of `SDL3GPUDemoApp`.
"
Class {
	#name : 'SDL3RendererDemoApp',
	#superclass : 'SDL3SingleWindowApp',
	#instVars : [
		'renderer'
	],
	#category : 'SDL3-Demos-Base',
	#package : 'SDL3-Demos',
	#tag : 'Base'
}

{ #category : 'testing' }
SDL3RendererDemoApp class >> isAbstract [

	^ self == SDL3RendererDemoApp
]

{ #category : 'renderer' }
SDL3RendererDemoApp >> clear [

	renderer renderClear
]

{ #category : 'renderer' }
SDL3RendererDemoApp >> clearColor: aColor [

	renderer renderDrawColor: aColor.
	renderer renderClear
]

{ #category : 'lifecycle' }
SDL3RendererDemoApp >> close [

	renderer ifNotNil: [
		renderer destroy.
		renderer := nil ].
		
	super close
]

{ #category : 'renderer' }
SDL3RendererDemoApp >> color: aColor [

	renderer renderDrawColor: aColor
]

{ #category : 'lifecycle' }
SDL3RendererDemoApp >> initializeRenderer [

	renderer := window newRenderer
]

{ #category : 'lifecycle' }
SDL3RendererDemoApp >> open [

	super open.

	self initializeRenderer
]

{ #category : 'renderer' }
SDL3RendererDemoApp >> present [

	renderer renderPresent
]

{ #category : 'renderer' }
SDL3RendererDemoApp >> showText: aString x: x y: y [

	renderer
		renderDebugTextX: x
		y: y
		str: aString
]

{ #category : 'renderer' }
SDL3RendererDemoApp >> showText: aString x: x y: y color: aColor [

	renderer renderDrawColor: aColor.
	renderer
		renderDebugTextX: x
		y: y
		str: aString
]
