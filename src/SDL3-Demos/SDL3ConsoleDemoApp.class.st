"
I am a specialized `SDL3RendererDemoApp` designed for demos that require an on-screen scrolling log (a console).

I add the `console` instance variable which provides a simple on-screen buffer. My `#present` method automatically renders the console before presenting the renderer.
"
Class {
	#name : 'SDL3ConsoleDemoApp',
	#superclass : 'SDL3RendererDemoApp',
	#instVars : [
		'console'
	],
	#category : 'SDL3-Demos-Base',
	#package : 'SDL3-Demos',
	#tag : 'Base'
}

{ #category : 'testing' }
SDL3ConsoleDemoApp class >> isAbstract [

	^ self == SDL3ConsoleDemoApp
]

{ #category : 'initialization' }
SDL3ConsoleDemoApp >> initialize [

	super initialize.
	
	console := SDL3Console new
]

{ #category : 'renderer' }
SDL3ConsoleDemoApp >> present [

	"Render the console logs before present"
	console renderOn: renderer.
	
	super present
]
