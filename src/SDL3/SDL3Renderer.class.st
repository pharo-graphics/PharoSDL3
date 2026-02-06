Class {
	#name : 'SDL3Renderer',
	#superclass : 'SDL3BaseObject',
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'rendering' }
SDL3Renderer >> renderDrawColor: aColor [

	^ self
		  renderDrawColorFloatR: aColor red
		  g: aColor green
		  b: aColor blue
		  a: aColor alpha
]
