"
I demonstrate how to handle multi-touch pinch-to-zoom events.
"
Class {
	#name : 'SDL3TouchpadPinchToZoomDemo',
	#superclass : 'SDL3ConsoleDemoApp',
	#instVars : [
		'zoom',
		'texture',
		'textureRectangle'
	],
	#category : 'SDL3-Demos-API',
	#package : 'SDL3-Demos',
	#tag : 'API'
}

{ #category : 'lifecycle' }
SDL3TouchpadPinchToZoomDemo >> close [

	texture ifNotNil: [ 
		texture destroy.
		texture := nil ].
	super close
]

{ #category : 'accessing' }
SDL3TouchpadPinchToZoomDemo >> initialExtent [

	^ 600 @ 400
]

{ #category : 'initialization' }
SDL3TouchpadPinchToZoomDemo >> initialize [

	super initialize.
	zoom := 1.0
]

{ #category : 'lifecycle' }
SDL3TouchpadPinchToZoomDemo >> prepareToLoop [

	super prepareToLoop.

	texture := renderer newTextureFromForm: (self iconNamed: #pharoBig).
	textureRectangle := SDL3FRect x: 0 y: 0 width: texture w height: texture h
]

{ #category : 'hooks' }
SDL3TouchpadPinchToZoomDemo >> step [

	self clearColor: Color blue muchDarker.
	
	renderer renderScaleX: zoom scaleY: zoom.
	
	renderer renderTexture: texture srcrect: nil dstrect: textureRectangle.
	
	self console clear.
	self log: 'Zoom: ', (zoom roundTo: 0.01) asString.
	self log: 'Pinch to zoom. Use your touchpad!'.
	self present
]

{ #category : 'visiting - concrete' }
SDL3TouchpadPinchToZoomDemo >> visitPinchFingerUpdateEvent: aPinchFingerUpdateEvent [

	super visitPinchFingerUpdateEvent: aPinchFingerUpdateEvent.
	
	zoom := zoom * aPinchFingerUpdateEvent scale
]
