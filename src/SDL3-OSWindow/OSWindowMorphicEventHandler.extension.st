Extension { #name : 'OSWindowMorphicEventHandler' }

{ #category : '*SDL3-OSWindow' }
OSWindowMorphicEventHandler >> visitWindowCloseEvent: anEvent [
	anEvent suppressDefaultAction.

	morphicWorld defer: [
		morphicWorld worldState worldRenderer handleOSWindowCloseEvent: anEvent ]
]

{ #category : '*SDL3-OSWindow' }
OSWindowMorphicEventHandler >> visitWindowExposeEvent: anEvent [
	"Completely redraw world when visible part of window changes to prevent some graphical glitches"

	morphicWorld defer: [ morphicWorld worldState doFullRepaint ]
]

{ #category : '*SDL3-OSWindow' }
OSWindowMorphicEventHandler >> visitWindowResizeEvent: anEvent [

	"window resized"
	morphicWorld defer: [
		morphicWorld worldState worldRenderer checkForNewScreenSize ]
]

{ #category : '*SDL3-OSWindow' }
OSWindowMorphicEventHandler >> visitWindowResolutionChangeEvent: anEvent [

	morphicWorld defer: [
		morphicWorld worldState updateToNewResolution: anEvent ]
]
